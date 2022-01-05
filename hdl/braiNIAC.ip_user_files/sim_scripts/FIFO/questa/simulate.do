onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib FIFO_opt

do {wave.do}

view wave
view structure
view signals

do {FIFO.udo}

run -all

quit -force
