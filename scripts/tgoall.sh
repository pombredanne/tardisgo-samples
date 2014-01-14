# Test TARDIS Go on all supported targets (assuming output only via console)
# only tested on OSX 
tardisgo *.go
if [ "$?" = "0" ]; then
	haxe -main tardis.Go -dce full -swf tardisgo.swf
	haxe -main tardis.Go -dce full -neko tardisgo.n
	haxe -main tardis.Go -dce full -js tardisgo.js
	haxe -main tardis.Go -dce full -cpp cpp 
	haxe -main tardis.Go -dce full -java java
	haxe -main tardis.Go -dce full -cs cs
	haxe -main tardis.Go -dce full -php php --php-prefix tardisgo
	echo "Neko (interp):"
	haxe -main tardis.Go --interp
	echo "Neko:"
	neko pogo.n
	echo "Node/JS:"
	node < tardisgo.js
	echo "CPP:"
	./cpp/Go
	echo "Java:"
	java -jar java/java.jar
	echo "CS:"
	mono ./cs/bin/cs.exe
	echo "PHP:"
	php php/index.php
	echo "Opening swf file (Chrome as a file association for swf works to test):"
	open tardisgo.swf
fi
