package pipeline.security

import rego.v1

default allow := false

# Ensure containers run without root privileges
deny contains msg if {
    input.kind == "Pod"
    container := input.spec.containers[_]
    container.securityContext.runAsNonRoot == false
    msg := sprintf("Container '%v' must enforce runAsNonRoot=true", [container.name])
}

allow if {
    count(deny) == 0
}
