//
//  OSHYandexMapTrafficSource.m
//  CarWash
//
//  Created by Oleg Shulakov on 14.04.14.
//  Copyright (c) 2014 Oleg Shulakov. All rights reserved.
//

#import "OSHYandexMapTrafficSource.h"
#import "RMProjection+OSHCategory.h"

@implementation OSHYandexMapTrafficSource

- (NSURL *)URLForTile:(RMTile)tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
    //    http://jgo.maps.yandex.net/1.1/tiles?l=trf,trfe,trfl&lang=ru_RU&x=5308&y=2521&z=13&tm=1397478390
    
    int scale = 1;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale == 2.0)) {
        // Retina display
        scale = 2;
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"http://jgo.maps.yandex.net/1.1/tiles?l=trf,trfe,trfl&lang=ru_RU&x=%d&y=%d&z=%d&tm=%ld", tile.x, tile.y, tile.zoom, (long)[[NSDate date] timeIntervalSince1970]];
    
    return [NSURL URLWithString:urlStr];
}

- (RMProjection *)projection
{
    return [RMProjection yandexProjection];
}

- (NSString *)uniqueTilecacheKey
{
	return @"YandexTrafficMapCacheKey";
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
