//
//  WeatherController.h
//  Weather Playground
//
//  Created by David Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Weather;

@interface WeatherController : NSObject

+ (WeatherController*)sharedInstance;

- (void)retrieveWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion;

@end
