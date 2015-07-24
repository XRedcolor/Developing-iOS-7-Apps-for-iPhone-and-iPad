//
//  Card.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

/**
 *  card 内容
 */
@property (nonatomic, strong) NSString *contents;
/**
 *  card 是否选择
 */
@property (nonatomic, getter=isChosen) BOOL chosen;
/**
 *  card 是否匹配
 */
@property (nonatomic, getter=isMatched) BOOL matched;

/**
 *  cards 进行匹配
 *
 *  @param otherCards 其他 cards
 *
 *  @return 匹配得分
 */
- (NSInteger)match:(NSArray *)otherCards;

@end
