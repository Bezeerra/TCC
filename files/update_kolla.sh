source path/venv/bin/activate
pip install --upgrade git+https://opendev.org/openstack/kolla-ansible@master
kolla-ansible pull
kolla-ansible prechecks
kolla-ansible upgrade
kolla-ansible deploy