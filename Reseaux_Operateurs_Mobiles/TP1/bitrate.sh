if [[ $# -ne 1 ]]; then
	echo "Usage: ./bitrate.sh <filename>";
	exit 1;
fi

file=`grep AGT $1 | grep ^r`;


for (( i = 1; i <= 150; i++ )); do
	find="\"^r ${i}\\.\"";
	lines=`echo $file | grep $find`;
	output="$i `echo $lines | wc -l`";
done

cat $output;
exit 0;
