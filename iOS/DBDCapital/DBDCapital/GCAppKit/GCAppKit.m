//
//  GCAppKit.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCAppKit.h"

#import "GCLog.h"

@interface GCAppKit()

@property (nonatomic, strong) GCLog *log;

@end

@implementation GCAppKit

- (instancetype)init {
  if (self = [super init]) {
    _log = [[GCLog alloc] init];
  }
  return self;
}

- (void)setupApplicationWithProductionMode:(BOOL)mode
{
  // Logging
  [self.log setupLogging];
  
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

  DDLogInfo(@"====================  Application Setup Started  ====================");
}

- (void)setCachePolicy
{
  // Disable Cache for the networking methods
  [[NSURLCache sharedURLCache] removeAllCachedResponses];
  [[NSURLCache sharedURLCache] setDiskCapacity:0];
  [[NSURLCache sharedURLCache] setMemoryCapacity:0];
}




@end
