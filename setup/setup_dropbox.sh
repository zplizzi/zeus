# Donwload dropbox app to ~/.dropbox_dist
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

# Download dropbox command line tool
cd ~/.dropbox-dist/
wget --output-document "dropbox.py" https://www.dropbox.com/download?dl=packages/dropbox.py 

# Start the app, you'll have to click the link
python dropbox.py start

# set it to autostart
python dropbox.py autostart
