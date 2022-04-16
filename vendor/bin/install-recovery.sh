#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:83886080:6c71b978aacdad8dcd147f480cbc979b4486cf65; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:100663296:3dba74be0af470575d014dff54114d7c8560c017 \
          --target EMMC:/dev/block/by-name/recovery:83886080:6c71b978aacdad8dcd147f480cbc979b4486cf65 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
