//
//  AppDelegate.h
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCAppKit;

@interface GCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readwrite) GCAppKit *appkit;

@end

