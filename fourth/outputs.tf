# output "neo_arn" {
#     value = aws_iam_user.example
#     description = "The ARN for user Neo"
# }

output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}