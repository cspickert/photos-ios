//
//  CSPhotosAPIClient.m
//  Photos
//
//  Created by Cameron Spickert on 2/4/13.
//  Copyright (c) 2013 Cameron Spickert. All rights reserved.
//

#import "CSPhotosAPIClient.h"
#import "CSPhotosAPIClientConstants.h"

static NSString *const kCSPhotosAPIBaseURLString = @"http://api.flickr.com";
static NSString *const kCSPhotosAPIRestPathString = @"/services/rest";

@implementation CSPhotosAPIClient

+ (instancetype)sharedClient
{
    static CSPhotosAPIClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CSPhotosAPIClient alloc] init];
    });
    
    return _sharedClient;
}

- (id)init
{
    if ((self = [super initWithBaseURL:[NSURL URLWithString:kCSPhotosAPIBaseURLString]])) {
    }
    return self;
}

- (NSDictionary *)parametersWithMethodName:(NSString *)methodName additionalParameters:(NSDictionary *)parameters
{
    NSDictionary *defaultParameters = @{@"api_key": kCSPhotosAPIKey, @"format" : @"json", @"nojsoncallback" : @"1"};
    
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionary];
    [allParameters setObject:methodName forKey:@"method"];
    [allParameters addEntriesFromDictionary:defaultParameters];
    [allParameters addEntriesFromDictionary:parameters];
    
    return [allParameters copy];
}

- (void)fetchPhotosWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure
{
    NSDictionary *parameters = [self parametersWithMethodName:@"flickr.photos.getRecent" additionalParameters:@{@"sort" : @"date-posted-desc", @"extras" : @"url_z,url_o"}];
    
    [self getPath:kCSPhotosAPIRestPathString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id responseJSON = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        if (success != nil) {
            success(responseJSON);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure != nil) {
            failure(error);
        }
    }];
}

@end
