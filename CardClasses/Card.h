//
//  Card.h
//  FlipCard
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject


@property(strong, nonatomic)NSString *contents;
@property(nonatomic, getter = isChosen)BOOL chosen;
@property(nonatomic, getter = isMatched)BOOL matched;

-(int)match:(NSArray *)otherCards;

@property(nonatomic)NSUInteger numberOfMatchingCards;


@end
