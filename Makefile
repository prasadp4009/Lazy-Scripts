# @Author: Pandit Prasad
# @Date:   20-Jul-2016
# @Last modified by:   Prasad Pandit
# @Last modified time: 29-Oct-2016

work= work
RTL= ../rtl/*.sv
TB = ../tb/*.sv
INC = +incdir+../rtl
INCTB = +incdir+../tb

ifneq ("$(wildcard "../env")","")
ENV = ../env/*.sv
INCENV = +incdir+../env
else
ENV =
INCENV =
endif

ifneq ("$(wildcard "../pkg")","")
PKG = ../pkg/*.sv
INCPKG = +incdir+../pkg
else
PKG =
INCPKG =
endif

ifeq ($(OS),Windows_NT)
DELFILES = clean_dos
else
DELFILES = clean_linux
endif
#VSIMOPT= -novopt -coverage work.tb

VSIMOPT= -novopt work.tb

#VSIMBATCH= -c -do "run -all; coverage report -html -htmldir covhtmlreport -verbose -threshL 50 -threshH 90; exit"

VSIMBATCH= -c -do "run -all; exit"

#VSIMDEBUG= -c -do "run -all; coverage report -html -htmldir covhtmlreport -verbose -threshL 50 -threshH 90; exit"

VSIMDEBUG= -c -do "run -all; exit"

#VSIMGUI= -do "do wave.do;run -all;coverage report -html -htmldir covhtmlreport -verbose -threshL 50 -threshH 90"

VSIMGUI= -do "do wave.do;run -all;"

cmp:
	vlib $(work)
	vmap work $(work)
	vlog -cover bcst -work $(work) $(INCPKG) $(INCTB) $(INC) $(PKG) $(ENV) $(RTL) $(TB)

run_sim:
	vsim $(VSIMBATCH) $(VSIMOPT) -l session.log

run_debug:
	vsim $(VSIMBATCH) $(VSIMOPT) -l session.log

run_gui:
	vsim $(VSIMGUI) $(VSIMOPT) -l session.log

run_testg:
	vsim -novopt work.tb
	clear

clean_linux:
	rm -rf modelsim.* transcript* vlog.* work vsim.wlf *.log
	clear

clean_dos:
	if exist modelsim.* del modelsim.* /F /S /Q /A
	if exist transcript* del transcript* /F /S /Q /A
	if exist vlog.* del vlog.* /F /S /Q /A
	if exist vsim.wlf del vsim.wlf /F /S /Q /A
	if exist *.log del *.log /F /S /Q /A
	if exist work rd work /q /s
	if exist covhtmlreport rd covhtmlreport /q /s

clean_log:
	if exist *.log del *.log /f /s /q /a

clean:
	make $(DELFILES)

run_test:
	make cmp
	make run_sim

run_test_gui:
	make cmp
	make run_gui

run_all:
	make clean
	make cmp
	make run_sim

run_all_gui:
	make clean
	make cmp
	make run_gui
