package pipeline.security

default allow = false

# Ensure containers run without root privileges
deny[msg] {
    input.kind == "Pod"
    container := input.spec.containers[_]
    container.securityContext.runAsNonRoot == false
    msg := sprintf("Container '%v' must enforce runAsNonRoot=true", [container.name])
}

allow {
    count(deny) == 0
}
