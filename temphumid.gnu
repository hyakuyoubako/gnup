#gnuplot setting file
#20191221おー

set yrange [-20:40]
set y2range [10:100]
set xlabel "時間[時]"
set ylabel "気温[C]"
set y2label "湿度[%]"
set output "/home/pi/denpa-gardening/sensor_data/sensor_data_temp_humid.png"

plot "/home/pi/denpa-gardening/sensor_data/sensor_data.csv" u 1:2 w l ti "気温[C]","/home/pi/denpa-gardening/sensor_data/sensor_data.csv" u 1:3 w l axes x1y2 ti "湿度[%]"
set output
unset y2tics
unset y2label

