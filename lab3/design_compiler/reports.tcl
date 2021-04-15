

echo OUTPUT FILES AND REPORTS

set verbose 0;                  # 1 Write reports to screen, 0 do not write reports to screen
set verbose_dft 0;              # 1 Write reports to screen, 0 do not write reports to screen
set filebase [format "%s%s" [format "%s%s" $basename "_"] $runname]

####################################
# generate reports for user to view
####################################
if { $verbose == 1 } {
    report_design
    report_hierarchy
    report_timing -path full -delay max -nworst 3 -significant_digits 2 -sort_by group
    report_timing -path full -delay min -nworst 3 -significant_digits 2 -sort_by group
    report_area
    report_cell
    report_net
    report_port -v
    report_power -analysis_effort low
}
# Design and Hierarchy reports
set filename [format "%s%s%s" ./reports/ $filebase ".design"]
redirect $filename { report_design }
set filename [format "%s%s%s" ./reports/ $filebase ".design"]
redirect -append $filename { report_hierarchy }

# Timing reports
set filename [format "%s%s%s" ./reports/ $filebase ".timing"]
redirect $filename { report_timing -path full -delay max -nworst 5 -significant_digits 2 -sort_by group}
set filename [format "%s%s%s" ./reports/ $filebase ".timing"]
redirect -append $filename { report_timing -path full -delay min -nworst 5 -significant_digits 2 -sort_by group }

# Report_cell and report_area
set filename [format "%s%s%s" ./reports/ $filebase ".area"]
redirect $filename { report_area }
set filename [format "%s%s%s" ./reports/ $filebase ".area"]
redirect -append $filename { report_cell }

# Report port
set filename [format "%s%s%s" ./reports/ $filebase ".ports"]
redirect $filename { report_port -v}

#report net
set filename [format "%s%s%s" ./reports/ $filebase ".net"]
redirect $filename { report_net }

# report power
set filename [format "%s%s%s" ./reports/ $filebase ".pow"]
redirect $filename { report_power -analysis_effort low }
