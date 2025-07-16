resource "aws_iam_role" "main" {
  name               = "${var.name_prefix}-instance-role"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

resource "aws_iam_instance_profile" "main" {
  name = aws_iam_role.main.name
  role = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  count      = var.enable_systems_manager ? 1 : 0
  role       = aws_iam_role.main.name
  policy_arn = data.aws_iam_policy.ssm_arn.arn
}

resource "aws_instance" "hello_world" {
  count = var.instance_count
  ami   = data.aws_ami.ubuntu.id
  #   subnet_id     = data.aws_subnets.default.ids[0]
  subnet_id            = var.subnet_id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.main.name

  # tags = {
  #     Name = "hello_world" // Sets the display name in AWS
  # }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-${count.index}"
  })
}