
#!/usr/bin/env bash
#———————————————————————
#确保shell 切换到当前shell 脚本文件夹
current_file_path=$(cd "$(dirname "$0")"; pwd)
cd ${current_file_path}

echo "最新版本请见 https://github.com/HappyFreeAngel/create-python-offline-packages.git"
echo “离线下载python包”


download_dir="${current_file_path}/download"
requirements_file="${current_file_path}/requirements.txt"

#判断目录是否存在
if [ ! -d $download_dir ]
then
	`mkdir -p $download_dir`
    echo "the $download_dir 不存在"
fi

cp download-python-packages.sh ${download_dir}

chmod +x ${download_dir}/download-python-packages.sh

#判断文件是否存在
if [ ! -f $requirements_file ]
then
    echo the $requirements_file 不存在
    exit 1
else
	cp requirements.txt $download_dir
fi


cat << EOF >autodownload.sh

#!/usr/bin/env bash
echo "以下docker请在树莓派设备上运行"

echo "python 安装包的信息 requirements.txt 请放在当前目录download目录下"
#下面的镜像可以替换为你自己最终运行时环境下的docker镜像。
base_docker_image="ascs/iot-env-base:raspberrypi3-opencv4.0.1-tesseract5.0.0-alpha-python3.5.3-python2.7.13"
docker stop python-package-download;docker rm python-package-download
docker run -d --name  python-package-download -ti ${base_docker_image} bash
docker exec python-package-download mkdir -p /tmp/download/
docker cp download  python-package-download:/tmp/
docker exec python-package-download /tmp/download/download-python-packages.sh
docker cp python-package-download:/tmp/download downloaded-packages

EOF


chmod +x autodownload.sh
./autodownload.sh

#—————————————
