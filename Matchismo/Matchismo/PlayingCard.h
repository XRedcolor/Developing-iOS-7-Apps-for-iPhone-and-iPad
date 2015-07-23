//
//  PlayingCard.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/23.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
