//
//  NAArticleItemModel.h
//  NiceArticle
//
//  Created by krmao on 16/9/6.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    TEXT,//文本类型
    IMAGE,//单个图片类型
    MULTI_IMAGE//多个图片类型
} NAArticalItemType;

@interface NAArticleItemModel : NSObject

@property NSInteger id;
@property NSString *content;
@property NSString *imagePath;
@property NAArticalItemType itemType;

-(instancetype)initWithIdAndType:(NSInteger)id setType:(NAArticalItemType)type;


+(UITableViewCell*) createTableViewCellText:(UITableView*)tableView itemModel:(NAArticleItemModel*)itemModel;
+(UITableViewCell*) createTableViewCellImage:(UITableView*)tableView itemModel:(NAArticleItemModel*)itemModel;
+(UITableViewCell*) createTableViewCellMultiImage:(UITableView*)tableView itemModel:(NAArticleItemModel*)itemModel;

@end
