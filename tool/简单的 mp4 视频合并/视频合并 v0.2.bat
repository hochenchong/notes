:: 版本号：0.2
:: 作者：HochenChong
:: 时间：2019-9-23
@echo off
:: 进入拖进来的文件夹
cd %1
:: 获取该目录下 mp4 格式的文件名，并导出为 fileName.txt
dir /b *.mp4 > fileName.txt
:: 修改 fileName.txt 文本中的格式为 file '文件名'
setlocal enabledelayedexpansion
set startStr=file '
set endStr='
for /f "delims=" %%i in (fileName.txt) do (
echo !startStr!%%i!endStr! >> temp.txt)
type temp.txt>fileName.txt
del /f/q temp.txt
echo 当前bat文件路径：%~dp0
:: 使用 ffmpeg 命令合并成新的 mp4 文件为 new.mp4
%~dp0/ffmpeg -f concat -safe 0 -i fileName.txt -c copy new.mp4
del /f/q fileName.txt
echo ----- 合并完成，文件名为：new.mp4 -----
pause