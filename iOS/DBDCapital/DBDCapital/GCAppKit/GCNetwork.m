//
//  GCNetwork.m
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import "GCNetwork.h"
#import <AFNetworking/AFNetworking.h>

@implementation GCNetwork


// TODO: To be updated

+ (void)requestGETWithURL:(NSURL *)url parameter:(NSDictionary *)parameter completion:(void (^)(BOOL succeeded, NSDictionary *responseDictionary))completionBlock
{
  DDLogVerbose(@"url is: %@", url.absoluteString);
  DDLogVerbose(@"parameter: %@", parameter);
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
  //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
  [manager GET:url.absoluteString parameters:parameter success:^(AFHTTPRequestOperation *operation, NSDictionary *responseDictionary) {
    DDLogInfo(@"Get data successfully. Printing response JSON: %@", responseDictionary);

    completionBlock(YES, responseDictionary);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    DDLogWarn(@"Error: %@", error);

    // Customize error response
    if ([operation.response statusCode] == 409) {
      DDLogError(@"Email has already been registered");
    } else {
      DDLogError(@"Here's the error");
    }
  }];
}

+ (NSString *)getCurrentDomain
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *current_domain = [defaults objectForKey:@"current_domain"];
  return current_domain;
}

@end
