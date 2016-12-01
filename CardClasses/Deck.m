//
//  Deck.m
//  FlipCard
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "Deck.h"


@interface Deck()
@property(strong, nonatomic) NSMutableArray *cards; // of Cards

@end


@implementation Deck



-(NSMutableArray *)cards // NSMutableArray *card getter
{
    if (!_cards) // if array is NIL then
    {
        _cards = [[NSMutableArray alloc] init]; // make array in heap
    }
    
    return _cards; // then return array
}



-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}


-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if([self.cards count])
    {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
    
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}



@end
