# !/bin/bash
START_DIR=$(pwd)
echo "卸载过程需要输入密码"
sudo cd "${START_DIR}"
if [ $? -ne 0 ]; then
    echo "密码输入错误，安装失败"
    exit 0
fi

if [ -f "/usr/local/bin/hda-verb" ];then
    printf "删除文件/usr/local/bin/hda-verb"
    sudo rm -f /usr/local/bin/hda-verb
    if [ $? -ne 0 ]; then
        echo "......【失败】"
        exit 1
    else
        echo "......【成功】"
    fi
fi

if [ -f "/Library/LaunchAgents/self.laozhiang.fixheadphone.plist" ];then
    printf "删除文件/Library/LaunchAgents/self.laozhiang.fixheadphone.plist"
    sudo rm -f /Library/LaunchAgents/self.laozhiang.fixheadphone.plist
    if [ $? -ne 0 ]; then
        echo "......【失败】"
        exit 1
    else
        echo "......【成功】"
    fi
fi


if [ -f "/Library/Scripts/FixHeadphone/fixheadphone.sh" ];then
    printf "删除文件/Library/Scripts/FixHeadphone/fixheadphone.sh"
    sudo rm -f /Library/Scripts/FixHeadphone/fixheadphone.sh
    if [ $? -ne 0 ]; then
        echo "......【失败】"
        exit 1
    else
        echo "......【成功】"
    fi
fi

echo "..........恭喜，卸载成功.........."