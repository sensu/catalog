package catalog

import (
	v1 "github.com/sensu/catalog-api/internal/api/catalog/v1:catalogv1"
	metav1 "github.com/sensu/catalog-api/internal/api/metadata/v1:metadatav1"
)

#IntegrationSpec: {
	api_version: v1.#APIVersion
	type:        "Integration"
	metadata:    metav1.#Metadata
	spec:        v1.#Integration
}
