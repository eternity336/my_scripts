if [[ ${1} ]]; then
    #Mount
    mkdir /mnt/lvm
    losetup -f -P ${1}
    pvscan --cache
    vgchange -ay
    mount /dev/mapper/rootvg-rootlv /mnt/lvm/
else
    #Cleanup
    umount /mnt/lvm/
    rm -r /mnt/lvm
    lvchange -an /dev/mapper/rootvg
    losetup -d /dev/loop0
    pvscan --cache
fi