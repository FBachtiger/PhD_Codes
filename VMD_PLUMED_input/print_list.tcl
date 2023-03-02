package require topotools
package require psfgen
package require pbctools

set sfile conf.gro

mol new $sfile waitfor all

set ofile [open list.txt w]

#up:
#set no_bottom [ atomselect top "name OW and z>362" ]

#down:
set no_bottom [ atomselect top "name OW and z<345" ]

set list [$no_bottom list]
puts -nonewline $ofile $list

exit

#vmd -dispdev none -e print_list.tcl


