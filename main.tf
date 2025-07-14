resource "aws_instance" "hello_world" {
    ami           = data.aws_ami.ubuntu.id
#   subnet_id     = data.aws_subnets.default.ids[0]
    subnet_id     = var.subnet_id
    instance_type = var.instance_type

    tags = {
        Name = "hello_world" // Sets the display name in AWS
    }
}