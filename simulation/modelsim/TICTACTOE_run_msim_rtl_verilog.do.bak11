transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/TicTacToe.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/squareBox.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/randomModule.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/positionMachine.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/playGrill.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/playerIterator.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/cronometer.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/checkEmpty.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/muxCustom.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/victoryCondition.sv}

vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Lab4TallerDigitales/Taller4Fixing {C:/TEC/Segundo Semestre 2022/taller/Lab4TallerDigitales/Taller4Fixing/TicTacToeTest.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TicTacToeTest

add wave *
view structure
view signals
run -all
