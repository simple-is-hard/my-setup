# Rebuild and patch WSL2 kernel from Docker

This repo contains scripts to rebuild WSL2 images and applies a simple
workaround for Docker having an issue with "--cap-add SYS_NICE". Any
privileged container inside Docker on WSL2 fails to use scheduler API
(ex. sched_setsheduler SCHED_RR).

More information available in similar bug report here
<https://github.com/moby/moby/issues/38631>

This bug report link also mentions a nice quick test for the issue
```
docker run -it --cap-add SYS_NICE itsgk92/set_cap_test
```

This workaround simply drops cgroups related access check from the
kernel, not very nice, but at least allows to run the needed containers
same way as they would work on host Debian or Ubuntu.

The command below is a short way to recompile and install it. (For now
from source only, later might add precompiled atrifact)
```
curl https://raw.githubusercontent.com/simple-is-hard/my-setup/main/wsl2-kernel/build | sh
```

After rebuilding and installing the new kernel, restart the wsl2 with `wsl --shutdown`