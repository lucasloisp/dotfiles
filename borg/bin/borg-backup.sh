#!/usr/bin/env bash
export REPOSITORY="/media/$USER/Elements/backups/personal"

echo -n "Enter passphrase for key $BORG_REPO: "
read -s password
echo

# Fill in your password here, borg picks it up automatically
export BORG_PASSPHRASE="$password"

# Backup all of /home except a few excluded directories and files
borg create -v --stats --compression lz4 --progress                  \
    $REPOSITORY::'{hostname}-{now:%Y-%m-%d@%H:%M}' /home/$USER       \
--exclude '/home/*/.cache'                                           \
--exclude '/home/*/.config'                                          \
--exclude '/home/*/.stack'                                           \
--exclude '/home/*/.local/share/Trash'                               \
--exclude '/home/*/.var/app/org.gnome.Boxes/data/gnome-boxes/images' \
--exclude '/home/*/snap'                                             \
--exclude '/home/*/Backups'                                          \
--exclude '/home/$USER/.local/include'                               \
--exclude '/home/$USER/.local/installppa.sh'                         \
--exclude '/home/$USER/.local/listppa'                               \
--exclude '/home/$USER/Downloads'                                    \
--exclude '/home/$USER/VirtualBox\ VMs'                              \
--exclude '/home/lost+found'                                         \
--exclude '*.img'                                                    \
--exclude '*.iso'                                                    \

# Route the normal process logging to journalctl
2>&1

# If there is an error backing up, reset password envvar and exit
if [ "$?" = "1" ] ; then
    export BORG_PASSPHRASE=""
    exit 1
fi

# Prune the repo of extra backups
borg prune -v $REPOSITORY --prefix '{hostname}-'         \
    --keep-daily=14                                      \
    --keep-weekly=4                                      \
    --keep-monthly=6                                     \

# Include the remaining device capacity in the log
df -hl | grep --color=never /dev/sdc

borg list $REPOSITORY

# Unset the password
export BORG_PASSPHRASE=""
exit 0
