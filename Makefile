all: InputSourceToEng

InputSourceToEng: InputSourceToEng.m
	gcc -o $@ -Wall $< -framework Carbon -framework Foundation
