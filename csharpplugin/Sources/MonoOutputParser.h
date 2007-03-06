/*
	INOCamlCommandOutputParser.h - OCamlPlugin
	Copyright 2005-2006 Damien Bobillot.
	Distributed under the GPL licence.
 */

#import "XCPOutputParsing.h"

@interface MonoOutputParser : XCBuildCommandOutputParser
{
}
- (id)initWithNextOutputStream:(XCOutputStream*)nextOutputStream;
- (void)writeBytes:(const char *)data length:(unsigned int)length;
@end
