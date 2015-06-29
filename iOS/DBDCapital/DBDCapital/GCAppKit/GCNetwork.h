//
//  GCNetwork.h
//  DBDCapital
//
//  Created by Lucas Fang on 6/28/15.
//  Copyright (c) 2015 DBD Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCNetwork : NSObject


// TODO: To be updated

+ (void)requestGETWithURL:(NSURL *)url parameter:(NSDictionary *)parameter completion:(void (^)(BOOL succeeded, NSDictionary *responseDictionary))completionBlock;
+ (NSString *)getCurrentDomain;


@end
