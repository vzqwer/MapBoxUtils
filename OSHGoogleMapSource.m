//
//  OSHGoogleMapSource.m
//  TMDriver
//
//  Created by Oleg Shulakov on 06.12.13.
//  Copyright (c) 2013 Oleg Shulakov. All rights reserved.
//

#import "OSHGoogleMapSource.h"

@implementation OSHGoogleMapSource

- (NSURL *)URLForTile:(RMTile)tile
{
	NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
			  @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
			  self, tile.zoom, self.minZoom, self.maxZoom);
    
//    "http://mt3.google.com/vt/lyrs=m&hl=ru&x=%s&y=%s&z=%s&s=Galileo"
    
    int scale = 1;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale == 2.0)) {
        // Retina display
        scale = 2;
    }
    
    int rndSrv = arc4random_uniform(4);
    NSString *urlStr = [NSString stringWithFormat:@"http://mt%d.google.com/vt/lyrs=m&hl=ru&x=%d&y=%d&z=%d&scale=%d&s=Galileo", rndSrv, tile.x, tile.y, tile.zoom, scale];
    
    return [NSURL URLWithString:urlStr];
}

- (NSString *)uniqueTilecacheKey
{
	return @"GoogleMapCacheKey";
}

- (NSString *)shortName
{
	return @"Google Maps";
}

- (NSString *)longDescription
{
	return @"Google Maps";
}

- (NSString *)shortAttribution
{
	return @"Google Карты ‎ ‎ - ©2013 Google";
}

- (NSString *)longAttribution
{
	return @"Google Карты ‎ ‎ - ©2013 Google";
}

@end
