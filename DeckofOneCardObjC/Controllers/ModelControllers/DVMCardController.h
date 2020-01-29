//
//  DVMCardController.h
//  DeckofOneCardObjC
//
//  Created by Nicholas Boleky on 1/28/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class DVMCard;

@interface DVMCardController : NSObject

+ (DVMCardController *)sharedInstance;

+ (void)drawANewCard:(NSNumber *)numberOfCards
          completion:(void(^) (NSArray<DVMCard *> *_Nullable cards))completion;

+ (void)fetchCardImage:(DVMCard *)card completion:(void(^) (UIImage *_Nullable image))completion;


@end

NS_ASSUME_NONNULL_END
