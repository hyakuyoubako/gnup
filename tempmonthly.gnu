#!/bin/bash
#gnuplot setting file
#20191221おー

set yrange [-10:40]
set xlabel "日付[日]"
set ylabel "気温[C]"
set output "/home/pi/denpa-gardening/sensor_data/sensor_data_temp_monthly.png"

plot "/home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv" u 1:2 w l ti "気温[C]"
set output
