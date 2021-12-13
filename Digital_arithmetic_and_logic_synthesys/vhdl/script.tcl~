vcom -reportprogress 300 -work work ./myfir.vhd
vcom -reportprogress 300 -work work ./testbench/clk_gen.vhd
vcom -reportprogress 300 -work work ./testbench/data_maker_new.vhd
vcom -reportprogress 300 -work work ./testbench/data_sink.vhd
vlog -reportprogress 300 -work work ./testbench/tb_fir.v

vsim -novopt work.tb_fir
add wave sim:/tb_fir/UUT/*
run 2200 ns
