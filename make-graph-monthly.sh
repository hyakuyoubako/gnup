#!/bin/bash
#20191227おー
set -eu

INFILE=$1

#古いデータ削除～データは基本追記なので、二度三度追記しないように消す。
if [ -e /home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv ]; then
sudo rm /home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv
fi

#1か月分のデータをまとめる20191227おー
for i in `seq -f %02g 1 31`;
do
    if [ -e /home/pi/denpa-gardening/sensor_data/sensor_data_$1$i.csv ]; then
    sudo cat /home/pi/denpa-gardening/sensor_data/sensor_data_$1$i.csv >> /home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv
    fi
done

#OUT_TEMP_HUMID="sensor_data_temp_humid.png"
#OUT_TEMP="sensor_data_temp.png"
#OUT_HUMID="sensor_data_humid.png"
#OUT_PRESSURE="sensor_data_pressure.png"
TITLE="$1 センサーデータ"
#TIME_LABEL="日付[日]"
#TEMP_LABEL="気温[C]"
#HUMID_LABEL="湿度[%]"
#PRESSURE_LABEL="気圧[hPa]"

gnuplot <<EOF

set font "NotoSerifCJK-SemiBold.ttc,14"
set terminal png font "NotoSerifCJK-SemiBold.ttc,14" enhanced
set datafile separator ','
set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
#x軸を日にちにする
set format x '%d'

set mxtics 2
set mytics 2
set grid xtics ytics mxtics mytics
set key outside
# second ax
set y2tics
set title '$TITLE'
set term png size 800,480
#set xrange ['2016/01/01 10:00:00':'2016/12/31 12:00:00']
#Xレンジを固定してみる20191109
#set xrange ['0:00:00':'23:50:00']

#以下別ファイルを呼び出すことで文字化け解消20191221おー
load "/home/pi/gnup/temphumidmonthly.gnu"

load "/home/pi/gnup/tempmonthly.gnu"

load "/home/pi/gnup/humidmonthly.gnu"

load "/home/pi/gnup/pressmonthly.gnu"
EOF

sudo cp -f /home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv /var/www/html/sensor_data_$1.csv
sudo cp /home/pi/denpa-gardening/sensor_data/sensor_data_temp_humid_monthly.png /var/www/html/sensor_data_temp_humid_$1.png
sudo cp /home/pi/denpa-gardening/sensor_data/sensor_data_temp_monthly.png /var/www/html/sensor_data_temp_$1.png
sudo cp /home/pi/denpa-gardening/sensor_data/sensor_data_humid_monthly.png /var/www/html/sensor_data_humid_$1.png
sudo cp /home/pi/denpa-gardening/sensor_data/sensor_data_pressure_monthly.png /var/www/html/sensor_data_pressure_$1.png
