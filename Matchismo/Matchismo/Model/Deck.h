//
//  Deck.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

/**
 *  添加 card
 *
 *  @param card  card
 *  @param atTop 是否置顶
 */
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
/**
 *  添加 card
 *
 *  @param Card card
 */
- (void)addCard:(Card *)card;
/**
 *  获取随机的 card
 *
 *  @return 随机的 card
 */
- (Card *)drawRandomCard;

@end
