git clone https://github.com/lwfinger/rtl8192ee
cd rtl8192ee/
make all
sudo make install
sudo echo "blacklist rtl8192ee" | sudo tee -a /etc/modprobe.d/50-blacklist.conf
sudo echo "8192ee" | sudo tee -a /etc/modules-load.d/8192ee.conf
cd ..
rm -rf tl8192ee/
