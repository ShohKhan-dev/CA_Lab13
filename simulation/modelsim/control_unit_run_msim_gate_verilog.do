transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {control_unit.vo}

vlog -vlog01compat -work work +incdir+G:/CA\ labs/Week13/ex {G:/CA labs/Week13/ex/alu_decoder.v}
vlog -vlog01compat -work work +incdir+G:/CA\ labs/Week13/ex {G:/CA labs/Week13/ex/control_unit.v}
vlog -vlog01compat -work work +incdir+G:/CA\ labs/Week13/ex {G:/CA labs/Week13/ex/main_decoder.v}
vlog -vlog01compat -work work +incdir+G:/CA\ labs/Week13/ex {G:/CA labs/Week13/ex/testbench.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
