//
//  ViewController.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/23.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;

@end

@implementation ViewController

- (Deck *)deck
{
    if (_deck == nil) {
        _deck = [self createDeck];
    }
    
    return _deck;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)button
{
    if (button.currentTitle.length) {
        [button setBackgroundImage:[UIImage imageNamed:@"stanford"] forState:UIControlStateNormal];
        [button setTitle:@"" forState:UIControlStateNormal];
        
        self.flipCount++;
    } else {
        Card *randomCard = [self.deck drawRandomCard];
        
        if (randomCard) {
            [button setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [button setTitle:randomCard.contents forState:UIControlStateNormal];
            
            self.flipCount++;
        }
    }
}

@end
