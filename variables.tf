variable "region" {
  description = "AWS region to deploy resources"
}

variable "user_instance" {
  description = "Username for the instance"
}

variable "access_key_path" {
  description = "Key path for the instance"
}

variable "instance_public_ip" {
  description = "Ip address of the instance"
}

variable "initial_script_path" {
  description = "Initial script path"
}

variable "update_script_path" {
  description = "Update script path"
}
