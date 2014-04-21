//
//  RMProjection+OSHCategory.m
//  TMDriver
//
//  Created by Oleg Shulakov on 02.12.13.
//  Copyright (c) 2013 Oleg Shulakov. All rights reserved.
//

#import "RMProjection+OSHCategory.h"

@implementation RMProjection (OSHCategory)

static RMProjection *_yandexProjection = nil;

+ (RMProjection *)yandexProjection
{
    if (_yandexProjection)
    {
        return _yandexProjection;
    }
    else
    {
        RMProjectedRect theBounds = RMProjectedRectMake(-20037508.34, -20037508.34, 20037508.34 * 2, 20037508.34 * 2);
        _yandexProjection = [[RMProjection alloc] initWithString:@"+title= Yandex Mercator EPSG:3395 +proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs" inBounds:theBounds];
        return _yandexProjection;
    }
}

@end
