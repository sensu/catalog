package catalogv1

// Constraints for Question Prompts
// Manually translated from https://github.com/sensu/sensu-enterprise-go/blob/main/dashboard/src/app/component/base/WizardForm/types.ts

#GenericField: {
	type:         string
	title?:       string
	description?: string
	readOnly?:    bool
	dependencies?: [...#FieldDependency]
	deprecated?: bool
	virtual?:    bool
}

#FieldDependency: {
	name: string
	condition: [...string]
}

#StringField: type: "string"
#StringField: {
	{#GenericField}
	default?: string
	examples?: [...string]
	format?: _
	enum?: [...string]
	enumLocale?: {...}
	const?: string
	constLocale?: {
		title?:       string
		description?: string
	}
	minLength?:    number
	maxLength?:    number
	pattern?:      string
	patternTitle?: string
	ref?:          string
	refFilter?:    string
}

#BooleanField: type: "boolean"
#BooleanField: {
	{#GenericField}
	default?: bool
	enum?: [...bool]
	enumLocale?: {...}
	const?: bool
	constLocale?: {
		title?:       string
		description?: string
	}
}

#NumberField: type: "integer" | "number"
#NumberField: {
	{#GenericField}
	default?: number
	examples?: [...number]
	format?: _
	enum?: [...number]
	enumLocale?: {...}
	const?: number
	constLocale?: {
		title?:       string
		description?: string
	}
	multipleOf?:       number
	maximum?:          number
	minimum?:          number
	exclusiveMaximum?: number
	exclusiveMinimum?: number
}

#ObjectField: type: "object"
#ObjectField: {
	{#GenericField}
	fields?: [... #Field]
	oneOf?: [... #ObjectField]
	properties?: [string]: #Field
	default?:              _
	additionalProperties?: #Field | bool
	propertyNames?:        #StringField
	required?: [...string]
	minProperties?: number
	maxProperties?: number
}

#ArrayField: type: "array"
#ArrayField: {
	{#GenericField}
	enum?: [...[...]]
	default?: [...]
	items: {{#GenericField}, ...}
	minItems?:    number
	maxItems?:    number
	uniqueItems?: bool
}

#Field: #StringField | #BooleanField | #NumberField | #ObjectField | #ArrayField

#QuestionPrompt: #Prompt
#QuestionPrompt: type:  "question"
#QuestionPrompt: input: #Field
#GenericPrompt: #Prompt & {type: !="question"}

#Integration: prompts?: [...(#GenericPrompt | #QuestionPrompt)]
