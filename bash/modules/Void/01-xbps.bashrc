# xbps.bashrc

alias xrr="sudo xbps-remove -R"
alias xsu="sudo xbps-install -Su"
alias xbps-src="exec ~/Packages/void-packages/xbps-src"
alias xbps-src-search="ls ~/Packages/void-packages/srcpkgs/ | grep $@"

KERNELVERSION=linux5.14-xanmod-cacule
PACKAGE_TMPDIR="/tmp/Packages"

xbps-build-linux-xanmod-cacule () {

	INITIAL_PWD=${PWD}
	SECONDS=0

	echo "${BOLD}Clean temporary package directory?${RESET} (y/n)"
	read CLEAN_CHOICE;

	if [[ "${CLEAN_CHOICE}" == "1" ]] || [[ "${CLEAN_CHOICE}" == "yes" ]] || [[ "${CLEAN_CHOICE}" == "y" ]]; then
		echo "Deleting temporary package directory."
		rm -rfv ${PACKAGE_TMPDIR} ;
	else
		echo "Not deleting temporary package directory."
	fi

	echo "${BOLD}Creating tmpfs compilation directory${RESET}"
	sudo mkdir -v ${PACKAGE_TMPDIR}
	sudo chown ${USER} ${PACKAGE_TMPDIR}
	sudo chmod 700 ${PACKAGE_TMPDIR}
	cd ${PACKAGE_TMPDIR}

	echo "${BOLD}Cloning void-packages${RESET}"
	git clone git://github.com/void-linux/void-packages.git ;
	cd ${PACKAGE_TMPDIR}/void-packages
	./xbps-src binary-bootstrap ;
	cd ${PACKAGE_TMPDIR}
	echo XBPS_ALLOW_RESTRICTED=yes >> ${PACKAGE_TMPDIR}/void-packages/etc/conf
	echo XBPS_CCACHE=yes >> ${PACKAGE_TMPDIR}/void-packages/etc/conf
	echo XBPS_MAKEJOBS=12 >> ${PACKAGE_TMPDIR}/void-packages/etc/conf

	echo "${BOLD}Downloading voidxanmodK${RESET}"
	#git clone https://notabug.org/Marcoapc/voidxanmodK.git ;
	wget https://notabug.org/Marcoapc/voidxanmodK/archive/master.tar.gz
	tar -xvzf master.tar.gz
	rm master.tar.gz

	echo "${BOLD}Copying ${KERNELVERSION} directories${RESET}"
	cp -Rfv ${PACKAGE_TMPDIR}/voidxanmodk/linux-gcc/${KERNELVERSION}/ ${PACKAGE_TMPDIR}/void-packages/srcpkgs ;
	cp -Rfv ${PACKAGE_TMPDIR}/voidxanmodk/linux-gcc/${KERNELVERSION}-headers/ ${PACKAGE_TMPDIR}/void-packages/srcpkgs ;
	cp -Rfv ${PACKAGE_TMPDIR}/voidxanmodk/linux-gcc/${KERNELVERSION}-dbg/ ${PACKAGE_TMPDIR}/void-packages/srcpkgs ;

	echo "${BOLD}Building ${KERNELVERSION} packages${RESET}"
	cd ${PACKAGE_TMPDIR}/void-packages
	./xbps-src pkg ${KERNELVERSION} ${KERNELVERSION}-headers ;
	cd ${PACKAGE_TMPDIR}

	echo "${BOLD}Installing ${KERNELVERSION} and ${KERNELVERSION}-headers${RESET}"
	cd ${PACKAGE_TMPDIR}/void-packages
	xi ${KERNELVERSION} ${KERNELVERSION}-header s;
	cd ${INITIAL_PWD}

	echo "The entire operation took $SECONDS seconds."
}
