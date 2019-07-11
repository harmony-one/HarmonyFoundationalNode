
# Security Group with Harmoney Foundational Node ports enabled
resource "aws_security_group" "foundational-sg" {
  name        = "Harmony Foundational Node Security Group"
  description = "Security group for Harmony Foundational Nodes"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Enable SSH"
  }

  ingress {
    from_port   = 6000
    to_port     = 6000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Harmony Foundational Port"
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Harmony Foundational Port"
  }

  ingress {
    from_port   = 14555
    to_port     = 14555
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Harmony Foundational Port"
  }

  ingress {
    from_port   = 9999
    to_port     = 9999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Harmony Foundational Port"
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Harmony Foundational Node Security Group"
    Project = "Harmony"
  }
}
