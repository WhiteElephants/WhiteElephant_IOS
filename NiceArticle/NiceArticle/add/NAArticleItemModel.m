//
//  NAArticleItemModel.m
//  NiceArticle
//
//  Created by krmao on 16/9/6.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAArticleItemModel.h"

@implementation NAArticleItemModel

-(instancetype)init{
    self=[super init];
    return self;
}
-(instancetype)initWithId:(NSInteger)id{
    self=[super init];
    if(self){
        [self setId:id];
    }
    return self;
}
-(instancetype)initWithIdAndType:(NSInteger)id setType:(NAArticalItemType*)type{
    self=[super init];
    if(self){
        [self setId:id];
        [self setItemType:type];
    }
    return self;
}

//-(void)dealloc{
//    [super dealloc];
//}
@end
