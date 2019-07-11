output "instance_ips" {
  value = ["${aws_instance.foundation-node.*.public_ip}"]
}