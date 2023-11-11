#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:83ec095e5d5dc4c25858cd7f6c3745096265c704; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:500e29124e89e444c15d003c0318ae5b2d1f2330 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:83ec095e5d5dc4c25858cd7f6c3745096265c704 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
