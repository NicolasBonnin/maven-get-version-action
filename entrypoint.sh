#!/bin/sh -l
set -e

POM_PATH="${1-.}"
MAVEN_ADDITIONAL_ARGS="${2-}"

POM_FILE="${POM_PATH}/pom.xml"
if [ ! -f "${POM_FILE}" ]; then
  echo "::error::pom.xml not found at ${POM_FILE}"
  exit 1
fi

echo "Running: mvn -f \"${POM_FILE}\" help:evaluate -Dexpression=project.version -q -DforceStdout ${MAVEN_ADDITIONAL_ARGS}"
POM_VERSION=$(mvn -f "${POM_FILE}" help:evaluate -Dexpression=project.version -q -DforceStdout ${MAVEN_ADDITIONAL_ARGS})

if [ -z "${POM_VERSION}" ]; then
  echo "::error::Failed to extract version from ${POM_FILE}"
  exit 1
fi

echo "Found version: ${POM_VERSION}"
echo "version=${POM_VERSION}" >> "${GITHUB_OUTPUT}"
