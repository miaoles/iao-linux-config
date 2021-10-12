# runit.bashrc

sv() {
	if [ -d "/etc/sv/$2" ]; then
		if [[ $1 == "enable" ]]; then
			if [ -d "/etc/runit/runsvdir/default/$2" ]; then
				command echo "Service $2 is already enabled."
			else
				command sudo ln -sv /etc/sv/$2 /etc/runit/runsvdir/default
				command sudo ln -sv /etc/sv/$2 /var/service
			fi
		elif [[ $1 == "disable" ]]; then
			if [ -d "/etc/runit/runsvdir/default/$2" ]; then
				command lxqt-sudo rm /etc/runit/runsvdir/default/$2
				command lxqt-sudo rm /var/service/$2
			else
				command echo "Service $2 is already disabled."
			fi
		fi
	else
		command sv "$@"
	fi
}
