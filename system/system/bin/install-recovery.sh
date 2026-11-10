#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:14798848:c4d13bc68d212b8d9aa66f468d100328c662cc2a; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9383936:dcde9f4cc8930cf66684f064289fb25c906177f4 EMMC:/dev/block/platform/bootdevice/by-name/recovery 658253abbf1501f78a03b63923f4d5def0fa65cc 14796800 dcde9f4cc8930cf66684f064289fb25c906177f4:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=14796800 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
