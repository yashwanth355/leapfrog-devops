resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  role        = "${aws_iam_role.role.lambda_role.id}"

  policy ="${file("iam/lambda_policy.json")}"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy ="${file("iam/lambda_role.json")}"
}
