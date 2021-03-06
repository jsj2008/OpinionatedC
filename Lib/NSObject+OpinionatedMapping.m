#import "NSObject+OpinionatedMapping.h"
#import "OCAssociation.h"
#import "OCCollectionCapabilities.h"


@implementation NSObject (OpinionatedMapping)

- (id)collect:(OCMapBlock)collectBlock {
	return [self map:collectBlock];
}

- (id)map:(OCMapBlock)mapBlock {
	
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		id<OCMutableCollectionConstruction> this = (id<OCMutableCollectionConstruction>)self;
		id mutableCollection = [this oc_createMutableInstanceOfMyKind];
		for (id each in [this oc_collectionEnumerator]) {
			[this oc_addObject:mapBlock(each) toMutableCollection:mutableCollection];
		}
		return [this oc_createCollectionOfMyKindFromMutableCollection:mutableCollection];
	}
	
	return mapBlock(self);
	
}

- (id)inject:(id)initialValue into:(OCReduceBlock)reduceBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		id<OCEnumerableCollection> this = (id<OCEnumerableCollection>)self;
		id running = initialValue;
		for (id each in [this oc_collectionEnumerator]) {
			running = reduceBlock(running, each);
		}
		return running;
	}
	
	return reduceBlock(initialValue, self);
	
}

- (id)reduce:(OCReduceBlock)reduceBlock {
	return [self inject:nil into:reduceBlock];
}

@end
