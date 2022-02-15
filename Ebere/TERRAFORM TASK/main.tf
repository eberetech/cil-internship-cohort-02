#aws provider
provider "aws" {
  region  = "eu-west-1"
  profile = "default"
}

# create aws lambda function
module "awslambdafunction" {
    source = "..cil-internship-cohort-02/Ebere/terraformtask/lambdafuction"

}

#creating a step function to invoke the lambda function
module "awsstepfunction" {
 source = "..cil-internship-cohort-02/Ebere/terraformtask/stepfunction"  
 pythonfunctionapparn = module.awslambdafunction.pythonfunctionappArn

}