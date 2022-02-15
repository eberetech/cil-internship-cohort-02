#To get the lambda function that was created
variable "pythonfunctionapparn" {
}

# creating a aws step function iam_role
resource "aws_iam_role" "step_function_role" {
  name               = "stepfunction-role"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "states.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": "StepFunctionAssumeRole"
      }
    ]
  }
  EOF
}

# creating a aws step function iam_role_policy
resource "aws_iam_role_policy" "step_function_policy" {
  name    = "setfunction-policy"
  role    = aws_iam_role.step_function_role.id

  policy  = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "lambda:InvokeFunction"
        ],
        "Effect": "Allow",
        "Resource": "${var.pythonfunctionapp.arn}"
      }
    ]
  }
  EOF
}

#
resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = var.step_function_name
  role_arn = aws_iam_role.step_function_role.arn
   definition = <<EOF
  {
    "Comment": "Invoke AWS Lambda from AWS Step Functions with Terraform",
    "StartAt": "Examplelambdafunctionapp",
    "States": {
      "Examplelambdafunctionapp": {
        "Type": "Task",
        "Resource": "${var.pythonfunctionapp.arn}",
        "End": true
      }
    }
  }
  EOF
}