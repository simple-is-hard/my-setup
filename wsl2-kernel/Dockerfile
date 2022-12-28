FROM debian

ENV VER=linux-msft-wsl-5.15.y

ENV GITHUB=https://github.com/microsoft/WSL2-Linux-Kernel

RUN \
	apt-get update -y && \
	apt-get install -y \
		build-essential \
		flex \
		bison \
		dwarves \
		libssl-dev \
		libelf-dev \
		\
		bc \
		python3 \
		unzip \
		wget \
	&& \
	apt-get clean && \
	true

RUN \
	cd /usr/src && \
	wget $GITHUB/archive/refs/heads/$VER.zip && \
	unzip $VER.zip && \
	rm $VER.zip && \
	true

RUN \
	cd /usr/src/WSL2-Linux-Kernel-$VER && \
	\
	echo "LS0tIGMKKysrIGtlcm5lbC9zY2hlZC9jb3JlLmMKQEAgLTc0MTgsMyArNzQxOCwz \
	      IEBACiAJaWYgKHVzZXIpIHsKLSNpZmRlZiBDT05GSUdfUlRfR1JPVVBfU0NIRUQK \
	      KyNpZmRlZiBUSElEX0lTX1dPUktBUk9VTkRfRk9SX1dTTF9ET0NLRVIKIAkJLyoK" | \
		base64 -di > /tmp/sched_setscheduler-access.patch && \
	\
	echo "Applying sched_setscheduler-access.patch (below)" && \
	cat /tmp/sched_setscheduler-access.patch | tee /dev/stderr | patch -p0 && \
	sleep 10 && \
	\
	make KCONFIG_CONFIG=Microsoft/config-wsl && \
	true

CMD cat /usr/src/WSL2-Linux-Kernel-$VER/arch/x86/boot/bzImage
