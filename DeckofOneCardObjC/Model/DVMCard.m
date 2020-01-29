//
//  DVMCard.m
//  DeckofOneCardObjC
//
//  Created by Nicholas Boleky on 1/28/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = [suit copy];
        _image = [image copy];
        
    }
    return self;
}

@end

@implementation DVMCard (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *image = dictionary[@"image"];
    NSString *suit = dictionary [@"suit"];
    
    return [self initWithSuit:suit image:image];
}


@end
