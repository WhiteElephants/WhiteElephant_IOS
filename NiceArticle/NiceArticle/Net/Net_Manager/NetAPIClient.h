//
//  NetAPIClient.h
//
//  Created by Jason on 11/20/15.
//  Copyright © 2015 Jason. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

typedef NS_ENUM(NSInteger, IllegalContentType) {
    IllegalContentTypeTweet = 0,
    IllegalContentTypeTopic,
    IllegalContentTypeProject,
    IllegalContentTypeWebsite
};


@interface NetAPIClient : AFHTTPSessionManager
+ (id)sharedJsonClient;
+ (id)changeJsonClient;


- (void)requestJsonDataWithPath:(NSString *)aPath withParams:(NSDictionary*)params withMethodType:(NetworkMethod)method andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                           file:(NSDictionary *)file
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;


- (void)reportIllegalContentWithType:(IllegalContentType)type
                          withParams:(NSDictionary*)params;

- (void)uploadVoice:(NSString *)file
           withPath:(NSString *)path
         withParams:(NSDictionary*)params
           andBlock:(void (^)(id data, NSError *error))block;
@end
