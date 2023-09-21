sudo apt update
# 点击左下角 -> 点击settings -> 点击Region & Language -> 点击Manage installed Languages
# 如果报错则执行：
# sudo apt install -f

sudo apt install ibus-pinyin -y
ibus-setup  # 点击Input Method -> 点击Add -> 点击Chinese -> 点击Intelligent Pinyin -> 点击Add

# 点击左下角 -> 点击settings -> 点击Keyboard -> 点击"+" -> 点击Chinese -> 点击Chinese(Intelligent Pinyin) -> 点击Add

sudo apt install wget -y
sudo wget http://archive.ubuntukylin.com/software/pool/partner/ukylin-wine_70.6.3.25_amd64.deb
sudo wget http://archive.ubuntukylin.com/software/pool/partner/ukylin-wechat_3.0.0_amd64.deb
sudo apt install -f -y ./ukylin-wine_70.6.3.25_amd64.deb
sudo apt install -f -y ./ukylin-wechat_3.0.0_amd64.deb

DRIVER_ID=`ubuntu-drivers devices | grep recommended | awk '{print $3}'`
sudo apt install $DRIVER_ID -y

sh nvidia_docker_install.sh
# after nvidia-docker2 installed

sudo echo 'add '$USER' to group(docker)'
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

sudo apt install chromium-browser
