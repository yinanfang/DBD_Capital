//
//  GCConfiguration.h
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import <Foundation/Foundation.h>


// TODO: To be updated

#pragma mark - Theme Color hex with Pantone color

// Theme Color
#define ThemeColor01                0x1D4E89FF  //PANTONE 19-4052 Classic Blue
#define ThemeColor01_Variation01    0x113C1BFF
#define WhiteFading                 0xFFFFFF45  //

// Font and Size
#define Font_Logo                   @"Chalkduster"
#define Font_Title                  @"AppleGothic"
#define Font_Paragraph              @"AppleGothic"
#define FontSize_LogInTextField     22.0f
#define FontSize_H1                 18.0f
#define FontSize_H2                 16.0f
#define FontSize_P1                 16.0f
#define WidthForEntryfieldBorder    1.0f
#define CornerRadius_General        10.0f

// Animation
#define AnimationDuration_Short     0.25
#define AnimationDelay_Short        0

// General Layout Metrics
// For MASConstraintMaker
#define mas_Padding_Page_Large          UIEdgeInsetsMake(20, 20, -20, -20)
#define mas_Padding_Page_Small          UIEdgeInsetsMake(5, 5, -5, -5)
#define mas_Padding_Page_Default        UIEdgeInsetsMake(8, 8, -8, -8)
// For UIKit
#define Insets_Default              UIEdgeInsetsMake(8, 8, 8, 8)
#define Insets_Button               UIEdgeInsetsMake(8, 10, 8, 10)

// Table View Configuration
#define CellIdentifierForOrderTableViewCell @"OrderTableViewCellIdentifier"

@interface GCConfiguration : NSObject

#pragma mark - Domain
FOUNDATION_EXPORT NSString *const DevelopmentDomain;
FOUNDATION_EXPORT NSString *const ProductionDomain;
FOUNDATION_EXPORT NSString *const URIToServicePHP;
FOUNDATION_EXPORT NSString *const URLToServicePHP;

#pragma mark - NSUserDefaults values
FOUNDATION_EXPORT NSString *const NSUserDefaultsKeyForDidShownTour;
FOUNDATION_EXPORT NSString *const NSUserDefaultsKeyForDidRunAppBefore;
FOUNDATION_EXPORT NSString *const NSUserDefaultsKeyForAppData;

#pragma mark - Default Value
@property NSNumber *defaultStoryCount, *defaultBookCount;

#pragma mark - Book Specific
//@property NSInteger bookCurrentPageNumber;
@property CGRect PageControlRect, BookTitleViewRect;

#pragma mark - Story Specific
@property CGFloat WidthForSmallStory, HeightForSmallStory;
@property CGFloat WidthForCurrentStory, HeightForCurrentStory;
@property CGRect BoundsForStoryCollectionController;

#pragma mark - General
@property CGFloat PixelAdjustForHorizontalGap;
@property CGFloat HeightDeterminant_FloatVSFullScreen;
typedef NS_ENUM(NSInteger, PagePaddingOption) {
  PagePaddingSmall,
  PagePaddingLarge,
};
//@property StoryDisplayStyleMode storyDisplayStyleMode;


@end