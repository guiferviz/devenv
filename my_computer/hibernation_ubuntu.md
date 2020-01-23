
# Enabling hibernation option in Ubuntu / Linux Mint

To enable the hibernation option you should create a `SWAP` partition.
If you didn't do it during the installation process you should create it now.
Good luck 😂

Use `blkid` to get the UUID of your partition.

Check that in the file `/etc/default/grub` there is a line with the UUID of
your `SWAP` partition:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=07478a4c-ce7f-4396-94ca-b0d76af12650"
```

Add to `/etc/fstab` one line that represents the `SWAP` partition so the OS can
mount that partition at booting time:
```
UUID=07478a4c-ce7f-4396-94ca-b0d76af12650 none   swap    sw      0       0
```

Hibernate with:
```
sudo pm-hibernate
```

I think this is not necessary, but I did and a package was installed:
```
sudo apt install hibernate
```

If you had a `SWAP` file and you are changing to a `SWAP` partition maybe you
should disable the `SWAP` file with:
```
swapoff <path of your file, maybe /swapfile>
```


## Add to menu

To add the hibernate button in the menu create the file
`/etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla` with
the next content:
```
[Re-enable hibernate by default]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate
ResultActive=yes
```


## References

 * https://www.reddit.com/r/linuxmint/comments/93ta9u/enable_hibernation_in_linux_mint_19_tara/

