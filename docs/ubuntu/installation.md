### Ubuntu installation

#### Ubuntu 20.04 focal (using USB flash)

1. Install image from [offical site](https://releases.ubuntu.com/20.04/)
2. Install [Rufus](https://rufus.ie/ru/)
3. Mount image on USB flash via **Rufus**
    1. Select youn flash
    2. Method download: **FreeDOS**
    3. Choose downloaded image by **Select** button
    4. Start mount by **Start**
4. Free memory on your disk. Go to next paragraph
5. Restart, enter BIOS, do flash first at boot
6. After start installer in disk selection choose **Something else**
    1. Size: **all available**
    2. Type for the new partion: **Primary**
    3. Location for the new partion: **Beginning of this space**
    4. Use as: **EXT4 journaling file system**
    5. Mount point: **/**
7. Accept installation

#### Free disk space

##### Windows

1. Open **Computer Management**
2. In left sidebar select **Storage devices** -> **Disk management**
3. In bottom menu select suitable disk by **RBM** and click to **Compress volume**
4. Input required memory size in **MB**
    * If memory isn't enough, go to **Explorer** -> RMB on your disk and select **Property** -> **Service** -> **Optimize**, choose your disk
5. Do not create new volume
6. Back to 5 point in previous paragraph
