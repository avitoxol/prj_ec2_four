variable "north_virg" {
  default = "us-east-1"
}

variable "inst_type" {
  type = list
  default = ["t2.nano", "t2.micro"]
}

variable "webport" {
  type = list
  default = [22, 80, 443]
}

variable "ssh_key" {
  default = "./file/my_public_key.pub"
}

variable "ssh_priv_key" {
  default = "./file/my-key-pair.pem"
}

variable "script" {
  default = "./file/adhoc.sh"
}

variable "instance_user" {
  default = "ec2-user"
}
