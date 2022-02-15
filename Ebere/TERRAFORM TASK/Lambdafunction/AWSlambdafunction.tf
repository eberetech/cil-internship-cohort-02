# writing a terraform code for the AWS lambda function
# zip function to run
data "archive file" "init" {
    type = "zip"
    Source_file = "${path.module}/pythonfunction.tf"
    output_path = "${path.module}/pythonfunction.zip"
}

#IAM Role for the lambda function
Resource "aws_IAM_role" "Lambda_role" {
    name      = "myLambda_role"
    assume_role_policy = file(lambdafunction/lambda_assume_role_policy.json)
}
#IAM Role_policy for the lambda function
Resource "aws_IAM_role_policy" "Lambda_policy" {
    name      = "myLambda_policy"
    assume_policy = file(lambdafunction/lambda_policy.json)   
}

# Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name    = myfirst_lambdafunction
  filename         = data.archive_file.pythonfunction_zip_file.output_path
  source_code_hash = data.archive_file.pythonfunction_zip_file.output_base64sha256
  handler          = "pythonfunction.handler"
  role             = aws_iam_role.lambda_assume_role.arn
  runtime          = "python3.8"
  }
#output
output "pythonfunctionlambdaArn"{
    value = aws_lambda_function.test_lambda.arn
}

