//
//  GCFactory.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCFactory.h"

#import <Mantle/Mantle.h>
#import <Masonry/Masonry.h>

#import "GCColor.h"
#import "GCConstant.h"


@implementation GCFactory


// TODO: To be updated
+ (UIImageView *)getFullScreenImageView:(NSString *)name
{
  UIImage *image;
  if (IS_IPHONE4S) {
    image = [UIImage imageNamed:[NSString stringWithFormat:@"%@@2x.png", name]];
  }else if (IS_IPHONE5S){
    image = [UIImage imageNamed:[NSString stringWithFormat:@"%@@R4.png", name]];
  }
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  return imageView;
}

+ (CGPoint)getCGPointZeroWithStatusbarAndNavigationBar:(UIViewController *)controller
{
  CGFloat statusBarHeight = 0.000000;
  CGFloat navBarHeight = 0.000000;
  UIInterfaceOrientation orientation_StatusBar = [[UIApplication sharedApplication] statusBarOrientation];
  switch (orientation_StatusBar) {
    case UIInterfaceOrientationPortrait:
    case UIInterfaceOrientationPortraitUpsideDown:
      NSLog(@"It's UIInterfaceOrientationPortrait");
      statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
      navBarHeight = controller.navigationController.navigationBar.frame.size.height;
      break;
    case UIInterfaceOrientationLandscapeLeft:
    case UIInterfaceOrientationLandscapeRight:
      NSLog(@"It's UIInterfaceOrientationLandscape");
      statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.width;
      navBarHeight = controller.navigationController.navigationBar.frame.size.height;
      break;
    default:
      break;
  }
  return CGPointMake(0, -statusBarHeight-navBarHeight);
}



#pragma mark - Mantle
+ (id)getMantleModelWithDictionary:(NSDictionary *)dictionary modelClass:(Class)modelClass
{
  NSError *mantleError = nil;
  id model = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:dictionary error:&mantleError];
//  DDLogVerbose([model description]);
  if (mantleError) {
    DDLogWarn(@"Cannot generate GCUser model!!!");
  }
  return model;
}


#pragma mark - Style, font, size
+ (void)configureNavigationViewController:(UIViewController *)viewcontroller withNavigationTitle:(NSString *)title
{
  // Set Title
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
  label.textAlignment = NSTextAlignmentCenter;
  [label setFont:[UIFont boldSystemFontOfSize:16.0]];
  [label setBackgroundColor:[UIColor clearColor]];
  [label setTextColor:[UIColor whiteColor]];
  [label setText:title];
  viewcontroller.navigationItem.titleView = label;
  [label sizeToFit];
}

+ (void)configureBackButtonOfNavigationViewController:(UIViewController *)viewcontroller
{
  // Back Button
  UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 20.0f, 30.0f)];
  backButton.backgroundColor = [UIColor clearColor];
  [backButton setTitle:@"<" forState:UIControlStateNormal];
  [backButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
  UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
  viewcontroller.navigationItem.leftBarButtonItem = backButtonItem;
  viewcontroller.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
  [[backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
    [viewcontroller.navigationController popViewControllerAnimated:YES];
  }];
}

+ (void)configureRightButtonOfNavigationViewController:(UIViewController *)viewcontroller
{
  // Back Button
  UIButton *rightButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 20.0f, 30.0f)];
  rightButton.backgroundColor = [UIColor clearColor];
  [rightButton setImage:[UIImage imageNamed:@"icon_menu"] forState:UIControlStateNormal];
  UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
  viewcontroller.navigationItem.rightBarButtonItem = rightButtonItem;
  viewcontroller.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
  [[rightButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
    [viewcontroller.navigationController popViewControllerAnimated:YES];
  }];
}

+ (void)setConstraints_FillFullScreenWithView:(UIView *)view superview:(UIView *)superview
{
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(superview.mas_top);
    make.left.equalTo(superview.mas_left);
    make.bottom.equalTo(superview.mas_bottom);
    make.right.equalTo(superview.mas_right);
  }];
}
+ (void)setConstraints_PinHorizontallyWithPagePaddingAndTopWithPadding:(PagePaddingOption)paddingOption withView:(UIView *)view superview:(UIView *)superview upperview:(UIView *)upperview;
{
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    if (paddingOption==PagePaddingLarge) {
      make.top.equalTo(upperview.mas_bottom).with.offset(mas_Padding_Page_Large.top);
    }else{
      make.top.equalTo(upperview.mas_bottom).with.offset(mas_Padding_Page_Small.top);
    }
    make.left.equalTo(superview.mas_left).with.offset(mas_Padding_Page_Large.left);
    make.right.equalTo(superview.mas_right).with.offset(mas_Padding_Page_Large.right);
  }];

}

