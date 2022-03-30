#!/bin/bash
set -e

cue vet :catalog -d "#IntegrationSpec" $(find integrations -name "sensu-integration.yaml" )
cue vet :catalog -d "#TypeWrapper" $(find integrations -name "sensu-resources.yaml" )

