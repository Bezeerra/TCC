openstack network create internal-network
openstack subnet create \
    --network internal-network \
    --subnet-range 10.0.0.0/24 \
    internal-subnet