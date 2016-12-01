//
//  CardMatchingGame.m
//  FlipCards
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic, readwrite) NSInteger score;
@property(nonatomic, strong) NSMutableArray *cards; //of Card
@property(nonatomic, readwrite) NSInteger numberOfCardsToMatch;
@property(nonatomic, strong)Deck *deck;

@end


@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc]init];
    }
    
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self)
    {
        _deck = deck;
        
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            
                if(card)
                {
                    [self.cards addObject:card];
                }
                else
                {
                    self = nil;
                    break;
                }
        }
    }
    
    //self.maxMatchingCards = 2;
    return self;
}

-(instancetype)init
{
    return nil;
}


-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count] ? self.cards[index] : nil);
}


-(void)matchTwoCards
{
    self.numberOfCardsToMatch = 2;
}
-(void)matchThreeCards
{
    self.numberOfCardsToMatch = 3;
}


-(NSUInteger *)maxMatchingCards
{
    Card *card = [self.cards firstObject];
    
    if (_maxMatchingCards < card.numberOfMatchingCards)
    {
        _maxMatchingCards = card.numberOfMatchingCards;
    }
    
    return _maxMatchingCards;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE_CARD = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched)
    {
        if (card.isChosen)
        {
            card.chosen = NO;
        }
        else
        {
            // Make an array with chosen cards
            NSMutableArray *otherCards = [NSMutableArray array];
            
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    [otherCards addObject:otherCard];
                }
            }
            
            
            if ([otherCards count] == (self.maxMatchingCards - 1))
            {
                int matchScore = [card match:otherCards];
                
                if (matchScore)
                {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    
                    for (Card *otherCard in otherCards)
                    {
                        otherCard.matched = YES;
                    }
                }
                else
                {
                    self.score -= MISMATCH_PENALTY;
                    
                    // Save here when mismatch occur
                    NSString *otherCardsLiveResults = @"";
                    
                    for (Card *otherCard in otherCards)
                    {
                        otherCard.chosen = NO;
                        otherCardsLiveResults = [otherCardsLiveResults stringByAppendingFormat:@"%@", otherCard.contents];
                    }
                    
                }
            }
            
            self.score -= COST_TO_CHOOSE_CARD;
            card.chosen = YES;
        }
    }
}


- (void)drawNewCard
{
    Card *card = [self.deck drawRandomCard];
    if (card) {
        [self.cards addObject:card];
    }
}

- (BOOL)deckIsEmpty
{
    Card *card = [self.deck drawRandomCard];
    if (card) {
        [self.deck addCard:card];
        return NO;
    }
    return YES;
}


-(NSUInteger)numberOfDealtCards
{
    return [self.cards count];
}

@end
