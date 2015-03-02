//
//  Weather.m
//  Weather Playground
//
//  Created by David Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

static NSString * const locationNameKey = @"name";
static NSString * const weatherKey = @"weather";
static NSString * const mainKey = @"main";
static NSString * const descriptionKey = @"description";
static NSString * const iconKey = @"icon";
static NSString * const weatherTempKey = @"temp";

@implementation Weather

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.locationName = dictionary[locationNameKey];
        self.weatherMain = dictionary[weatherKey][0][mainKey];
        self.weatherDescription = dictionary[weatherKey][0][descriptionKey];
        self.weatherIcon = dictionary[weatherKey][0][iconKey];
        self.weatherTemp = dictionary[mainKey][weatherTempKey];
    }
    return self;
}

@end
