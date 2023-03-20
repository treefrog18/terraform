# variable "names" {
#   description = "A list of names"
#   type = list(string)
#   default = [ "neo", "trinity", "morpheus" ]
# }

# output "upper_names" {
#   value = [for name in var.names : upper(name) if length(name) < 5]
# }

# variable "here_thousand_faces" {
#   description = "map"
#   type = map(string)
#   default = {
#     neo = "hero"
#     trinity = "love interest"
#     morpheus = "mentor"
#   }
# }

# output "upper_roles" {
# #   value = [for name, role in var.here_thousand_faces : "${name} is the ${role}"]
#   value = {for name, role in var.here_thousand_faces : upper(name) => upper(role)}
# }

variable "names" {
  description = "Names to render"
  type = list(string)
  default = [ "neo", "trinity", "morpheus" ]
}

output "for_directive_strip_marker" {
  value = <<EOF
  %{~ for name in var.names }
    ${name}
  %{~ endfor }
  EOF
}