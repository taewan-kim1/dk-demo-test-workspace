%dw 2.0
output application/json skipNullOn = "everywhere"
---
/**
 * Generates response object which includes attributes and data values for the OSI PI points.
 * @table Source field, Target field, Description
 * @row machineId, attributes.descriptor, machine id in OSI PI where entity was measured
 * @row name, attributes.tagName, name of the PI point
 * @row description, attributes.descriptor, description of the PI point.  Note that this field is used to store machine id
 * @row oilLevel, data.value, last captured data value for the Oil Level PI point 
 * @row oilUnit, attributes.units, measurement unit for the Oil Level PI point
 * @row vibrationDelta, data.value, last captured data value for the Vibration Delta PI point 
 * @row vibrationUnit, attributes.units, measurement unit for the Vibration Delta PI point
 * @row noiseLevel, data.value, last captured data value for the Noise Level PI point
 * @row noiseUnit, attributes.units, measurement unit for the Noise Level PI point
 * @row temperature, data.value, last captured data value for the Temperature PI point
 * @row tempUnit, attributes.units, measurement unit for the Temperature PI point
 * @row location, USA, location of the PI point
 * @row source, OSIPI, source of the PI point
 * @row comments, comment, any notes
 * @row reason, reason, purpose of capturing data
 * @row createdDate, data.timestamp, time stamp when this data was captured
 * @row createdBy, application name, name of the application capturing this data
 * @row updatedDate, data.timestamp, time stamp when this data was updated
 * @row updatedBy, application name, name of the application updating this data
 * @row isDeleted, flag, flag to indicate it this data was deleted
 */
 
payload map {
  "machineId": $.attributes.descriptor,
  "name": $.attributes.tagName,
  "description": $.attributes.descriptor,
  "oilLevel": if($.attributes.tagName startsWith("Oil Level")) $.data.value else null,
  "oilUnit": if($.attributes.tagName startsWith("Oil Level")) $.attributes.units else null,
  "vibrationDelta": if($.attributes.tagName startsWith("Vibration Delta")) $.data.value else null,
  "vibrationUnit": if($.attributes.tagName startsWith("Vibration Delta")) $.attributes.units else null,
  "noiseLevel": if($.attributes.tagName startsWith("Noise Level")) $.data.value else null,
  "noiseUnit": if($.attributes.tagName startsWith("Noise Level")) $.attributes.units else null,
  "temperature": if($.attributes.tagName startsWith("Temperature")) $.data.value else null,
  "tempUnit": if($.attributes.tagName startsWith("Temperature")) $.attributes.units else null,
  "maintenanceStatus": if($.attributes.tagName startsWith("Maintenance")) $.data.value else null,
  "location": "USA",
  "source": "OSIPI",
  "comments": "machine data demo",
  "reason": "machine data demo",
  "auditInfo": {
    "createdDate": $.data.timestamp as DateTime as String {format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"},
    "createdBy": "mfg-dw-machinedata-sys-api",
    "updatedDate": $.data.timestamp as DateTime as String {format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"},
    "updatedBy": "mfg-dw-machinedata-sys-api",
    "isDeleted": false
  }

}