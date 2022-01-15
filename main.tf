# =========| LAUNCH CONFIG |=========

resource "aws_launch_configuration" "demo" {
  image_id               = "ami-0f9124f7452cdb2a6"
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.demo-instance.id]

  user_data              = <<EOF
#!/bin/bash
echo "<h3>Hello, world!</h3>" > index.html
nohup busybox httpd -f -p 8080 &
EOF

  # Required when using ASG in run config
  lifecycle {
    create_before_destroy = true
  }
}

# ==================================

