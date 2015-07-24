//
//  PlayingCard.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

/**
 *  playingCard 花色
 */
@property (nonatomic, strong) NSString *suit;
/**
 *  playingCard 点数
 */
@property (nonatomic) NSUInteger rank;

/**
 *  获取有效的 playingCard 花色列表
 *
 *  @return 有效的 playingCard 花色列表
 */
+ (NSArray *)validSuits;

/**
 *  获取 playingCard 点数最大值
 *
 *  @return playingCard 点数最大值
 */
+ (NSUInteger)maxRank;

@end
