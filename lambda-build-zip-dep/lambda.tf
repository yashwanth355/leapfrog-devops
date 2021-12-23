locals{
    lambda_zip_location = "outputs/function.zip"
}
data "archive_file" "function" {
  type        = "zip"
  source_file = "function.py"
  output_path = "${local.lambda_zip_location}"
}
resource "aws_lambda_function" "test_lambda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "function"
  role          = ${"aws_iam_role.lambda_role.arn"}
  handler       = "function.hello"

  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.9"
}