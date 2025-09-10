provider "aws" {
  region = var.region
}

resource "null_resource" "update_existing_instance" {
  provisioner "file" {
    source      = var.initial_script_path
    destination = "/tmp/initial-script.sh"

    connection {
      type        = "ssh"
      user        = var.user_instance
      private_key = file(var.access_key_path)
      host        = var.instance_public_ip
      timeout     = "5m"
    }
  }

  provisioner "file" {
    source      = var.update_script_path
    destination = "/tmp/update-instance.sh"

    connection {
      type        = "ssh"
      user        = var.user_instance
      private_key = file(var.access_key_path)
      host        = var.instance_public_ip
      timeout     = "5m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "#!/bin/bash",
      "sudo mv /tmp/initial-script.sh /usr/local/bin/initial-script.sh",
      "sudo mv /tmp/update-instance.sh /usr/local/bin/update-instance.sh",
      "sudo chmod +x /usr/local/bin/initial-script.sh",

      "echo '0 0 1 * * root /bin/bash /usr/local/bin/initial-script.sh > /var/log/initial-script.log 2>&1' | sudo tee /etc/cron.d/initial-script",
      "sudo chmod 644 /etc/cron.d/initial-script",
      "sudo chown root:root /etc/cron.d/initial-script",
      "bash /usr/local/bin/initial-script.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.user_instance
      private_key = file(var.access_key_path)
      host        = var.instance_public_ip
      timeout     = "5m"
    }
  }
}