@end

#pragma mark - Add category to help UINavigationController to determine rotation
@implementation UINavigationController (OrientationSettings_IOS6)
-(BOOL)shouldAutorotate {
  return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations {
  return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
  return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}
@end

#pragma mark - UIkit and Foundation extention
@implementation UILabel (AdvancedInitialization)
+ (UILabel *)LabelTitleWithString:(NSString *)title align:(NSTextAlignment)alignment
{
  UILabel *label = [[UILabel alloc] init];
  label.textAlignment = alignment;
  [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:FontSize_H1]];
  [label setBackgroundColor:[UIColor clearColor]];
  [label setTextColor:[GCColor getColorWithRGBAinHex:ThemeColor01]];
  [label setText:title];
  return label;
}

+ (UILabel *)LabelSubTitleWithString:(NSString *)title align:(NSTextAlignment)alignment
{
  UILabel *label = [[UILabel alloc] init];
  label.textAlignment = alignment;
  [label setFont:[UIFont fontWithName:@"Helvetica" size:FontSize_P1]];
  [label setBackgroundColor:[UIColor clearColor]];
  [label setTextColor:[GCColor getColorWithRGBAinHex:ThemeColor01]];
  [label setText:title];
  return label;
}
@end


@implementation UIButton (AdvancedInitialization)
+ (UIButton *)ButtonWithTitle:(NSString *)title inBold:(BOOL)IsBold horizontalAlign:(UIControlContentHorizontalAlignment)horizontalAlign
{
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.contentEdgeInsets = Insets_Button;
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button setTitle:title forState:UIControlStateNormal];
  if (IsBold) {
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:FontSize_P1];
  }else{
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:FontSize_P1];
  }
  button.contentHorizontalAlignment = horizontalAlign;
  button.layer.borderWidth = WidthForEntryfieldBorder;
  button.layer.borderColor = [UIColor lightGrayColor].CGColor;
  button.layer.cornerRadius = CornerRadius_General;
  button.clipsToBounds = YES;
  return button;
}
@end

@implementation FUIButton (AdvancedInitialization)
+ (FUIButton *)ButtonWithTitle:(NSString *)title inBold:(BOOL)IsBold
{
  FUIButton *button = [[FUIButton alloc] init];
  button.buttonColor = [GCColor getColorWithRGBAinHex:ThemeColor01];
  button.shadowColor = [GCColor getColorWithRGBAinHex:ThemeColor01_Variation01];
  button.shadowHeight = 1.0f;
  button.cornerRadius = 6.0f;
  if (IsBold) {
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:FontSize_P1];
  }else{
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:FontSize_P1];
  }
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
  [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
  return button;
}
@end

@implementation UITextField (AdvancedInitialization)
+ (UITextField *)TextFieldWithPlaceHolder:(NSString *)placeHolder keyboardType:(UIKeyboardType)keyboardType
{
  UITextField *textField = [[UITextField alloc] init];
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.font = [UIFont systemFontOfSize:FontSize_P1];
  textField.placeholder = placeHolder;
  textField.autocorrectionType = UITextAutocorrectionTypeYes;
  textField.keyboardType = keyboardType;
  textField.returnKeyType = UIReturnKeyDone;
  textField.clearButtonMode = UITextFieldViewModeWhileEditing;
  textField.contentVerticalAlignment = UIControlContentHorizontalAlignmentLeft;
  textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  return textField;
}
@end

@implementation UIImageView (AdvancedInitialization)
+ (UIImageView *)ImageViewWithDefaultBackgroundImage:(UIImage *)image
{
  UIImageView *imageView = [[UIImageView alloc] init];
  imageView.backgroundColor = [UIColor lightGrayColor];
  if (image) {
    [imageView setImage:image];
  }
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  imageView.layer.cornerRadius = CornerRadius_General;
  imageView.clipsToBounds = YES;
  return imageView;
}
@end
