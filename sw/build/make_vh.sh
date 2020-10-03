sed "s/^/a]=64'h/g" OUTPUT_DW.HEX | awk -v RS="" '{gsub (/\n/,";\n")}1' | awk '{for(x=0;x<=NF;x++)if($x~/^a/){sub(/^a/,++i-1)}}1' | awk 'sub(/^/,"rom[")' > ../bootrom.vh
echo ';' >> ../bootrom.vh