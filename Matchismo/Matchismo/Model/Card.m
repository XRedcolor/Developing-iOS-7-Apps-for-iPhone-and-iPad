//
//  Card.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "Card.h"

@implementation Card

/**
 *  cards 进行匹配
 *
 *  @param otherCards 其他 cards
 *
 *  @return 匹配得分
 */
- (NSInteger)match:(NSArray *)otherCards
{
    NSInteger score = 0;
    
    for (Card *card in otherCards) {
        if ([self.contents isEqualToString:card.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
