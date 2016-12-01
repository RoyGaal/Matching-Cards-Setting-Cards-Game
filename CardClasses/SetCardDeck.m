//
//  SetCardDeck.m
//  FlipCards
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "SetCardDeck.h"

#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        for (NSString *color in [SetCard validColors])
        {
            for (NSString *symbol in [SetCard validSymbols])
            {
                for (NSString *shading in [SetCard validShadings])
                {
                    for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++)
                    {
                        SetCard *card = [[SetCard alloc] init];
                        
                        card.color = color;
                        card.symbol = symbol;
                        card.shading = shading;
                        card.number = number;
                        
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}
@end
