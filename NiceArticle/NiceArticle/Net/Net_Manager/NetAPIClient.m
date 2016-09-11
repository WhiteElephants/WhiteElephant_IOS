//
//  NetAPIClient.m
//
//  Created by Jason on 11/20/15.
//  Copyright © 2015 Jason. All rights reserved.
//

#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]

#import "NetAPIClient.h"
#import "NSObject+Common.h"


@implementation NetAPIClient

dispatch_once_t onceToken;
static NetAPIClient *_sharedClient = nil;

+ (NetAPIClient *)sharedJsonClient {
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:[NSObject baseURLStr]]];
    });
    return _sharedClient;
}

+ (id)changeJsonClient{
    _sharedClient = [[NetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:[NSObject baseURLStr]]];
    return _sharedClient;
}

- (void)requestJsonDataWithPath:(NSString *)aPath withParams:(NSDictionary*)params withMethodType:(NetworkMethod)method andBlock:(void (^)(id data, NSError *error))block{
    [self requestJsonDataWithPath:aPath withParams:params withMethodType:method autoShowError:YES andBlock:block];
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block{
    if (!aPath || aPath.length <= 0) {
        return;
    }
    //log请求数据

    aPath = [aPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    发起请求
    switch (method) {
        case Get:{
            //所有 Get 请求，增加缓存机制
            NSMutableString *localPath = [aPath mutableCopy];
            if (params) {
                [localPath appendString:params.description];
            }
//            [self GET:aPath parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {
//
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    responseObject = [NSObject loadResponseWithPath:localPath];
//                    block(responseObject, error);
//                }else{
//                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
//                        //判断数据是否符合预期，给出提示
//                        if ([responseObject[@"data"] isKindOfClass:[NSDictionary class]]) {
//                            if (responseObject[@"data"][@"too_many_files"]) {
//                                if (autoShowError) {
//                                    [NSObject showHudTipStr:@"文件太多，不能正常显示"];
//                                }
//                            }
//                        }
//                        [NSObject saveResponseData:responseObject toPath:localPath];
//                    }
//                    block(responseObject, nil);
//                }
//
//
//                !autoShowError || [NSObject showError:error];
//                id responseObject = [NSObject loadResponseWithPath:localPath];
//                block(responseObject, error);
//            }];
            break;}
        case Post:{
            [self POST:aPath parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {

                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask *operation, NSError *error) {

                !autoShowError || [NSObject showError:error];
                block(nil, error);
            }];
            break;}
        case Put:{
            [self PUT:aPath parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {

                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask *operation, NSError *error) {

                !autoShowError || [NSObject showError:error];
                block(nil, error);
            }];
            break;}
        case Delete:{
            [self DELETE:aPath parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {

                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask *operation, NSError *error) {

                !autoShowError || [NSObject showError:error];
                block(nil, error);
            }];}
        default:
            break;
    }
    
}

@end
