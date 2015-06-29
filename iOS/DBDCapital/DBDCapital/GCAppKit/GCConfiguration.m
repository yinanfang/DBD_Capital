//
//  GCConfiguration.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCConfiguration.h"

#import "GCConstant.h"

@implementation GCConfiguration


// TODO: To be updated

#pragma mark - Domain
// Change the domain for server here
NSString *const DevelopmentDomain = @"https://story2movie.com";
NSString *const ProductionDomain = @"https://story2movie.com";
NSString *const URIToServicePHP = @"/API201425PKS238K89DJK/service.php";
NSString *const URLToServicePHP = @"https://story2movie.com/API201425PKS238K89DJK/service.php";

#pragma mark - NSUserDefaults values
NSString *const NSUserDefaultsKeyForDidShownTour = @"didShownTour";
NSString *const NSUserDefaultsKeyForDidRunAppBefore = @"didRunAppBefore";
NSString *const NSUserDefaultsKeyForAppData = @"AppData";

+ (GCConfiguration *)sharedInstance
{
  static GCConfiguration *shareInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shareInstance = [[self alloc] init];
  });
  return shareInstance;
}

- (id)init
{
  DDLogVerbose(@"Initializing App Configuration...");
  self = [super init];
  if (self) {
    // Initialize values
    self.defaultBookCount = [NSNumber numberWithInteger:3];
    self.defaultStoryCount = [NSNumber numberWithInteger:5];

    // Book Specific
    //        self.bookCurrentPageNumber = 0;
    if (IS_IPHONE5S) {
      self.PageControlRect = CGRectMake(60, 290, 200, 20);                     // 568-258+20 = 290
    }else if (IS_IPHONE4S){
      self.PageControlRect = CGRectMake(60, 242, 200, 20);                     // 480-218+20 = 242
    }
    self.BookTitleViewRect = CGRectMake(15, 13, 150, 22);

    // Story Specific
    if (IS_IPHONE5S) {
      self.HeightForSmallStory = 258;
    }else if (IS_IPHONE4S){
      self.HeightForSmallStory = 218;                                          // 480*(258/568) = 218.028169
    }
    self.WidthForSmallStory = 320*(self.HeightForSmallStory/ScreenHeight);            // 145.352113

    self.HeightForCurrentStory = self.HeightForSmallStory;
    self.WidthForCurrentStory = self.WidthForSmallStory;

    self.BoundsForStoryCollectionController = CGRectMake(0, ScreenHeight-self.HeightForSmallStory, ScreenWidth, self.HeightForSmallStory);

    // General
    self.PixelAdjustForHorizontalGap = 1.0;
    self.HeightDeterminant_FloatVSFullScreen = ScreenHeight-(ScreenHeight-self.HeightForSmallStory)/2;
    //        storyDisplayStyleMode = StoryDisplayStyleModeFloat;
  }
  return self;
}


@end

