//
//  SetCardGameViewController.m
//  FlipCards
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "SetCardGameViewController.h"

#import "SetCardDeck.h"

#import "setCard.h"

#import "CardMatchingGame.h"

#import "SetCardView.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController


- (Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}


- (NSAttributedString *)titleForCard:(Card *)card
{
    NSString *symbol = @"?";
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    
    if ([card isKindOfClass:[SetCard class]])
    {
        SetCard *setCard = (SetCard *)card;
        
        if ([setCard.symbol isEqualToString:@"oval"]) symbol = @"●";
        
        if ([setCard.symbol isEqualToString:@"squiggle"]) symbol = @"▲";
        
        if ([setCard.symbol isEqualToString:@"diamond"]) symbol = @"■";
        
        symbol = [symbol stringByPaddingToLength:setCard.number
                                      withString:symbol
                                 startingAtIndex:0];
        
        if ([setCard.color isEqualToString:@"red"])
        {
            [attributes setObject:[UIColor redColor]
                           forKey:NSForegroundColorAttributeName];
        }
        if ([setCard.color isEqualToString:@"green"])
        {
            [attributes setObject:[UIColor greenColor]
                           forKey:NSForegroundColorAttributeName];
        }
        if ([setCard.color isEqualToString:@"purple"])
        {
            [attributes setObject:[UIColor purpleColor]
                           forKey:NSForegroundColorAttributeName];
        }
        if ([setCard.shading isEqualToString:@"solid"])
        {
            [attributes setObject:@-5
                           forKey:NSStrokeWidthAttributeName];
        }
        if ([setCard.shading isEqualToString:@"striped"])
        {
            [attributes addEntriesFromDictionary:@{
                                                   NSStrokeWidthAttributeName : @-5,
                                                   NSStrokeColorAttributeName : attributes[NSForegroundColorAttributeName],
                                                   NSForegroundColorAttributeName : [attributes[NSForegroundColorAttributeName]
                                                                                     colorWithAlphaComponent:0.1]}];
        }
        if ([setCard.shading isEqualToString:@"noColor"])
        {
            [attributes setObject:@5 forKey:NSStrokeWidthAttributeName];
        }
    }
    
    return [[NSMutableAttributedString alloc] initWithString:symbol
                                                  attributes:attributes];
}





-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.numberOfStartingCards = 12;
    
    self.maxCardSize = CGSizeMake(120.0, 120.0);
    
    self.removeMatchingCards = YES;
    
    [self updateUI];
}


- (void)updateUI
{
    [super updateUI];
}


- (UIView *)createViewForCard:(Card *)card
{
    SetCardView *view = [[SetCardView alloc] init];
    [self updateView:view forCard:card];
    return view;
}

- (void)updateView:(UIView *)view forCard:(Card *)card
{
    if (![card isKindOfClass:[SetCard class]]) return;
    if (![view isKindOfClass:[SetCardView class]]) return;
    
    SetCard *setCard = (SetCard *)card;
    SetCardView *setCardView = (SetCardView *)view;
    setCardView.color = setCard.color;
    setCardView.symbol = setCard.symbol;
    setCardView.shading = setCard.shading;
    setCardView.number = setCard.number;
    setCardView.chosen = setCard.chosen;
}
@end
