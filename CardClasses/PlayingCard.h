//
//  PlayingCard.h
//  FlipCard
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic)NSString *suit;
@property(nonatomic)NSUInteger rank;


+(NSArray *)validSuits;
+(NSUInteger)maxRank;


@end
