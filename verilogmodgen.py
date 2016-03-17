#!usr/bin/python

import sys
import os
import re

print ("+_+_+_+_+_+_+_+ Welcome to Verilog Project Creator +_+_+_+_+_+_+_+\n")

module_name = input("Enter name of module: ")

if not re.match("^[A-Za-z0-9_]*$", module_name):
    if not re.match("^[A-Za-z_]*$", module_name[0]):
        print ("ERROR: Wrong module name format")
        sys.exit(0)

try:
    module_name = module_name.capitalize()
    os.mkdir(module_name)
    os.chdir(module_name)
    module_name = module_name.lower()
    print ("Creating Directory: docs")
    os.mkdir("docs")
    print ("Creating Directory: src")
    os.mkdir("src")
    os.chdir("./src")
    print ("Creating Directory: rtl")
    os.mkdir("rtl")
    print ("Creating Directory: sim")
    os.mkdir("sim")
    print ("Creating Directory: tb")
    os.mkdir("tb")
    print ("Creating Directory: synth")
    os.mkdir("synth")
    print ("Creating Directory: scripts")
    os.mkdir("scripts")
    os.chdir("./rtl")
    module_rtl = module_name + ".v"
    print ("Creating file: ",module_rtl)
    module_file = open(module_rtl,'w')
    module_file.close()
    os.chdir("../tb")
    module_tb = module_name + "_tb.v"
    print ("Creating file: ",module_tb)
    module_file = open(module_tb,'w')
    module_file.close()
    os.chdir("../../../")
    print ("+_+_+_+_+_+_+_+ Done with module creation....!!!!! +_+_+_+_+_+_+_+\n")
    
except FileNotFoundError as err:
    print("Error: File Not Found", format(err))
    sys.exit(0)
except NameError:
    print("Error: Undefined variable", format(err))
    sys.exit(0)
          
sys.exit(0)

    
