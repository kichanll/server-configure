curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu18.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
docker run --runtime=nvidia --rm nvidia/cuda:11.0-devel nvidia-smi


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

#docker run -it --name xiejiebin01_tts -p 50001:50001 -p 50002:50002 -p 50003:50003 -p 50004:50004 --mount type=bind,source=/home/xiejiebin01,target=/home nvidia/cuda:11.0-devel
