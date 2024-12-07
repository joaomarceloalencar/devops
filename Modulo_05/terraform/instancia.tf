resource "aws_instance" "controller" {
  ami             = var.ami_id 
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [ aws_security_group.kubernetes.name ]
  
  tags = {
    Name = "controller"
  }
}

resource "aws_instance" "worker01" {
  ami             = var.ami_id
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [ aws_security_group.kubernetes.name ]
  
  tags = {
    Name = "worker01"
  }
}

resource "aws_instance" "worker02" {
  ami             = var.ami_id 
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [ aws_security_group.kubernetes.name ]
  
  tags = {
    Name = "worker02"
  }
}

resource "null_resource" "wait_for_controller_running" {
  provisioner "local-exec" {
    command = <<EOF
      while ! aws ec2 describe-instance-status --instance-ids ${aws_instance.controller.id} --query 'InstanceStatuses[*].InstanceStatus.Status' --output text | grep -q 'ok'; do
        sleep 5
      done
EOF
  }
  
  depends_on = [aws_instance.controller]
}

resource "null_resource" "wait_for_worker01_running" {
  provisioner "local-exec" {
    command = <<EOF
      while ! aws ec2 describe-instance-status --instance-ids ${aws_instance.worker01.id} --query 'InstanceStatuses[*].InstanceStatus.Status' --output text | grep -q 'ok'; do
        sleep 5
      done
EOF
  }
  
  depends_on = [aws_instance.worker01]
}

resource "null_resource" "wait_for_worker02_running" {
  provisioner "local-exec" {
    command = <<EOF
      while ! aws ec2 describe-instance-status --instance-ids ${aws_instance.worker02.id} --query 'InstanceStatuses[*].InstanceStatus.Status' --output text | grep -q 'ok'; do
        sleep 5
      done
EOF
  }
  
  depends_on = [aws_instance.worker02]
}
