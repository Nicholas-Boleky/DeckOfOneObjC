//
//  DVMCard.h
//  DeckofOneCardObjC
//
//  Created by Nicholas Boleky on 1/28/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *image;
@property (nonatomic, copy, readonly) NSString *suit;

- (instancetype)initWithSuit:(NSString *)suit
                        image:(NSString *)image;

NS_DESIGNATED_INITIALIZER;
@end

@interface DVMCard (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
@end

NS_ASSUME_NONNULL_END
