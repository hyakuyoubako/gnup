#!/bin/bash
#gnuplot setting file
#20191221おー

set yrange [975:1025]
set xlabel "日付[日]"
set ylabel "気圧[hPa]"
set output "/home/pi/denpa-gardening/sensor_data/sensor_data_pressure_monthly.png"

plot "/home/pi/denpa-gardening/sensor_data/sensor_data_monthly.csv" u 1:4 w l ti "気圧[hPa]"
set output
