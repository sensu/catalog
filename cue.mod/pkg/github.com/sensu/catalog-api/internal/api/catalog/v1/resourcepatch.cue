// Extensions to validate resource patches

package catalogv1

#ResourcePatch: patches: [... #Patch]

#Patch: {...}
#Patch: path: =~ "\/(spec|metadata)\/.*"
#Patch: op: "add" | "replace"

