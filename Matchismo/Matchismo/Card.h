//
//  Card.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/23.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
