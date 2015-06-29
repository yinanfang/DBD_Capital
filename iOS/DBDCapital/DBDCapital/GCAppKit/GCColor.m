//
//  GCColor.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCColor.h"

@implementation GCColor

// TODO: To be updated
+ (UIColor *)getColorWithRGBAinHex:(NSUInteger)color
{
  return [UIColor colorWithRed:((color >> 24) & 0xFF) / 255.0f
                         green:((color >> 16) & 0xFF) / 255.0f
                          blue:((color >> 8) & 0xFF) / 255.0f
                         alpha:((color) & 0xFF) / 255.0f];
}

@end
