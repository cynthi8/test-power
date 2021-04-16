##################################################################
#### Design Compiler Script for ECE 128
#### Performs Synthesis only to AMI .5 technology
#### author: wgibb
#### note: this is a TCL script
#### modified from work done by tjf and eb
##################################################################

####################################
# ITEMS YOU WILL NEED TO SET FOR EACH DESIGN
# 1) myFiles - LIST OF YOUR FILES TO SYNTHESIZE
# 2) basename - TOP LEVEL MODULE IN YOUR DESIGN
# 3) myClk - NAME OF YOUR CLOCK SIGNAL
# 4) virtual - USE A REAL CLOCK (SEQUENTIAL DESIGNS) OR A VIRTUAL
# CLOCK (COMBINATORIAL DESIGNS)
# 5) myPeriod - SETS THE CLOCK SPEED, THUS DEFINING THE SYNTHESIS SPEED GOAL
####################################
# list of all HDL files in the design
set myFiles [list ./src/register.v];
set basename register;          # Top-level module name
set myClk clk;                  # The name of your clock
set virtual 0;                  # 1 if virtual clock, 0 if real clock
set myPeriod_ns 25;             # desired clock period (in ns) (sets speed goal)


####################################
# Some runtime options, change only if needed
####################################
set runname no_clock;                # Name appended to output files
set exit_dc 0;                  # 1 to exit DC after running, 0 to keep DC running
set verbose 0;                  # 1 Write reports to screen, 0 do not write reports to screen

####################################
# Timing and loading information
####################################
set myClkLatency_ns 0.3;                            # clock network latency
set myInDelay_ns 2.0;                               # delay from clock to inputs valid
set myOutDelay_ns 1.65;                             # delay from clock to output valid
set myInputBuf INVX1;                               # name of cell driving the inputs
set myLoadLibrary [file rootname $target_library];  # name of library the cell comes from
set myLoadPin A;                                    # name of pin that the outputs drive
set myMaxFanout 1;                                  # max fanout load for input pins
set myOutputLoad 0.1;                              # output pin loading


##################
# compiler switches...
##################
set optimizeArea 0;     # 1 for area, 0 for speed
set useUltra 0;         # 1 for compile_ultra, 0 for compile mapEffort, useUngroup are for non-ultra compile...
set useUngroup 0;       # 0 if no flatten, 1 if flatten


####################################
# Set some system-level things that RARELY change...
####################################
# synthetic_library is set in .synopsys_dc.setup to be
# the dw_foundation library.
#nathan edit below
#set link_library [concat [concat "*" $target_library] $synthetic_library]
####################################
set fileFormat verilog;         # verilog or VHDL


##############################################################
##############################################################
### YOU SHOULD NOT NEED TO CHANGE ANYTHING BELOW THIS LINE ###
##############################################################
##############################################################

##############################################################
#### read in, link to standard cells, and uniquify design ####
##############################################################

####################################
# remove any other designs from design compiler's memory
####################################
remove_design -all

####################################
# set clock gating style before analyzing for some reason
####################################
#set_clock_gating_style -sequential latch -min 4 -maxfanout 16

echo IMPORTING DESIGN
####################################
# analyzer & elaborate verilog source files
####################################
analyze -format $fileFormat -library DEFAULT $myFiles
elaborate $basename -library DEFAULT


####################################
# set design to 'highest' module level
####################################
current_design $basename


####################################
# link to standard cell libraries and uniquify
####################################
link
uniquify


####################################################
#### setup clock & all input/output constraints ####
####################################################
echo SETTING CONSTRAINTS


####################################
# now you can create clocks for the design
# and set other constraints
####################################
if { $virtual == 0 } {
    create_clock -period $myPeriod_ns $myClk
} else {
    create_clock -period $myPeriod_ns -name $myClk
}
set_clock_latency $myClkLatency_ns $myClk
set_fix_hold $myClk
set_clock_transition 0 $myClk


####################################
# set delays on all inputs & outputs with respect to the clock (in ns)
# set the input and output delay relative to myClk
####################################
if { $virtual == 0 } {
    set_input_delay $myInDelay_ns -clock $myClk [all_inputs]
} else {
    set_input_delay $myInDelay_ns -clock $myClk [remove_from_collection [all_inputs] $myClk]
}
set_output_delay $myOutDelay_ns -clock $myClk [all_outputs]


####################################
# Set the driving cell for all inputs except the clock
# The clock has infinite drive by default. This is usually
# what you want for synthesis because you will use other
# tools (like SOC Encounter) to build the clock tree
# (or define it by hand).
####################################
if { $virtual == 0 } {
    set_driving_cell -library $myLoadLibrary -lib_cell $myInputBuf [all_inputs]
} else {
    set_driving_cell -library $myLoadLibrary -lib_cell $myInputBuf [remove_from_collection [all_inputs] $myClk]
}


####################################
# set load/fanin/fanout for all inputs/outputs
####################################
set_load $myOutputLoad [all_outputs]


####################################
# check value of fanout
####################################
set_max_fanout $myMaxFanout [all_inputs]
set_fanout_load 8 [all_outputs]
echo DONE SETTING CONSTRAINTS


####################################
# This command will fix the problem of having
# assign statements left in your structural file.
# But, it will insert pairs of inverters for feedthroughs!
set_fix_multiple_port_nets -all -buffer_constants
####################################


echo BEGIN COMPILING DESIGN
####################################
# optimize for area
####################################
if { $optimizeArea == 1} {
    set_max_area 0
}


####################################
# now compile the design with given mapping effort
# and do a second compile with incremental mapping
# or use the compile_ultra meta-command
####################################

if { $useUltra == 1 } {
    compile_ultra
} else {
    if { $useUngroup == 1 } {
        compile -ungroup_all -map_effort medium
    } else {
        compile -map_effort medium -exact_map
    }
}
check_design
echo VIOLATIONS
report_constraint -all_violators



####################################
# quit dc
####################################
if { $exit_dc == 1} {
    exit
}
