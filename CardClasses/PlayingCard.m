 //
//  PlayingCard.m
//  FlipCard
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end


@implementation PlayingCard



-(int)match:(NSArray *)otherCards // overloading match from card.h
{
    int score = 0;
    
    if ([otherCards count] == 1)
    {
        id card = [otherCards firstObject];
        
        if ([card isKindOfClass:[PlayingCard class]])
        {
            PlayingCard *otherCard = (PlayingCard *)card;
            
            if (otherCard.rank == self.rank)
            {
                score = 4;
            }
            else if ([otherCard.suit isEqualToString:self.suit])
            {
                score = 1;
            }
            
        }
    }
    
    if ([otherCards count] > 1)
    {
        for(id card in otherCards)
        {
            if ([card isKindOfClass:[PlayingCard class]])
            {
                PlayingCard *otherCard = (PlayingCard *)card;
                
                if (otherCard.rank == self.rank)
                {
                    score +=2;
                }
                else if ([otherCard.suit isEqualToString:self.suit])
                {
                    score++;
                }
            }
        }
    }
    
    return score;
}



+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}



-(NSString *)contents // overriding cards contents getter
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank]  stringByAppendingString:self.suit];
}



@synthesize suit = _suit; // because we provide setter AND getter

+(NSArray *)validSuits
{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}




+(NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}




-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}




@end
