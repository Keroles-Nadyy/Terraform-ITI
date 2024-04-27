data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_code.py"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "send_email_lambda" {
  filename         = "lambda_function_payload.zip"  
  function_name    = "send-Email"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.handler" 
  runtime          = "python3.10"

  environment {
    variables = {
      SES_SENDER_EMAIL    = var.ses_email_reciever
      SES_RECIPIENT_EMAIL = var.ses_email_reciever
    }
  }
}





# # resource "null_resource" "trigger_lambda_on_apply" {
# #   provisioner "local-exec" {
# #     command = <<EOT
# #       # Check if terraform apply was successful
# #       if [ "$?" -eq 0 ]; then
# #         aws lambda invoke --function-name ${aws_lambda_function.send_email.function_name} --payload {} /dev/null
# #       fi
# #     EOT
# #   }

# #   triggers = {
# #     always_run = "${timestamp()}"
# #   }
# # }
