openstack network create \
    --provider-network-type flat \
    --provider-physical-network physnet1 \
    --external external-network  

openstack subnet create \
    --network external-network \
    --subnet-range 192.168.1.0/24 \
    --allocation-pool start=192.168.1.100,end=192.168.1.200 \
    --gateway 192.168.1.1 \
    --no-dhcp external-subnet