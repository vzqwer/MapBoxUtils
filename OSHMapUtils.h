//
//  OSHMapUtils.h
//  CarWash
//
//  Created by Oleg Shulakov on 26.03.14.
//  Copyright (c) 2014 Oleg Shulakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapbox.h>

extern NSString *const SETTINGS_LAST_MAP_ZOOM;
extern NSString *const SETTINGS_LAST_MAP_CENTER_LAT;
extern NSString *const SETTINGS_LAST_MAP_CENTER_LON;

enum OSHNavigationMapSourceType {
    OSHNavigationMapSourceTypeYandex = 0,
    OSHNavigationMapSourceTypeOSM,
    OSHNavigationMapSourceTypeGoogle,
    OSHNavigationMapSourceTypeYandexTraffic
};
typedef enum OSHNavigationMapSourceType OSHNavigationMapSourceType;

@interface OSHMapUtils : NSObject

+ (float)mapZoom;
+ (CLLocationCoordinate2D)mapCenter;
+ (NSString*)textForNavigationMapSourceType:(OSHNavigationMapSourceType)sourceType;
+ (id<RMTileSource>)tileSourceForType:(OSHNavigationMapSourceType)sourceType;

@end
