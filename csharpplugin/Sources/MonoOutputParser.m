/*
	INOCamlCommandOutputParser.m - OCamlPlugin
	Copyright 2005-2006 Damien Bobillot.
	Distributed under the GPL licence.
	
	History:
	- 19/07/05: created by Damien Bobillot (damien.bobillot.2002_ocamlplugin@m4x.org)
	- 20/08/05: add support for lex notice output
	- 02/10/05: use Xcode's regex support instead of the POSIX regex.h library
 */

#import "MonoOutputParser.h"
#import "XCPSupport.h"

TSRegularExpression* __regex_error = nil;
TSRegularExpression* __regex_warning = nil;


@implementation MonoOutputParser
+ (void)initialize
{
	__regex_error = [[TSRegularExpression alloc] initWithExpressionString:@"(.*)\\(([0-9]*),([0-9]*)\\): error (.*)"];
	__regex_warning = [[TSRegularExpression alloc] initWithExpressionString:@"(.*)\\(([0-9]*),([0-9]*)\\): warning (.*)"];
}

- (id)initWithNextOutputStream:(XCOutputStream*)nextOutputStream
{
	if((self = [super initWithNextOutputStream:nextOutputStream]) == nil) return nil;

	return self;
}

- (void)writeBytes:(const char*)data length:(unsigned)length
{
	NSString* line = [[[NSString alloc] initWithBytes:data length:length encoding:NSASCIIStringEncoding] autorelease];
	NSArray* subexpressions;
	if( nil != (subexpressions = [__regex_error subexpressionsForString:line]))
	{
		NSString* FilePath = [subexpressions objectAtIndex:1];
		NSString* LineNumber = [subexpressions objectAtIndex:2];
		NSString* ErrorText = [subexpressions objectAtIndex:4];
		
		id SelfDelegate = [self delegate];
		[SelfDelegate parser:self 
		  foundMessageOfType:1 
					   title:[ErrorText cString]
			   forFileAtPath:[FilePath cString]
				  lineNumber:[LineNumber intValue]];
	}
	else if( nil != (subexpressions = [__regex_warning subexpressionsForString:line]))
	{
		NSString* FilePath = [subexpressions objectAtIndex:1];
		NSString* LineNumber = [subexpressions objectAtIndex:2];
		NSString* ErrorText = [subexpressions objectAtIndex:4];
		
		id SelfDelegate = [self delegate];
		[SelfDelegate parser:self 
		  foundMessageOfType:2
					   title:[ErrorText cString]
			   forFileAtPath:[FilePath cString]
				  lineNumber:[LineNumber intValue]];
	}
	
	[super writeBytes:data length:length];
}
@end
