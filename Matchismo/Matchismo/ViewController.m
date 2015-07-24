//
//  ViewController.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface ViewController ()

/**
 *  纸牌游戏
 */
@property (nonatomic, strong) CardMatchingGame *game;
/**
 *  纸牌 Buttons
 */
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
/**
 *  分数 Label
 */
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

/**
 *  纸牌游戏
 *
 *  @return 初始化的纸牌游戏
 */
- (CardMatchingGame *)game
{
    if (_game == nil) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[self createDeck]];
    }
    
    return _game;
}

/**
 *  获取游戏中的整副纸牌
 *
 *  @return 游戏中的整副纸牌
 */
- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

/**
 *  翻开纸牌
 *
 *  @param button 纸牌 Button
 */
- (IBAction)touchCardButton:(UIButton *)button
{
    NSInteger chosenButtonIndex = [self.cardButtons indexOfObject:button];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

/**
 *  更新游戏界面
 */
- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    }
}

/**
 *  获取游戏中的纸牌内容
 *
 *  @param card 纸牌
 *
 *  @return 游戏中的纸牌内容
 */
- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

/**
 *  获取游戏中的纸牌背景
 *
 *  @param card 纸牌
 *
 *  @return 游戏中的纸牌背景
 */
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
