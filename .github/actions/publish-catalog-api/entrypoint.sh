#!/bin/sh -l

echo "Publishing Catalog API"

release_dir="$1"
version_file="$2"

# print dir tree
tree "#{release_dir}"

# all files except version file
aws s3 cp "$release_dir" "s3://${AWS_S3_BUCKET}" \
    --recursive \
    --exclude "$version_file" \
    --acl 'public-read' \
    --cache-control 'max-age=31104000' # 360 days

# version file
aws s3 cp "${release_dir}/version.json" "s3://${AWS_S3_BUCKET}/${version_file}" \
    --cache-control 'no-cache' \
    --acl 'public-read'
