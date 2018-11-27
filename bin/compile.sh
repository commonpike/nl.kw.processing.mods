#!/bin/sh

cd `dirname $0`/..

LIBNAME=$(basename "$PWD").jar
COREJAR=/3rdparty/Processing.app/Contents/Java/core.jar

echo

read -p "Where is Processings core.jar [$COREJAR]? " corejar
if [ "$corejar" = "" ]; then
	corejar=$COREJAR
fi

read -p "What is the libraries name [$LIBNAME]? " libname
if [ "$libname" = "" ]; then
	libname=$LIBNAME
fi

# vi src/ExampleBar.java
# vi src/folder/foo/whatever/ExampleQuz.java

echo 'Compiling src/**.java to ./build/*.class ..'

find src -name "*.java" -print0 | xargs -0 \
 javac -d build -classpath "$corejar"

  
if [ $? -eq 0 ]; then
  
  echo "Jarring ./build/**.class to ./library/$libname.."
	jar -cf library/$libname -C build .

	echo All done.
	echo

fi

cd - &>/dev/null