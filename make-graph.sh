#!/bin/sh

set -eu

INFILE=$1
#OUT_TEMP_HUMID="sensor_data_temp_humid.png"
#OUT_TEMP="sensor_data_temp.png"
#OUT_HUMID="sensor_data_humid.png"
#OUT_PRESSURE="sensor_data_pressure.png"
TITLE="$(date) センサーデータ"
#TIME_LABEL="時間[時]"
#TEMP_LABEL="気温[C]"
#HUMID_LABEL="湿度[%]"
#PRESSURE_LABEL="気圧[hPa]"

gnuplot <<EOF

set font "NotoSerifCJK-SemiBold.ttc,14"
set terminal png font "NotoSerifCJK-SemiBold.ttc,14" enhanced
set datafile separator ','
set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x '%H'

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
load "/home/pi/gnup/temphumid.gnu"

load "/home/pi/gnup/temp.gnu"

load "/home/pi/gnup/humid.gnu"

load "/home/pi/gnup/press.gnu"


EOF
