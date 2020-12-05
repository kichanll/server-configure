# Using:
# sudo sh add_user.sh "group_name" "user_name"

if [ $# -eq 2 ];then
    is_group_exist=0
    is_user_exist=0

    res_group=$(awk 'BEGIN{FS=":"} {print $1}' /etc/group)
    res_user=$(awk 'BEGIN{FS=":"} {print $1}' /etc/passwd)
    for loop in $res_group
    do
        if [ $loop = $1 ];then
            echo 'group name $loop exist'
            is_group_exist=1
            break
        fi
    done
    for loop in $res_user
    do
        if [ $loop = $2 ];then
            echo 'user name $loop exist'
            is_user_exist=1
            break
        fi
    done

    if [ $is_group_exist -eq 0 ];then
        sudo groupadd $1
    fi
    if [ $is_user_exist -eq 0 ];then
        sudo mkdir /home/$2
        sudo useradd -d /home/$2 -g $1 -s /bin/bash $2
        sudo chown -R $2:$1 /home/$2
        #sudo passwd xiejiebin
        echo $2':123456' | chpasswd
        sudo cp -r /etc/skel/. /home/$2
        sudo chown -R $2:$1 /home/$2
        sudo gpasswd -a $2 docker
    fi
fi
