resource "aws_sagemaker_model" "shared_model" {
  name               = "voice-cloner-model"
  execution_role_arn = "arn:aws:iam::207567776087:role/SageMakerExecutionRole"

  primary_container {
    image          = "763104351884.dkr.ecr.us-west-1.amazonaws.com/pytorch-inference:2.2.0-cpu-py310-ubuntu20.04-sagemaker-v1.19"
    model_data_url = "s3://voice-cloner-models-us-west-1/model/model.tar.gz"
    mode           = "SingleModel"
  }

  tags = {
    Environment = "Dev"
    Project     = "Vubber"
  }
}
