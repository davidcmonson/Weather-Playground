//
//  WeatherController.m
//  Weather Playground
//
//  Created by David Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WeatherController.h"
#import "Weather.h"
#import "NetworkController.h"
#import <AFNetworking/AFNetworking.h>

@implementation WeatherController

+ (WeatherController*)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeatherController new];
    });
    return sharedInstance;
}

- (void)retrieveWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion {
    NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseDictionary = responseObject;
//        NSMutableArray *weatherOfPlaces = [NSMutableArray new];
//        for (NSDictionary *dictionary in responseWeather) {
//            Weather *weather = [[Weather alloc] initWithDictionary:dictionary];
//            [weatherOfPlaces addObject:weather];
//        }
        Weather *weather = [[Weather alloc] initWithDictionary:responseDictionary];
        completion(weather);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil);
    }];
}

@end