#gnuplot setting file
#20191221おー

set yrange [-10:40]
set xlabel "時間[時]"
set ylabel "気温[C]"
set output "/home/pi/denpa-gardening/sensor_data/sensor_data_temp.png"

plot "/home/pi/denpa-gardening/sensor_data/sensor_data.csv" u 1:2 w l ti "気温[C]"
set output
