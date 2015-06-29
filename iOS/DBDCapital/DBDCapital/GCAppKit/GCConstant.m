//
//  GCConstants.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCConstant.h"


// TODO: To be updated
@implementation GCConstant

#pragma mark - Gesture Recognizer
CGFloat const SWIPE_VELOCITY_THRESHOLD = 0.278f; // TODO: it's weird. Simulator require >.5 to be a swipe

+ (GCConstant *)sharedInstance
{
  static GCConstant *shareInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shareInstance = [[self alloc] init];
  });
  return shareInstance;
}

- (id)init
{
  DDLogVerbose(@"Initializing Constant...");
  self = [super init];
  if (self) {
    // Set Constants
    // PNGTypeAndSuffix
    if (IS_IPHONE4S) {
      self.PNGTypeAndSuffix = @"@2x.png";
    } else if (IS_IPHONE5S) {
      self.PNGTypeAndSuffix = @"@R4.png";
    }

  }
  return self;
}

+ (CGRect)getScreenBoundsDependOnOrientation
{
  CGRect screenBounds = [UIScreen mainScreen].bounds ;
  if(IS_IOS8){
    return screenBounds ;
  }
  CGFloat width = CGRectGetWidth(screenBounds)  ;
  CGFloat height = CGRectGetHeight(screenBounds) ;
  UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;

  if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
    screenBounds.size = CGSizeMake(width, height);
  }else if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
    screenBounds.size = CGSizeMake(height, width);
  }
  return screenBounds ;
}

@end