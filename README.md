# home
My collection of dotfiles and other useful system scripts.

This repository should be cloned into ~/zeus.


Things to be added into these scripts at some point:

- Disable password prompt when running commands requiring `sudo`:
    - Type `sudo visudo`, then add this line at the end of the file: `zplizzi ALL=(ALL) NOPASSWD: ALL`

- Set up encrypted private:
    - install ecryptfs
    - ecryptfs-setup-private
        - use login password
        - autogenerate mount password
    - disable automount: delete `~/.ecryptfs/auto-mount`
