//
//  CSPhotosAPIClient.h
//  Photos
//
//  Created by Cameron Spickert on 2/4/13.
//  Copyright (c) 2013 Cameron Spickert. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CSPhotosAPIClient : AFHTTPClient

+ (instancetype)sharedClient;

- (void)fetchPhotosWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure;

@end
