最近经常开发人工智能相关项目，经常需要安装不通硬件平台不同操作系统版本不同python版本的各种包，
耗费了大量的时间和精力都是在下载等待中，要么就是失败重试.

总结了一套通用的方法，可以节省大量的时间精力，避免精力和时间白白浪费了。特别是在中国境内，下载很慢，即使用了阿里和清华的镜像源头，还是下载很慢，因为少量的包在国内镜像上没有，下载速度只有几KB/秒。

执行办法:  
1.  git clone https://github.com/HappyFreeAngel/create-python-offline-packages.git
2. 把你需要下载的包和对应的版本放在create-python-offline-packages/requirements.txt
3. 替换你的docker镜像文件  默认是: base_docker_image="python:3.7-buster" 
  比如 我在树莓派raspberry pi3B+上的镜像是 #base_docker_image="ascs/iot-env-base:raspberrypi3-opencv4.0.1-tesseract5.0.0-alpha-python3.5.3-python2.7.13"  
这样你就可以确保可以顺利下载各种离线python安装包。


然后执行create-python-offline-packages/run.sh   即可
即可