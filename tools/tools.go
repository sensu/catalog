package tools

//go:generate cue get go github.com/sensu/catalog-api/internal/api/catalog/v1
//go:generate cue get go github.com/sensu/sensu-go/api/core/v2 --exclude "HealthResponse,Claims,Version"

import (
	_ "cuelang.org/go/cmd/cue"
	_ "github.com/sensu/catalog-api"
	_ "github.com/sensu/sensu-go/api/core/v2"
)
