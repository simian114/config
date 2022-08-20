// An utility to change Inputsource to ABC Layout

#include <stdio.h>
#include <stdlib.h>
#include <Carbon/Carbon.h>
#include <Foundation/Foundation.h>
int main(int argc, char const * const * argv) {
    NSString *inputSourceID = [NSString stringWithUTF8String:"com.apple.keylayout.ABC"];
    NSDictionary *properties = [NSDictionary dictionaryWithObject:inputSourceID
                                                           forKey:(NSString *)kTISPropertyInputSourceID];
    NSArray *inputSources = [(NSArray *)TISCreateInputSourceList((CFDictionaryRef)properties, true) autorelease];
    TISInputSourceRef inputSource = (TISInputSourceRef)[inputSources objectAtIndex:0];
    TISSelectInputSource(inputSource);
    return 0;
}
