set ns [new Simulator];	#Create a simulator instance


set f [open out.tr w]; 	#create trace file
$ns trace-all $f;	#associate default trace to tracefile
set nf [open out.nam w];#create nam trace file
$ns namtrace-all $nf;	#associate default nam trace to nam tracefile


$ns at 3.0 "finish";	#execute finish procedure

			#finish procedure close files and run nam
proc finish {} {	
	global ns f nf
	$ns flush-trace
	close $f
	close $nf

	puts "running nam..."
	exec nam out.nam &
	exit 0
}

$ns run;		#start simulation (always : last command)

