
set ns [new Simulator]

$ns color 0 blue
$ns color 1 red
$ns color 2 white

set n0 [$ns node]
set n1 [$ns node]

set f [open out.tr w]
$ns trace-all $f
set nf [open out.nam w]
$ns namtrace-all $nf

$ns duplex-link $n0 $n1 5Mb 2ms DropTail

$ns duplex-link-op $n0 $n1 orient right-up

$ns duplex-link-op $n0 $n1 queuePos 0.5

#set udp0 [new Agent/UDP]
#$ns attach-agent $n0 $udp0
#$udp0 set class_ 1
#set cbr0 [new Application/Traffic/CBR]
#$cbr0 attach-agent $udp0

#set null0 [new Agent/Null]
#$ns attach-agent $n1 $null0

#$ns connect $udp0 $null0

#$ns at 1.0 "$cbr0 start"

set tcp [new Agent/TCP]
$tcp set class_ 1
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n1 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.2 "$ftp start"

set tcp1 [new Agent/TCP]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp1
$ns attach-agent $n1 $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 1.3 "$ftp1 start"

#$ns at 1.35 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n3 $sink"

#puts [$cbr0 set packetSize_]
#puts [$cbr0 set interval_]

$ns at 1.4 "finish"

proc finish {} {
	global ns f nf
	$ns flush-trace
	close $f
	close $nf

	exit 0
}

$ns run

