:: �汾�ţ�0.2
:: ���ߣ�HochenChong
:: ʱ�䣺2019-9-23
@echo off
:: �����Ͻ������ļ���
cd %1
:: ��ȡ��Ŀ¼�� mp4 ��ʽ���ļ�����������Ϊ fileName.txt
dir /b *.mp4 > fileName.txt
:: �޸� fileName.txt �ı��еĸ�ʽΪ file '�ļ���'
setlocal enabledelayedexpansion
set startStr=file '
set endStr='
for /f "delims=" %%i in (fileName.txt) do (
echo !startStr!%%i!endStr! >> temp.txt)
type temp.txt>fileName.txt
del /f/q temp.txt
echo ��ǰbat�ļ�·����%~dp0
:: ʹ�� ffmpeg ����ϲ����µ� mp4 �ļ�Ϊ new.mp4
%~dp0/ffmpeg -f concat -safe 0 -i fileName.txt -c copy new.mp4
del /f/q fileName.txt
echo ----- �ϲ���ɣ��ļ���Ϊ��new.mp4 -----
pause