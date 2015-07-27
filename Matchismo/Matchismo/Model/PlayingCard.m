//
//  PlayingCard.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

/**
 *  playingCard 内容
 *
 *  @return 格式化的 playingCard 内容
 */
- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [NSString stringWithFormat:@"%@%@", self.suit, rankStrings[self.rank]];
}

/**
 *  获取 playingCard 点数字符串列表
 *
 *  @return playingCard 点数字符串列表
 */
+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

/**
 *  playingCards 进行匹配
 *
 *  @param otherCards 其他 playingCards
 *
 *  @return 匹配得分
 */
- (NSInteger)match:(NSArray *)otherCards
{
    NSInteger score = 0;
    
    if (1 == otherCards.count) {
        id card = [otherCards lastObject];
        
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            
            if (self.rank == otherCard.rank) {
                score = 4;
            } else if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            }
        }
    }
    
    return score;
}

@synthesize suit = _suit;

/**
 *  playingCard 花色
 *
 *  @return playingCard 花色 or @"?"
 */
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

/**
 *  playingCard 花色
 *
 *  @param suit playingCard 花色字符串
 */
- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

/**
 *  获取有效的 playingCard 花色列表
 *
 *  @return 有效的 playingCard 花色列表
 */
+ (NSArray *)validSuits
{
    return @[@"♥︎", @"♦︎", @"♠︎", @"♣︎"];
}

/**
 *  获取 playingCard 点数最大值
 *
 *  @return playingCard 点数最大值
 */
+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

@end
