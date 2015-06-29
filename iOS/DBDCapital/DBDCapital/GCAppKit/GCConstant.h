//
//  GCConstants.h
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

// TODO: To be updated
#pragma mark - Device Type
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE5S ([[UIScreen mainScreen] bounds].size.height == 568)
#define IS_IPHONE4S ([[UIScreen mainScreen] bounds].size.height == 480)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IOS8 (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)

typedef NS_ENUM(NSInteger, testEnum) {
  testEnum1,
  testEnum2,
  testEnum3,
  testEnum4
};

@interface GCConstant : NSObject

#pragma mark - Screen width and height
// iPhone4S@2x: W*H = 320*480
// iPhone5S@R4: W*H = 320*568
#define ScreenBounds    [GCConstant getScreenBoundsDependOnOrientation]
#define ScreenSize      [GCConstant getScreenBoundsDependOnOrientation].size
#define ScreenWidth     [GCConstant getScreenBoundsDependOnOrientation].size.width
#define ScreenHeight    [GCConstant getScreenBoundsDependOnOrientation].size.height
// Keyboard
#define kOFFSET_FOR_KEYBOARD 80.0

#pragma mark - Image Types
@property NSString *PNGTypeAndSuffix;

#pragma mark - Gesture Recognizer
FOUNDATION_EXPORT CGFloat const SWIPE_VELOCITY_THRESHOLD;

// This is the method to access this Singleton class
+ (GCConstant *)sharedInstance;
+ (CGRect)getScreenBoundsDependOnOrientation;


@end
