output "ip" {
    value = "${aws_instance.foundation-node.*.public_ip}"
}
output "private_key" {
    value = "${var.private_key_path}"
}