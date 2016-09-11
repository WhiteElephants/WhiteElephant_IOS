//
//  NetAPIManager.m
//
//  Created by Jason on 11/20/15.
//  Copyright © 2015 Jason. All rights reserved.
//


#import "NetAPIManager.h"
#import "NetAPIClient.h"

#import "NSObject+ObjectMap.h"


@implementation NetAPIManager

+ (instancetype)sharedManager {
    static NetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

@end
