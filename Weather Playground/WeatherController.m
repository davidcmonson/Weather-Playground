//
//  WeatherController.m
//  Weather Playground
//
//  Created by David Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WeatherController.h"

@implementation WeatherController

+ (WeatherController*)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeatherController new];
    });
    return sharedInstance;
}

//- (void)retrieveWeatherWithName: (NSString *)name completion:(void (^))

@end
