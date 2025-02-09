[all:vars]
ansible_become=True
ansible_private_key_file=~/.ssh/id_rsa

[all]
192.168.68.101 ansible_ssh_user=controller
192.168.68.103 ansible_ssh_user=storage
192.168.68.104 ansible_ssh_user=compute

[control]
192.168.68.101

[network]
192.168.68.101

[compute]
192.168.68.101
192.168.68.104

[monitoring]
192.168.68.101

[storage]
192.168.68.101
192.168.68.103
