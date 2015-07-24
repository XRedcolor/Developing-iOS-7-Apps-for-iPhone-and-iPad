//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

/**
 *  分数
 */
@property (nonatomic, readwrite) NSInteger score;
/**
 *  游戏中使用的 cards
 */
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

/**
 *  游戏中使用的 cards
 *
 *  @return 初始化的游戏中使用的 cards
 */
- (NSMutableArray *)cards
{
    if (_cards == nil) {
        _cards = [NSMutableArray array];
    }
    
    return _cards;
}

/**
 *  初始化 cardMatchingGame 游戏
 *
 *  @param count 游戏中 cards 的数量
 *  @param deck  游戏中使用的 cards
 *
 *  @return cardMatchingGame 游戏
 */
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; ++i) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

// 不匹配处罚
static const int MISMATCH_PENALTY = 2;
// 匹配奖金
static const int MATCH_BONUS = 4;
// 选择花费
static const int COST_TO_CHOOSE = 1;

/**
 *  利用索引选择 card
 *
 *  @param index 索引
 */
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (NO == card.isMatched) {
        if (YES == card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (YES == otherCard.isChosen && NO == otherCard.isMatched) {
                    NSInteger matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    
                    break;
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

/**
 *  利用索引获取 card
 *
 *  @param index 索引
 *
 *  @return 当前的 card
 */
- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

@end
