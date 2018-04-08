#!/bin/bash
#
ROOT_PATH=$PWD
BUILD_PATH="$ROOT_PATH/AdAway/build/outputs/apk/release"
APP_NAME="AdAway"

# As per AdAway github readme
./gradlew renameExecutables
# Build app
./gradlew build

#sign and zipalign
java -jar sign.jar $BUILD_PATH/AdAway-release-unsigned.apk
$ROOT_PATH/zipalign -f -v 4 $BUILD_PATH/AdAway-release-unsigned.s.apk $ROOT_PATH/$APP_NAME-unofficial.apk

# cleanup
./gradlew clean
