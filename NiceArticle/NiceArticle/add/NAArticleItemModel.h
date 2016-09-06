//
//  NAArticleItemModel.h
//  NiceArticle
//
//  Created by krmao on 16/9/6.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

enum NAArticalItemType{
    TEXT,//文本类型
    IMAGE//图片类型
};

@interface NAArticleItemModel : NSObject

@property NSInteger id;
@property NSString *content;
@property NSString *imagePath;
@property NAArticalItemType *itemType;

-(instancetype)initWithIdAndType:(NSInteger)id setType:(NAArticalItemType*)type;

@end
