import sys

con_table = { "+" : "0",
              "-" : "1",
              ">" : "2",
              "<" : "3",
              "[" : "4",
              "]" : "5",
              "." : "6",
              "," : "7"}
bytecode = ""

# Reading from .bf file
print(sys.argv[1])
filename = sys.argv[1]
with open(filename, "r") as file:
    for c in file.read():
        if c in con_table:
            bytecode += con_table[c]
            bytecode += " "

# Writing converted bytecode to .brn file
new_filename = sys.argv[1].split(".")[-2].replace("\\", "") + ".coe"
with open(new_filename, "w") as file:
    file.write("memory_initialization_radix=10;\nmemory_initialization_vector=")
    file.write(bytecode)

print("Wrote outputted bytecode to <", new_filename + ">")
print(bytecode)