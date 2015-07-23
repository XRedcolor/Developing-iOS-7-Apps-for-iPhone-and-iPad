//
//  Card.m
//  Matchismo
//
//  Created by XRedcolor on 15/7/23.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *theCard in otherCards) {
        if ([theCard.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
