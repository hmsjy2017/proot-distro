#!/usr/bin/env bash
echo "Installing /bin/proot-distro"
install -d -m 700 /bin
./proot-distro.sh > /bin/proot-distro
chmod 700 /bin/proot-distro

install -d -m 700 /etc/proot-distro
for script in ./distro-plugins/*.sh*; do
	echo "Installing /etc/proot-distro/$(basename "$script")"
	install -Dm600 -t /etc/proot-distro/ "$script"
done

echo "Installing /share/doc/proot-distro/README.md"
install -Dm600 README.md /share/doc/proot-distro/README.md
