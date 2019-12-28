#!/bin/bash
#gnuplot setting file
#20191221おー

set yrange [0:100]
set xlabel "日付[日]"
set ylabel "湿度[%]"
set output "/home/pi/denpa-gardening/sensor_data/sensor_data_humid_monthly.png"

plot "/home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv" u 1:3 w l ti "湿度[%]"
set output
