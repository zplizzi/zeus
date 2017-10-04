This folder contains a backup of my LastPass account, encrypted with PGP symmetric-key encryption. 

This file is secured with the same password as is used for LastPass.

I normally use this with Vim along with the 'gnupg.vim' plugin, but it can also be used with any pgp application such as GNUPG. 

Be careful when using these command-line commands, as writing unencrypted files to disk will forfeit security even after the file is deleted. 

To encrypt a file with GNUPG, use:
`gpg --output lastpass.gpg --symmetric input.txt`

To decrypt a file with GNUPG, use:
`gpg --output output.txt lastpass.gpg`
