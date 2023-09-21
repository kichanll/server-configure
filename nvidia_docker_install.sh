#nvidia-docker2安装：
#https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

sudo apt-get update
sudo apt-get install -y curl
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo chmod o+rw /var/run/docker.sock
sudo docker run --runtime=nvidia --rm --gpus all nvidia/cuda:11.0.3-runtime-ubuntu20.04 nvidia-smi
#sudo docker run --runtime=nvidia --rm --gpus all nvidia/cuda:12.2.0-runtime-ubuntu20.04 nvidia-smi



# extra operation
#{
#    "registry-mirrors" : [
#        "https://6w7cjd3h.mirror.aliyuncs.com",
#        "http://hub-mirror.c.163.com/",
#        "http://docker.mirrors.ustc.edu.cn"
#    ],
#    "runtimes": {
#        "nvidia": {
#            "path": "nvidia-container-runtime",
#            "runtimeArgs": []
#        }
#    },
#    "default-runtime": "nvidia"
#}

#docker run -it --gpus all --name xiejiebin01_tts -p 50001:50001 -p 50002:50002 -p 50003:50003 -p 50004:50004 --mount type=bind,source=/home/xiejiebin01,target=/home nvidia/cuda:11.0.3-runtime-ubuntu20.04
