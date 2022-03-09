#!/bin/sh -l

catalog_api_version="$1"
temp_dir="$2"
snapshot="$3"

echo "snapshot: ${snapshot}"
exit 1

echo "Downloading & installing catalog-api"
catalog_api_os="linux"
catalog_api_arch="amd64"
catalog_api_filename="catalog-api_${catalog_api_version}_${catalog_api_os}_${catalog_api_arch}.tar.gz"
catalog_api_url="https://github.com/sensu/catalog-api/releases/download/${catalog_api_version}/${catalog_api_filename}"
echo "URL: ${catalog_api_url}"
curl -L "$catalog_api_url" | gunzip -c | tar -x -C /usr/bin


echo "Creating tmp directory for generated files"
mkdir -p ./tmp

echo "Generating Catalog API"
catalog-api catalog generate --temp-dir "$temp_dir"
chown -R 1001:1001 tmp
