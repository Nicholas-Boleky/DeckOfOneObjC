//
//  DVMCardController.m
//  DeckofOneCardObjC
//
//  Created by Nicholas Boleky on 1/28/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawCardComponent = @"draw/";
static NSString * const countofCardQuery = @"count";
static NSString * const theCardsArray = @"cards";

@implementation DVMCardController

+ (void)drawANewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<DVMCard *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:drawCardComponent];
    NSURL *cardCount = [numberOfCards stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countofCardQuery value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL *searchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"Error: no data");
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Unable to create a dictionary from the data");
            completion(nil);
            return;
        }
        NSArray *cardsArray = jsonDictionary[theCardsArray];
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        for (NSDictionary *cardDictionary in cardsArray)
        {
            DVMCard *card = [[DVMCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceholder addObject: card];
        }
        completion(cardsPlaceholder);
    }]resume];
}
+ (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"Error: no data");
            completion(nil);
            return;
        }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }]resume];
}

@end
