//
//  ViewController.h
//  FlipCards
//
//  Created by roy gal on 10/26/16.
//  Copyright © 2016 roy gal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Deck.h"

@interface ViewController : UIViewController

-(Deck *)createDeck; // Abstract

-(void)updateUI;

@property(nonatomic) NSUInteger numberOfStartingCards;
@property(nonatomic) CGSize maxCardSize;
@property(nonatomic) BOOL removeMatchingCards;

@end
