//
//  CardMatchingGame.h
//  FlipCards
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;


@property(nonatomic, readonly) NSInteger score;

-(void)matchTwoCards;
-(void)matchThreeCards;

@property(nonatomic)NSUInteger maxMatchingCards;

@property(nonatomic, readonly) NSUInteger numberOfDealtCards;

-(void)drawNewCard;

@property(nonatomic, readonly)BOOL deckIsEmpty;

@end
