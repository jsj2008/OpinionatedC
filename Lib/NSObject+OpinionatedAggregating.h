#import <Foundation/Foundation.h>


typedef BOOL (^OCCountBlock)(id each);
typedef NSNumber *(^OCNumericAggregationBlock)(id each);
typedef id (^OCGroupByBlock)(id each);


@interface NSObject (OpinionatedAggregating)

/**
 * Answer the average of each of the receiver's elements, which have to be
 * NSNumber instances.
 */
- (NSNumber *)average;

/**
 * Evaluate averageBlock with each of the receiver's elements as the argument.
 * Answer the average of all block values.
 */
- (NSNumber *)average:(OCNumericAggregationBlock)averageBlock;

/**
 * Evaluate countBlock with each of the receiver's elements as the argument.
 * Answer the number of elements that answered true.
 */
- (NSUInteger)count:(OCCountBlock)countBlock;

/**
 * Return a dictionary whose keys are the result of evaluating groupedByBlock
 * for each of the receiver's elements. The value for each key is the collection
 * of elements that evaluated to that key.
 */
- (NSDictionary *)groupedBy:(OCGroupByBlock)groupedByBlock;

/**
 * Answer the maximum of each of the receiver's elements, which must support
 * comparison through compare:.
 */
- (id)max;

/**
 * Evaluate maxBlock with each of the receiver's elements as the argument.
 * Answer the element with the highest block value.
 */
- (id)max:(OCNumericAggregationBlock)maxBlock;

/**
 * Answer the minimum of each of the receiver's elements, which must support
 * comparison through compare:.
 */
- (id)min;

/**
 * Evaluate minBlock with each of the receiver's elements as the argument.
 * Answer the element with the lowest block value.
 */
- (id)min:(OCNumericAggregationBlock)minBlock;

/**
 * Answer the sum of each of the receiver's elements, which have to be 
 * NSNumber instances.
 */
- (NSNumber *)sum;

/**
 * Evaluate sumBlock with each of the receiver's elements as the argument.
 * Answer the sum of all block values.
 */
- (NSNumber *)sum:(OCNumericAggregationBlock)sumBlock;

@end
