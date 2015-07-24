//
//  Deck.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "Deck.h"

@interface Deck()

/**
 *  整副 cards
 */
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation Deck

/**
 *  整副 cards
 *
 *  @return 初始化的整副 cards
 */
- (NSMutableArray *)cards
{
    if (_cards == nil) {
        _cards = [NSMutableArray array];
    }
    
    return _cards;
}

/**
 *  添加 card
 *
 *  @param card  card
 *  @param atTop 是否置顶
 */
- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

/**
 *  添加 card
 *
 *  @param Card card
 */
- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

/**
 *  获取随机的 card
 *
 *  @return 随机的 card
 */
- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if (self.cards.count) {
        NSUInteger index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
