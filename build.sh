#!/usr/bin/env bash

#exit if any command fails
set -e

dotnet --version
dotnet restore
dotnet build ./GeoAPI

#
# Build the project
#
xbuild /p:Configuration=Release /t:"Build" GeoAPI.sln /v:minimal
#
# Run unit tests
#
mono .testRunner/NUnit.ConsoleRunner.3.6.0/tools/nunit3-console.exe ./Release/v4.5/AnyCPU/GeoAPI.Tests.dll 
