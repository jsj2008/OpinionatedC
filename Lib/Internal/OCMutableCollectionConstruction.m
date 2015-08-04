#import "OCMutableCollectionConstruction.h"
#import "NSDictionary+OpinionatedExtensions.h"
#import "OCAssociation.h"


@implementation NSArray (OCMutableCollectionConstruction)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableArray array];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self objectEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [self.class arrayWithArray:collection];
}

@end


@implementation NSDictionary (OCMutableCollectionConstruction)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableDictionary dictionary];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self associationEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	OCAssociation *assoc = obj;
	[collection setObject:assoc.value forKey:assoc.key];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [self.class dictionaryWithDictionary:collection];
}

@end


@implementation NSSet (OCMutableCollectionConstruction)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableSet set];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self objectEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [self.class setWithSet:collection];
}

@end