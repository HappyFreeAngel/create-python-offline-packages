#!/usr/bin/env bash
#确保shell 切换到当前shell 脚本文件夹
current_file_path=$(cd "$(dirname "$0")"; pwd)
cd ${current_file_path}
pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple/
pip download -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/