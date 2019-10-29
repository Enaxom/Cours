# Copyright (c) 2004 INPT-ENSEEIHT - France
# Author: Riadh DHAOU
# Mail contact: Riadh.Dhaou@enseeiht.fr http://www.enseeiht.fr/~dhaou
# Object: 
# Create two nodes and connect them with a 1.5Mb link with a
# transmission delay of 10ms using FIFO drop-tail queueing
#
set ns [new Simulator]
set n0 [$ns node]
set n1 [$ns node]

#$ns duplex-link $n0 $n1 50Mb 0.000001ms DropTail
$ns duplex-link $n0 $n1 50Mb 200ms DropTail
#$ns duplex-link $n0 $n1 10kb 0.000001ms DropTail

#
# Set up BSD Tahoe TCP connection in opposite directions.
#
set src1 [$ns create-connection TCP/Newreno $n0 TCPSink $n1 1]
#set src2 [$ns create-connection TCP $n1 TCPSink $n0 2]
#$src1 set packetSize_ 125

#
# Create ftp sources at the each node
#
set ftp1 [$src1 attach-app FTP]
#set ftp2 [$src2 attach-app FTP]

#
# Start up the first ftp at the time 0 and
# the second ftp staggered 1 second later
#
$ns at 0.0 "$ftp1 send 1500000"
#$ns at 1.0 "$ftp2 start"

#
# Create a trace and arrange for all link
# events to be dumped to "out.tr"
#
set tf [open out.tr w]
$ns trace-queue $n0 $n1 $tf
set qmon [$ns monitor-queue $n0 $n1 ""]
set integ [$qmon get-bytes-integrator]

#
# Dump the queueing delay on the n0->n1 link
# to stdout every second of simulation time.
#
proc dump { link interval } {
	global ns integ
	$ns at [expr [$ns now] + $interval] "dump $link $interval"
	set delay [expr 8 * [$integ set sum_] / [[$link link] set bandwidth_]]
	puts "[$ns now] delay=$delay"
}
$ns at 0.0 "dump [$ns link $n0 $n1] 1"

#
# run the simulation for 20 simulated seconds
#
#$ns at 100.0 "$ns halt; exit 0"
$ns at 1000.0 "finish"

proc finish {} {
	global ns tf
	$ns flush-trace
	close $tf
	puts "processing..."
	exec process &
	exit 0
}

$ns run
