//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by XRedcolor on 15/7/24.
//  Copyright (c) 2015年 XRedcolor. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck;
@class Card;

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
