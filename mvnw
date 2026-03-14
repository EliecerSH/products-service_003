#!/bin/sh
# Maven Wrapper Script
set -e

MAVEN_PROJECTBASEDIR="${MAVEN_BASEDIR:-$(pwd)}"
MAVEN_OPTS="${MAVEN_OPTS:-}"

if [ -z "$JAVA_HOME" ]; then
  JAVACMD="java"
else
  JAVACMD="$JAVA_HOME/bin/java"
fi

WRAPPER_JAR="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_PROPERTIES="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.properties"

DOWNLOAD_URL=$(grep "^wrapperUrl" "$WRAPPER_PROPERTIES" | cut -d= -f2-)
DISTRIBUTION_URL=$(grep "^distributionUrl" "$WRAPPER_PROPERTIES" | cut -d= -f2-)

if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Downloading Maven Wrapper..."
  curl -sL "$DOWNLOAD_URL" -o "$WRAPPER_JAR" 2>/dev/null || wget -q "$DOWNLOAD_URL" -O "$WRAPPER_JAR"
fi

exec "$JAVACMD" $MAVEN_OPTS \
  "-Dmaven.multiModuleProjectDirectory=$MAVEN_PROJECTBASEDIR" \
  -jar "$WRAPPER_JAR" "$@"
