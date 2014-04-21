//
//  OSHYandexMapSource.m
//  MapBox Example
//
//  Created by Oleg Shulakov on 27.11.13.
//  Copyright (c) 2013 MapBox / Development Seed. All rights reserved.
//

#import "OSHYandexMapSource.h"
#import "RMProjection+OSHCategory.h"

@implementation OSHYandexMapSource

- (NSURL *)URLForTile:(RMTile)tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
//    http://vec04.maps.yandex.net/tiles?l=map&v=4.13.1&x=5305&y=2523&z=13&lang=ru_RU
    
    int scale = 1;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale == 2.0)) {
        // Retina display
        scale = 2;
    }
    
    int rndSrv = arc4random_uniform(4) + 1;
    NSString *urlStr = [NSString stringWithFormat:@"http://vec0%d.maps.yandex.net/tiles?l=map&v=4.14.5&x=%d&y=%d&z=%d&scale=%d&lang=ru_RU", rndSrv, tile.x, tile.y, tile.zoom, scale];
    
    return [NSURL URLWithString:urlStr];
}

- (RMProjection *)projection
{
    return [RMProjection yandexProjection];
}

- (NSString *)uniqueTilecacheKey
{
	return @"YandexMapCacheKey";
}

- (NSString *)shortName
{
	return @"Yandex Map";
}

- (NSString *)longDescription
{
	return @"Yandex Map";
}

- (NSString *)shortAttribution
{
	return @"© 2011–2013   «Yandex»";
}

- (NSString *)longAttribution
{
	return @"© 2011–2013   «Yandex LLC»";
}

@end
