build-linux-xanmod-cacule () {

	cd ~/Packages/voidxanmodK
	git pull;
	cp -Rfv ~/Packages/voidxanmodK/linux-gcc/linux5.14-xanmod-cacule/ ~/Packages/void-packages/srcpkgs;
	cp -Rfv ~/Packages/voidxanmodK/linux-gcc/linux5.14-xanmod-cacule-headers/ ~/Packages/void-packages/srcpkgs;
	cp -Rfv ~/Packages/voidxanmodK/linux-gcc/linux5.14-xanmod-cacule-dbg/ ~/Packages/void-packages/srcpkgs;
	xbps-src pkg linux5.14-xanmod-cacule linux5.14-xanmod-cacule-headers;
	xi linux5.14-xanmod-cacule;
	xi linux5.14-xanmod-cacule-headers;

}
