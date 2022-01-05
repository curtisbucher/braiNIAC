onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib counter_opt

do {wave.do}

view wave
view structure
view signals

do {counter.udo}

run -all

quit -force
