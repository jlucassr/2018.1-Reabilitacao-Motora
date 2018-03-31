#! /bin/sh
project="Reabilitacao-Motora"

echo "Initializing Build Script for $project"
echo "========================================"

echo "Opening $project in order to update meta files"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-silent-crashes \
-logFile $(pwd)/$project/unity.log \
-projectPath $(pwd)/$project \
-quit
echo "========================================"

echo "Attempting to build $project for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-silent-crashes \
-logFile $(pwd)/$project/unity.log \
-projectPath $(pwd)/$project \
-executeMethod MyBuild.Perform \
-buildWindowsPlayer "$(pwd)/$project/Build/windows/$project.exe" \
-quit

echo "Attempting to build $project for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-silent-crashes \
-logFile $(pwd)/$project/unity.log \
-projectPath $(pwd)/$project \
-executeMethod MyBuild.Perform \
-buildOSXUniversalPlayer "$(pwd)/$project/Build/osx/$project.app" \
-quit

echo "Attempting to build $project for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-silent-crashes \
-logFile $(pwd)/$project/unity.log \
-projectPath $(pwd)/$project \
-executeMethod MyBuild.Perform \
-buildLinuxUniversalPlayer "$(pwd)/$project/Build/linux/$project.exe" \
-quit

echo 'Logs from build'
cat $(pwd)/$project/unity.log


echo 'Attempting to zip builds'
zip -r $(pwd)/$project/Build/linux.zip $(pwd)/$project/Build/linux/
zip -r $(pwd)/$project/Build/mac.zip $(pwd)/$project/Build/osx/
zip -r $(pwd)/$project/Build/windows.zip $(pwd)/$project/Build/windows/