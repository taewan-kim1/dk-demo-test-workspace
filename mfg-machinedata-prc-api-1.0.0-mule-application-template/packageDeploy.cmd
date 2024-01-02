@echo off
:: This script packages and deploys an API
set ENV_PROFILE=CloudHub-MFG-DEV
echo Cleaning and building deployment package...
call mvn clean package -DskipTests
echo Deploying to %ENV_PROFILE%...
call mvn mule:deploy -P%ENV_PROFILE% -DmuleDeploy
echo Done.
