# !/bin/bash
START_DIR=$(pwd)
SCRIPT_DIR_1=$(dirname "$0")
SCRIPT_DIR=$(cd "${SCRIPT_DIR_1}"; pwd)
cd "${SCRIPT_DIR}"
echo "安装过程需要输入密码"
sudo cd "${SCRIPT_DIR}"
if [ $? -ne 0 ]; then
    echo "密码输入错误，安装失败"
    exit 0
fi
cd "${SCRIPT_DIR}"
if [ ! -d "/usr/local/bin/" ];then
    printf "创建目录/usr/local/bin/"
    sudo mkdir -p /usr/local/bin/
    if [ $? -ne 0 ]; then
        echo "......【失败】"
        exit 1
    else
        echo "......【成功】"
    fi
fi
if [ ! -d "/Library/Scripts/FixHeadphone/" ];then
    printf "创建目录//Library/Scripts/FixHeadphone/"
    sudo mkdir -p /Library/Scripts/FixHeadphone/
    if [ $? -ne 0 ]; then
        echo "......【失败】"
        exit 1
    else
        echo "......【成功】"
    fi
fi

printf "拷贝文件 hda-verb -> /usr/local/bin/"
( \
       sudo cp -f ./package/hda-verb /usr/local/bin/ \
    && sudo chmod 755 /usr/local/bin/hda-verb \
    && sudo chown root:wheel /usr/local/bin/hda-verb \
)
if [ $? -ne 0 ]; then
    echo "......【失败】"
    exit 1
else
    echo "......【成功】"
fi

printf "拷贝文件 self.laozhiang.fixheadphone.plist -> /Library/LaunchAgents/ \n"
printf "拷贝文件 fixheadphone.sh -> /Library/Scripts/FixHeadphone/ \n"
( \
       sudo cp -f package/self.laozhiang.fixheadphone.plist /Library/LaunchAgents/ \
    && sudo cp -f package/fixheadphone.sh /Library/Scripts/FixHeadphone/fixheadphone.sh \
    && sudo chmod 755 /Library/LaunchAgents/self.laozhiang.fixheadphone.plist \
    && sudo chown root:wheel /Library/LaunchAgents/self.laozhiang.fixheadphone.plist \
    && sudo chmod 755 /Library/Scripts/FixHeadphone/fixheadphone.sh \
    && sudo chown root:wheel /Library/Scripts/FixHeadphone/fixheadphone.sh \
)
if [ $? -ne 0 ]; then
    echo "......【失败】"
    exit 1
else
    echo "......【成功】"
fi


echo "..........恭喜，安装成功, 重启生效.........."