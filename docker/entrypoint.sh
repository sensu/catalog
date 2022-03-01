#!/bin/sh

export CATALOG_INPUT_DIR=${CATALOG_INPUT_DIR:-"/catalog"}
export CATALOG_BUILD_DIR=${CATALOG_BUILD_DIR:-"/build"}
export CATALOG_BUILD_PATH=""

check_deps() {
  for DEP in catalog-api jq
  do
    command -v ${DEP} > /dev/null 2>&1
    if [ $? -ne 0 ]; then
      echo "Missing required dependency: \"${DEP}\""
      exit 127
    fi
  done
}

validate_catalog() {
  cd ${CATALOG_INPUT_DIR}
  catalog-api catalog validate
  if [ $? -ne 0 ]; then
    echo "Error validating Catalog content..."
    exit 2
  fi
}

generate_catalog() {
  cd ${CATALOG_INPUT_DIR}
  catalog-api catalog generate -temp-dir ${CATALOG_BUILD_DIR} > build.log
  if [ $? -ne 0 ]; then
    echo "Error generating Catalog API..."
    exit 2
  else
    export CATALOG_BUILD_PATH=$(cat build.log | grep "::" | cut -d: -f5)
  fi
}

publish_catalog() {
  if [ ! -d ${CATALOG_BUILD_PATH} ]; then
    echo "Error fetching Catalog API build path..."
    exit 2
  fi
  cp -r ${CATALOG_BUILD_PATH}/* /usr/share/nginx/html/
  chmod 755 /usr/share/nginx/html/*
}

check_deps && \
validate_catalog && \
generate_catalog && \
publish_catalog