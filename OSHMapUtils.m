//
//  OSHMapUtils.m
//  CarWash
//
//  Created by Oleg Shulakov on 26.03.14.
//  Copyright (c) 2014 Oleg Shulakov. All rights reserved.
//

#import "OSHMapUtils.h"
#import "OSHYandexMapSource.h"
#import "OSHGoogleMapSource.h"
#import "OSHYandexMapTrafficSource.h"

NSString *const SETTINGS_LAST_MAP_ZOOM =      @"ru.taximaster.zoomNewOrder";
NSString *const SETTINGS_LAST_MAP_CENTER_LAT =    @"ru.taximaster.mapLat";
NSString *const SETTINGS_LAST_MAP_CENTER_LON =    @"ru.taximaster.mapLon";

@implementation OSHMapUtils

+ (CLLocationCoordinate2D)mapCenter
{
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(0.0, 0.0);
    if ([[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_LAST_MAP_CENTER_LAT] && [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_LAST_MAP_CENTER_LON])
    {
        coord.latitude = [[[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_LAST_MAP_CENTER_LAT] doubleValue];
        coord.longitude = [[[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_LAST_MAP_CENTER_LON] doubleValue];
    }
    else
    {
        coord.latitude = OSHSettingsProviderInstance.defaultMapCenterLat;
        coord.longitude = OSHSettingsProviderInstance.defaultMapCenterLon;
    }
    
    return coord;
}

+ (float)mapZoom
{
    float zoom = 13;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_LAST_MAP_ZOOM])
    {
        zoom = [[[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_LAST_MAP_ZOOM] floatValue];
    }
    else
    {
        zoom = OSHSettingsProviderInstance.defaultMapZoom;
    }
    
    return zoom;
}

+ (NSString*)textForNavigationMapSourceType:(OSHNavigationMapSourceType)sourceType
{
    switch (sourceType) {
        case OSHNavigationMapSourceTypeYandex:
            return NSLocalizedString(@"Яндекс", nil);
            break;
            
        case OSHNavigationMapSourceTypeOSM:
            return NSLocalizedString(@"OpenStreetMap", nil);
            break;
            
        case OSHNavigationMapSourceTypeGoogle:
            return NSLocalizedString(@"Google", nil);
            break;
            
        default:
            return @"";
            break;
    }
}

+ (id<RMTileSource>)tileSourceForType:(OSHNavigationMapSourceType)sourceType
{
    switch (sourceType) {
        case OSHNavigationMapSourceTypeYandex:
            return [[OSHYandexMapSource alloc] init];
            break;
            
        case OSHNavigationMapSourceTypeOSM:
            return [[RMOpenStreetMapSource alloc] init];
            break;
            
        case OSHNavigationMapSourceTypeGoogle:
            return [[OSHGoogleMapSource alloc] init];
            break;
            
        case OSHNavigationMapSourceTypeYandexTraffic:
            return [[OSHYandexMapTrafficSource alloc] init];
            break;
            
        default:
            return nil;
            break;
    }
}

@end
