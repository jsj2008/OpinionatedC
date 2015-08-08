#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface DictionaryExtensionTests : XCTestCase

@end


@implementation DictionaryExtensionTests

- (void)testAssociationEnumeration {
	
	NSMutableDictionary *sut = [NSMutableDictionary dictionary];
	for (NSUInteger i = 0; i < 10000; i++) {
		[sut setObject:@"foo bar" forKey:@(i)];
	}
	NSMutableDictionary *probes = [NSMutableDictionary dictionary];
	
	for (OCAssociation *each in [sut associationEnumerator]) {
		XCTAssertTrue([each isKindOfClass:OCAssociation.class]);
		[probes setObject:each.value forKey:each.key];
	}
	XCTAssertEqualObjects(sut, probes);
	
}

- (void)testAdd {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict add:[@"hello world" asAssociationWithKey:@1]];
	XCTAssertEqualObjects([dict objectForKey:@1], @"hello world");
}

- (void)testIncludesKey {
	NSDictionary *sut = @{
		@1 : @""
	};
	XCTAssertTrue([sut includesKey:@1]);
	XCTAssertFalse([sut includesKey:@2]);
}

- (void)testIncludesValue {
	NSDictionary *sut = @{
		@1: @"hello world"
	};
	XCTAssertTrue([sut includesValue:@"hello world"]);
	XCTAssertFalse([sut includesValue:@"foo"]);
}

@end
