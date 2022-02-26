#!/bin/sh -l

echo "Downloading & installing catalog-api"
catalog_api_version="$1"
catalog_api_os="linux"
catalog_api_arch="amd64"
catalog_api_filename="catalog-api_${catalog_api_version}_${catalog_api_os}_${catalog_api_arch}.tar.gz"
catalog_api_url="https://github.com/sensu/catalog-api/releases/download/${catalog_api_version}/${catalog_api_filename}"
echo "URL: ${catalog_api_url}"
curl -L "$catalog_api_url" | gunzip -c | tar -x -C /usr/bin

echo "Validating Catalog"
catalog-api catalog validate
