vlib work
vcom -reportprogress 300 -work work ./common/fpnormalize_fpnormalize.vhd
vcom -reportprogress 300 -work work ./common/fpround_fpround.vhd
vcom -reportprogress 300 -work work ./common/packfp_packfp.vhd
vcom -reportprogress 300 -work work ./common/unpackfp_unpackfp.vhd

vcom -reportprogress 300 -work work ./multiplier/reg.vhd
vcom -reportprogress 300 -work work ./multiplier/fpmul_stage1_struct.vhd
vcom -reportprogress 300 -work work ./multiplier/fpmul_stage2_struct.vhd
vcom -reportprogress 300 -work work ./multiplier/fpmul_stage3_struct.vhd
vcom -reportprogress 300 -work work ./multiplier/fpmul_stage4_struct.vhd
vcom -reportprogress 300 -work work ./multiplier/fpmul_pipeline.vhd

vcom -reportprogress 300 -work work ./testbench/clk_gen.vhd
vcom -reportprogress 300 -work work ./testbench/data_maker.vhd
vcom -reportprogress 300 -work work ./testbench/data_sink.vhd
vlog -reportprogress 300 -work work ./testbench/tb_fpmul.v

vsim -novopt work.tb_fpmul
add wave sim:/tb_fpmul/UUT/*
run 160 ns
