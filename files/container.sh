# Baixando o SO simplificado stable.
debootstrap stable path_debian http://deb.debian.org/debian/

# Acessando o bash e isolando os namespaces
unshare --mount --pid --net --user --map-root-user --fork --uts --ipc chroot path_debian /bin/bash

# Dentro do debian faca os pontos de montagem do debian
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t tmpfs tmp /tmp


# Crie os arquivos de configuraćão do group
# limitando a 50% do uso da CPU
echo "50000 100000" | sudo tee /sys/fs/cgroup/my_cgroup/cpu.max

# limitando a 100MB de memória
echo "100M" | sudo tee /sys/fs/cgroup/my_cgroup/memory.max

# movendo o PID no processo /bin/bash para dentro do cgroup
echo <PID> | sudo tee /sys/fs/cgroup/my_cgroup/cgroup.procs

# Para visualizar se está realmente sendo limitado você pode olhar os arquivos .stat e .events
cat /sys/fs/cgroup/my_cgroup/memory.events
cat /sys/fs/cgroup/my_cgroup/cpu.stat
