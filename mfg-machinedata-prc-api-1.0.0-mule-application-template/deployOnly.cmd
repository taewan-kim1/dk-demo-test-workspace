@echo off
:: This script deploys an API from an existing package
set ENV_PROFILE=CloudHub-MFG-DEV
echo Deploying to %ENV_PROFILE%...
call mvn mule:deploy -P%ENV_PROFILE% -DmuleDeploy
echo Done.
