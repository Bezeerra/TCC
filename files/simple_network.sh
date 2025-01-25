# criando uma rede externa
openstack network create --external --provider-network-type flat external_network

# criando uma subnet conectada ao gateway
openstack subnet create --network external_network --subnet-range 192.168.1.0/24 --allocation-pool start=192.168.1.100,end=192.168.1.200 --gateway 192.168.1.1 --dns-nameserver 8.8.8.8 external_subnet

# criando um roteador e definindo o gateway
openstack router create my_router
openstack router set my_router --external-gateway external_network

# conectando a subnet ao roteador 
openstack router add subnet my_router internal_subnet

# após isso podemos conectar uma instância a essa rede para ter acesso a internet
openstack server create --flavor m1.small --image ubuntu-22.04 --nic net-id=$(openstack network show internal_network -c id -f value) --security-group default --key-name my_key my_instance
