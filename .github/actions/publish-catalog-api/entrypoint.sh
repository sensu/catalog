#!/bin/sh -l

echo "Publishing Catalog API"

aws s3 cp "$1" "s3://${AWS_S3_BUCKET}" \
    --recursive \
    --exclude version.json \
    --cache-control 'max-age=31104000' # 360 days

aws s3 cp "${1}/version.json" "s3://${AWS_S3_BUCKET}" \
    --cache-control 'no-cache' \
    --acl 'public-read'
