resource "aws_launch_template" "this" {
  name                   = var.lt_name
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  update_default_version = true
  user_data              = base64encode(data.template_file.user_data.rendered)
  ebs_optimized          = var.ebs_optimized
  tags                   = var.tags

  dynamic "block_device_mappings" {
    for_each = var.block_device_mappings
    content {
      device_name = lookup(block_device_mappings.value, "device_name", null)

      ebs {
        delete_on_termination = lookup(block_device_mappings.value, "delete_on_termination", true)
        volume_size           = lookup(block_device_mappings.value, "volume_size", null)
        volume_type           = lookup(block_device_mappings.value, "volume_type", "gp3")
      }
    }
  }

  network_interfaces {
    description                 = var.lt_name
    device_index                = 0
    associate_public_ip_address = var.associate_public_ip_address
    delete_on_termination       = true
    security_groups             = data.aws_security_groups.sg.ids
  }

  monitoring {
    enabled = var.enable_detailed_monitoring
  }

}

