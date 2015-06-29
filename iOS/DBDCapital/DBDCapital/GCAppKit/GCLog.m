//
//  GCLog.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCLog.h"

@interface CustomLogFormatters : NSObject <DDLogFormatter>

@end

@implementation CustomLogFormatters

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
  //Alter the message to your liking
//  NSString *msg = [logMessage->_message stringByReplacingOccurrencesOfString:@"\n" withString:@"<br>"];

  NSString *logLevel;
  switch (logMessage->_flag)
  {
    case DDLogFlagError     : logLevel = @"E"; break;
    case DDLogFlagWarning   : logLevel = @"W"; break;
    case DDLogFlagInfo      : logLevel = @"I"; break;
    case DDLogFlagDebug     : logLevel = @"D"; break;
    default                 : logLevel = @"V"; break;
  }

  //Also display the file the logging occurred in to ease later debugging
//  NSString *file = [[logMessage->_file lastPathComponent] stringByDeletingPathExtension];

  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
  NSString *timeStamp = [dateFormatter stringFromDate:logMessage->_timestamp];


  //Format the message for the server-side log file parser
//  return [NSString stringWithFormat:@"%@ %@ %@ %@ || [%@%@@%lu]", logMessage->_timestamp, logMessage->_threadID, logLevel, msg, file, logMessage->_function, (unsigned long)logMessage->_line];
  return [NSString stringWithFormat:@"%@ [%@] %@@%lu %@", timeStamp, logLevel, logMessage->_function, (unsigned long)logMessage->_line, logMessage->_message];

}

@end

@implementation GCLog

- (void)setupLogging
{
  CustomLogFormatters *formatter = [[CustomLogFormatters alloc] init];

  [[DDASLLogger sharedInstance] setLogFormatter:formatter];
  [DDLog addLogger:[DDASLLogger sharedInstance]];

  [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
  [DDLog addLogger:[DDTTYLogger sharedInstance]];

  DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
  [fileLogger setRollingFrequency:60 * 60 * 24];   // roll every day
  [fileLogger setMaximumFileSize:1024 * 1024 * 2]; // max 2mb file size
  [fileLogger.logFileManager setMaximumNumberOfLogFiles:7];
  [fileLogger setLogFormatter:formatter];
  [DDLog addLogger:fileLogger];

  // Enable colors
  // Add Environment Variable in "Edit scheme": XcodeColors YES
  // Follow the Issue Report: https://github.com/CocoaLumberjack/CocoaLumberjack/issues/50#issuecomment-34286656
  // Enables XcodeColors
  [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
  // Set logger color
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:nil forFlag:DDLogFlagError];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor purpleColor] backgroundColor:nil forFlag:DDLogFlagWarning];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor orangeColor] backgroundColor:nil forFlag:DDLogFlagInfo];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor brownColor] backgroundColor:nil forFlag:DDLogFlagDebug];
  [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
  // Test logger color
//  DDLogTest(@"LogTest for XcodeColors");
  DDLogError(@"Testing DDLogError");
  DDLogWarn(@"Testing DDLogWarn");
  DDLogInfo(@"Testing DDLogInfo");
  DDLogDebug(@"Testing DDLogDebug");
  DDLogVerbose(@"Testing DDLogVerbose");

  DDLogInfo(@"Logging is setup (\"%@\")", [fileLogger.logFileManager logsDirectory]);
}


@end


