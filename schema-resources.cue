package catalog

import "github.com/sensu/sensu-go/api/core/v2"



#Wrapper: {
	type:        string
	api_version: string
	metadata:    v2.#ObjectMeta
	spec:        {...}
}

#CoreV2Wrapper: #Wrapper & {api_version: "core/v2"}
#EnterpriseWrapper: #Wrapper
#EnterpriseWrapper: api_version: != "core/v2"
#EnterpriseWrapper: api_version: =~ "^[a-zA-Z_]+\/[a-zA-Z0-9_]+$"

_types: [v2.#APIKey,v2.#Asset,v2.#CheckConfig,v2.#Entity,v2.#Handler,v2.#Mutator,v2.#Namespace,v2.#Pipeline,v2.#Role,v2.#Secret]

#TypeWrapper: #EnterpriseWrapper | #APIKeyWrapper | #AssetWrapper | #CheckConfigWrapper | #EntityWrapper | #HandlerWrapper | #MutatorWrapper | #NamespaceWrapper | #PipelineWrapper | #RoleWrapper | #SecretWrapper | #EventFilterWrapper

#APIKeyWrapper: #CoreV2Wrapper & {
    type: "APIKey"
    spec: v2.#APIKey
}
#AssetWrapper: #CoreV2Wrapper & {
    type: "Asset"
    spec: v2.#Asset
}
#CheckConfigWrapper: #CoreV2Wrapper & {
    type: "CheckConfig"
    spec: v2.#CheckConfig
}
#EntityWrapper: #CoreV2Wrapper & {
    type: "Entity"
    spec: v2.#Entity
}
#EventFilterWrapper: #CoreV2Wrapper & {
    type: "EventFilter"
    spec: v2.#EventFilter
}
#HandlerWrapper: #CoreV2Wrapper & {
    type: "Handler"
    spec: v2.#Handler
}
#MutatorWrapper: #CoreV2Wrapper & {
    type: "Mutator"
    spec: v2.#Mutator
}
#NamespaceWrapper: #CoreV2Wrapper & {
    type: "Namespace"
    spec: v2.#Namespace
}
#PipelineWrapper: #CoreV2Wrapper & {
    type: "Pipeline"
    spec: v2.#Pipeline
}
#RoleWrapper: #CoreV2Wrapper & {
    type: "Role"
    spec: v2.#Role
}
#SecretWrapper: #CoreV2Wrapper & {
    type: "Secret"
    spec: v2.#Secret
}

