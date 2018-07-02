onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PC_opt

do {wave.do}

view wave
view structure
view signals

do {PC.udo}

run -all

quit -force
