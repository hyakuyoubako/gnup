#gnuplot setting file
#20191221おー

set yrange [975:1025]
set xlabel "時間[時]"
set ylabel "気圧[hPa]"
set output "/home/pi/denpa-gardening/sensor_data/sensor_data_pressure.png"

plot "/home/pi/denpa-gardening/sensor_data/sensor_data.csv" u 1:4 w l ti "気圧[hPa]"
set output
