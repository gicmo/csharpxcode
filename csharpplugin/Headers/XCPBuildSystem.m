/*
	XCPBuildSystem.h - XCode Plugin API
	Copyright 2005-2006 Damien Bobillot.
	Distributed under the GPL licence.
	
	Define a function to retreive all files in the framework build phase.
*/

#import "XCPBuildSystem.h"

@class PBXFileType;

@interface PBXFileReference
- (NSArray*)referencesForBuilding;
- (NSString*)path;
- (NSString*)unexpandedAbsolutePath;
- (PBXFileType*)fileType;
@end

@interface PBXBuildFile
- (PBXFileReference*)fileReference;
@end

@interface PBXBuildPhase
#if XCODE_VERSION < 22
- (NSArray*)filteredBuildFilesForTargetBuildContext:(PBXTargetBuildContext*)context;
#else
- (NSArray*)buildFiles;
#endif
@end

@interface PBXTarget
- (PBXBuildPhase*)defaultFrameworksBuildPhase;
@end

@interface PBXTargetBuildContext (BDPrivate)
- (PBXTarget*)target;
@end

@implementation PBXTargetBuildContext (BDExtensions)
- (NSArray*)linkedLibraryPaths {
	// From reverse engineering of the Ld linker
	NSMutableArray* paths = [NSMutableArray arrayWithCapacity:20];
	
	PBXBuildPhase* buildPhase = [[self target] defaultFrameworksBuildPhase];
#if XCODE_VERSION < 22
	NSEnumerator* buildFileEnum = [[buildPhase filteredBuildFilesForTargetBuildContext:self] objectEnumerator];
#else
	NSEnumerator* buildFileEnum = [[buildPhase buildFiles] objectEnumerator];
#endif
	PBXBuildFile* buildFile;
	while((buildFile = [buildFileEnum nextObject]) != nil) {
	
		NSEnumerator* fileEnum = [[[buildFile fileReference] referencesForBuilding] objectEnumerator];
		PBXFileReference* file;
		while((file = [fileEnum nextObject]) != nil)
			[paths addObject:[file unexpandedAbsolutePath]];
	}
	
	return paths;
}
@end
