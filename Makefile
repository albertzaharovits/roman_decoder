.PHONY: all run clean

ANTLR_PATH=./
ANTLR_JAR=antlr-4.0-complete.jar

all: RomanDecoder.g
	java -jar $(ANTLR_PATH)$(ANTLR_JAR) $<
	javac *.java

run:
	java -cp $(ANTLR_PATH)$(ANTLR_JAR):. org.antlr.v4.runtime.misc.TestRig RomanDecoder number

clean:
	rm *.java
