#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3e52c2c5abcec26574c2a3d8e58346943f056e87; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:266bd200ffad59b1338a85bdc44bae7007555afb \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3e52c2c5abcec26574c2a3d8e58346943f056e87 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
