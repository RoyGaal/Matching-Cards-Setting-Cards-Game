//
//  Card.m
//  FlipCard
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "Card.h"


@interface Card()

@end


@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}


-(NSUInteger)numberOfMatchingCards
{
    if (!_numberOfMatchingCards)
    {
        _numberOfMatchingCards = 2;
    }
    
    return _numberOfMatchingCards;
}

@end
