#import <XCTest/XCTest.h>
#import "NSString+OpinionatedExtensions.h"


@interface StringExtensionTests : XCTestCase

@end


@implementation StringExtensionTests

- (void)testCharacterEnumeration {
	NSMutableArray *probes = [NSMutableArray array];
	for (NSString *c in [@"abc" characterEnumerator]) {
		[probes addObject:c];
	}
	XCTAssertEqual(probes.count, 3);
	XCTAssertEqualObjects([probes firstObject], @"a");
	XCTAssertEqualObjects([probes objectAtIndex:1], @"b");
	XCTAssertEqualObjects([probes lastObject], @"c");
}

@end
