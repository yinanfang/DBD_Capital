//
//  GCFactory.h
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <FlatUIKit/FlatUIKit.h>

#import "GCConfiguration.h"

@interface GCFactory : NSObject


// TODO: To be updated
+ (UIImageView *)getFullScreenImageView:(NSString *)name;
+ (CGPoint)getCGPointZeroWithStatusbarAndNavigationBar:(UIViewController *)controller;

#pragma mark - Mantle
+ (id)getMantleModelWithDictionary:(NSDictionary *)dictionary modelClass:(Class)modelClass;



#pragma mark - Style, font, size
+ (void)configureNavigationViewController:(UIViewController *)viewcontroller withNavigationTitle:(NSString *)title;
+ (void)configureBackButtonOfNavigationViewController:(UIViewController *)viewcontroller;
+ (void)configureRightButtonOfNavigationViewController:(UIViewController *)viewcontroller;

+ (void)setConstraints_FillFullScreenWithView:(UIView *)view superview:(UIView *)superview;
+ (void)setConstraints_PinHorizontallyWithPagePaddingAndTopWithPadding:(PagePaddingOption)paddingOption withView:(UIView *)view superview:(UIView *)superview upperview:(UIView *)upperview;


@end

#pragma mark - UIkit and Foundation extention
@interface UILabel (AdvancedInitialization)
+ (UILabel *)LabelTitleWithString:(NSString *)title align:(NSTextAlignment)alignment;
+ (UILabel *)LabelSubTitleWithString:(NSString *)title align:(NSTextAlignment)alignment;
@end

@interface UIButton (AdvancedInitialization)
+ (UIButton *)ButtonWithTitle:(NSString *)title inBold:(BOOL)IsBold horizontalAlign:(UIControlContentHorizontalAlignment)horizontalAlign;
@end

@interface FUIButton (AdvancedInitialization)
+ (FUIButton *)ButtonWithTitle:(NSString *)title inBold:(BOOL)IsBold;
@end

@interface UITextField (AdvancedInitialization)
+ (UITextField *)TextFieldWithPlaceHolder:(NSString *)placeHolder keyboardType:(UIKeyboardType)keyboardType;
@end
@interface UIImageView (AdvancedInitialization)
+ (UIImageView *)ImageViewWithDefaultBackgroundImage:(UIImage *)image;
@end