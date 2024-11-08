set terminal dumb
set title "Memory and CPU Usage"
set xlabel "Time (s)"
set ylabel "Usage (%)"
set grid
plot "usage_data.txt" using 0:1 with lines title 'Memory Usage', \
     "usage_data.txt" using 0:2 with lines title 'CPU Usage'