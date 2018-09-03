#!/bin/bash

# Download GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

# copy the downloaded file into /opt directory
cp gitkraken-amd64.tar.gz /opt/

cd /opt

# Extract the Kraken into /opt directory
tar -xvzf gitkraken-amd64.tar.gz

# you can apply ownership for a specific user too
# chown -R user:group /opt/gitkraken

# Add gitkraken to PATH
echo "export PATH=\$PATH:/opt/gitkraken" >> ~/.bashrc
source ~/.bashrc

# sudo ln -s /usr/lib64/libcurl.so.4 /opt/gitkraken/libcurl-gnutls.so.4
sudo ln -s /usr/lib64/libcurl.so.4 /usr/lib64/libcurl-gnutls.so.4

## uncomment if you use Fedora 28 x86_x64 Gnome
# dnf install libgnome-keyring.x86_64

# Create gitkraken launcher icon
wget http://img.informer.com/icons_mac/png/128/422/422255.png -o gitkraken-icon.png
mv gitkraken-icon.png /opt/gitkraken/

cd /usr/share/applications

cat > gitkraken.desktop <<EOL
[Desktop Entry]
Name=GitKraken
Comment=Git Flow
Exec=/opt/gitkraken/gitkraken
Icon=/opt/gitkraken/gitkraken-icon.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Utility;Development;
EOL
# delete archive
# so run and Code
