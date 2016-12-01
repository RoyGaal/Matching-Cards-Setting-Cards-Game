//
//  PlayingCardViewController.m
//  FlipCards
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import "PlayingCardViewController.h"

#import "PlayingCardDeck.h"

#import "PlayingCardView.h"

#import "PlayingCard.h"


@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController


#pragma mark - CreateDeck
-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (UIView *)createViewForCard:(Card *)card
{
    PlayingCardView *view = [[PlayingCardView alloc] init];
    [self updateView:view forCard:card];
    return view;
}

- (void)updateView:(UIView *)view forCard:(Card *)card
{
    if (![card isKindOfClass:[PlayingCard class]]) return;
    if (![view isKindOfClass:[PlayingCardView class]]) return;
    PlayingCard *playingCard = (PlayingCard *)card;
    PlayingCardView *playingCardView = (PlayingCardView *)view;
    playingCardView.rank = playingCard.rank;
    playingCardView.suit = playingCard.suit;
    playingCardView.faceUp = playingCard.chosen;
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.numberOfStartingCards = 36;
    
    self.maxCardSize = CGSizeMake(150.0, 185);
    
    [self updateUI];
}


@end
