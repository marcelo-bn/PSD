onbreak resume
onerror resume
vsim -novopt work.DUT_tb
add wave sim:/DUT_tb/u_DUT/clk
add wave sim:/DUT_tb/u_DUT/reset
add wave sim:/DUT_tb/u_DUT/clk_enable
add wave sim:/DUT_tb/u_DUT/X
add wave sim:/DUT_tb/u_DUT/ce_out
add wave sim:/DUT_tb/u_DUT/Y
add wave sim:/DUT_tb/Y_ref
run -all
