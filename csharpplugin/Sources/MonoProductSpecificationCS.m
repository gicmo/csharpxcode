/*
	MonoProductSpecificationCS.m
 
	Based heavily on:
	MAProductTypeSpecificationGNAT.m - AdaPlugin
	Copyright 2006 Damien Bobillot.
	Distributed under the GPL licence.
*/

#import "MonoProductSpecificationCS.h"
#import "XCPBuildSystem.h"

@implementation MonoProductSpecificationCS
- (void) initializeBuildSettingsInTargetBuildContext:(PBXTargetBuildContext*)context
{	
}

- (XCLinkerSpecification*) linkerSpecificationForObjectFilesInTargetBuildContext:(PBXTargetBuildContext*)context
{
	//
	// TODO: Check the .NET version to be used: V1 => mcs; V2 => gmcs
	//
	// Use the gmcs compiler
	XCLinkerSpecification* Result = [[XCLinkerSpecification specificationRegistry] objectForKey:@"com.mono.compilers.csharp.linker"];

	return Result;
}
@end
