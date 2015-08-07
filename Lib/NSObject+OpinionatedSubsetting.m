#import "NSObject+OpinionatedSubsetting.h"
#import "OCCollectionCapabilities.h"
#import "OCAssociation.h"


@implementation NSObject (OpinionatedSubsetting)

- (BOOL)allSatisfy:(OCFilterBlock)satisfyBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSEnumerator *collectionEnumerator = [(id<OCEnumerableCollection>)self oc_collectionEnumerator];
		for (id each in collectionEnumerator) {
			if (!satisfyBlock(each)) {
				return NO;
			}
		}
		return YES;
	}
	
	return satisfyBlock(self);
	
}

- (BOOL)anySatisfy:(OCFilterBlock)satisfyBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSEnumerator *collectionEnumerator = [(id<OCEnumerableCollection>)self oc_collectionEnumerator];
		for (id each in collectionEnumerator) {
			if (satisfyBlock(each)) {
				return YES;
			}
		}
		return NO;
	}
	
	return satisfyBlock(self);
	
}

- (NSUInteger)count:(OCFilterBlock)countBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSEnumerator *collectionEnumerator = [(id<OCEnumerableCollection>)self oc_collectionEnumerator];
		NSUInteger count = 0;
		for (id each in collectionEnumerator) {
			if (countBlock(each)) {
				count++;
			}
		}
		return count;
	}
	
	return countBlock(self) ? 1 : 0;
	
}

- (id)detect:(OCFilterBlock)detectBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSEnumerator *collectionEnumerator = [(id<OCEnumerableCollection>)self oc_collectionEnumerator];
		for (id each in collectionEnumerator) {
			if (detectBlock(each)) {
				return each;
			}
		}
		return nil;
	}
	
	return detectBlock(self) ? self : nil;
	
}

- (id)first {
	return self;
}

- (id)first:(NSUInteger)count {
	return count > 0 ? @[self] : @[];
}

- (id)reject:(OCFilterBlock)rejectBlock {
	return [self select:^BOOL(id each) {
		return !rejectBlock(each);
	}];
}

- (id)select:(OCFilterBlock)selectBlock {

	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		id<OCMutableCollectionConstruction> this = (id<OCMutableCollectionConstruction>)self;
		id newCollection = [this oc_createMutableInstanceOfMyKind];
		for (id each in [this oc_collectionEnumerator]) {
			if (selectBlock(each)) {
				[this oc_addObject:each toMutableCollection:newCollection];
			}
		}
		return [this oc_createCollectionOfMyKindFromMutableCollection:newCollection];
	}
	
	return selectBlock(self) ? self : nil;
	
}

@end


@implementation NSArray (OpinionatedSubsetting)

- (id)first {
	return [self firstObject];
}

- (id)first:(NSUInteger)count {
	return [self subarrayWithRange:NSMakeRange(0, MIN(count, self.count))];
}

@end


@implementation NSString (OpinionatedSubsetting)

- (id)first {
	return [self first:1];
}

- (id)first:(NSUInteger)count {
	return [self substringWithRange:NSMakeRange(0, MIN(count, self.length))];
}

@end
