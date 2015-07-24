//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

/**
 *  分数
 */
@property (nonatomic, readonly) NSInteger score;
/**
 *  初始化 cardMatchingGame 游戏
 *
 *  @param count 游戏中 cards 的数量
 *  @param deck  游戏中使用的 cards
 *
 *  @return cardMatchingGame 游戏
 */
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
/**
 *  利用索引选择 card
 *
 *  @param index 索引
 */
- (void)chooseCardAtIndex:(NSUInteger)index;
/**
 *  利用索引获取 card
 *
 *  @param index 索引
 *
 *  @return 当前的 card
 */
- (Card *)cardAtIndex:(NSUInteger)index;

@end
