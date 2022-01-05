onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib brom_8x65k_opt

do {wave.do}

view wave
view structure
view signals

do {brom_8x65k.udo}

run -all

quit -force
