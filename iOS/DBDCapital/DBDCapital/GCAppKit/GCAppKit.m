//
//  GCAppKit.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCAppKit.h"

@implementation GCAppKit

- (instancetype)init {
  if (self = [super init]) {
    //
  }
  return self;
}

- (void)setupApplicationWithProductionMode:(BOOL)mode
{
  // Logging
  [self setupLogging];
//  DDLogInfo(@"====================  Application Setup Started  ====================");

  // Cache
  [self setCachePolicy];

  // Domain
//  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//  if (mode) {
//    DDLogInfo(@"In PRODUCTION mode with domain: %@", ProductionDomain);
//    [defaults setObject:ProductionDomain forKey:@"current_domain"];
//  }else {
//    DDLogInfo(@"In Development mode with domain: %@", DevelopmentDomain);
//    [defaults setObject:DevelopmentDomain forKey:@"current_domain"];
//  }
}

- (void)setCachePolicy
{
  // Disable Cache for the networking methods
  [[NSURLCache sharedURLCache] removeAllCachedResponses];
  [[NSURLCache sharedURLCache] setDiskCapacity:0];
  [[NSURLCache sharedURLCache] setMemoryCapacity:0];
}

- (void)setupLogging
{
  [DDLog addLogger:[DDASLLogger sharedInstance]];
  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
  [fileLogger setRollingFrequency:60 * 60 * 24];   // roll every day
  [fileLogger setMaximumFileSize:1024 * 1024 * 2]; // max 2mb file size
  [fileLogger.logFileManager setMaximumNumberOfLogFiles:7];
//  [fileLogger setLogFormatter:[[CustomLogFormatters alloc] init]];
  [DDLog addLogger:fileLogger];


  // And then enable colors
  // Add Environment Variable in "Edit scheme": XcodeColors YES
  // Follow the Issue Report: https://github.com/CocoaLumberjack/CocoaLumberjack/issues/50#issuecomment-34286656
  // Enables XcodeColors
  [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
  // Set logger color
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:nil forFlag:DDLogFlagError];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor purpleColor] backgroundColor:nil forFlag:DDLogFlagWarning];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor brownColor] backgroundColor:nil forFlag:DDLogFlagInfo];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blackColor] backgroundColor:nil forFlag:DDLogFlagDebug];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
  // Test logger color
  DDLogError(@"DDLogError");
  DDLogWarn(@"DDLogWarn");
  DDLogInfo(@"DDLogInfo");
  DDLogDebug(@"DDLogDebug");
  DDLogVerbose(@"DDLogVerbose");
  DDLogTest(@"LogTest for XcodeColors");




  DDLogInfo(@"Logging is setup (\"%@\")", [fileLogger.logFileManager logsDirectory]);
}



@end
