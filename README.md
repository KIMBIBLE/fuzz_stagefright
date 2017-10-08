# fuzz_stagefright
[SK Nugu] To fuzz stagefright lib using beagleboard xm

## 1. sdcard format
> export DISK=/dev/sdX  # sdX : your sdcard location => ex) /dev/sdb, /dev/sdc, /dev/sdd, ...
> 
> * option 1) delete entire data in sdcard
> 
> sudo dd if=/dev/zero of=${DISK} bs=1M
> 
> * option 2) if you want to delete only sdcard's partion table and label, use this!!
> 
> sudo dd if=/dev/zero of=${DISK} bs=1M count=20

## 2. get prebuilt android ICS img for beagleboard xm 
> wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rowboat/beagleboard-xm.tar.gz
> 
> tar xvfs beagleboard-xm.tar.gz
> 
> cd beagleboard-xm/

## 3. edit prebuilt android ICS img's library
> cd Filesystem
> 
> mkdir rootfs
> 
> tar xvf rootfs.tar.bz2 -C ./rootfs
> 
> wget https://raw.githubusercontent.com/Oss9935/fuzz_stagefright/master/library_list.txt
> 
> wget https://github.com/Oss9935/fuzz_stagefright/raw/master/nugu_stagefright_liblist.tar.gz
> 
> tar xvfs nugu_stagefright_liblist.tar.gz
>
> wget https://raw.githubusercontent.com/Oss9935/fuzz_stagefright/master/copylib.sh
> 
> chmod +x copylib.sh
>
> ./copylib.sh
>
> tar cjvf rootfs.tar.bz2 ./rootfs/*
>
> rm -rf rootfs nugu_stagefright_liblist.tar.gz library_list.txt
>
> cd ..

## 4. run edited mkmmc shell script !!
- partisioning sdcard

- copy compiled android img to sdcard

- file system permision setting

> wget https://raw.githubusercontent.com/Oss9935/fuzz_stagefright/master/mkmmc_android_new.sh
> 
> chmod +x mkmmc_android_new.sh
> 
> sudo ./mkmmc_android_new.sh $DISK    # use your sdcard
>
> sudo chomd 777 -R /media/rootfs
