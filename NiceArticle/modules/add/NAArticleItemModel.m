//
//  NAArticleItemModel.m
//  NiceArticle
//
//  Created by krmao on 16/9/6.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAArticleItemModel.h"
#import "MDeviceUtil.h"

@interface NAArticleItemModel()
@end
@implementation NAArticleItemModel

-(instancetype)init{
    return [self initWithId:0];
}
-(instancetype)initWithId:(NSInteger)id{
    return [self initWithIdAndType:id setType:TEXT];
}
-(instancetype)initWithIdAndType:(NSInteger)id setType:(NAArticalItemType)type{
    self=[super init];
    if(self){
        [self setId:id];
        [self setItemType:type];
        [self setIsTextChangedAfterCalHeight:true];
    }
    return self;
}


+(UIView*) createTableViewHeader:(UITableView*)tableView  itemModel:(NAArticleItemModel*)itemModel setDelegate:(id<UITextViewDelegate> )delegate{
    UIView *contentHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [MDeviceUtil getScreenRect].size.width, 100)];
    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 10, [MDeviceUtil getScreenRect].size.width-20, 80)];
    [textView setTextColor:[UIColor blackColor]];
    [textView setAutocorrectionType:UITextAutocorrectionTypeNo];//设置是否启动自动提醒更正功能
    [textView setText:nil];
    [textView setReturnKeyType:UIReturnKeyDone];//设置键盘完成的按钮
    [textView setDelegate:delegate];
    [textView setScrollEnabled:false];
    [textView setBackgroundColor:[UIColor whiteColor]];
    [textView setFont:[UIFont fontWithName:@"Arial" size:12]];
    [textView setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [contentHeaderView setBackgroundColor:[UIColor clearColor]];
    [contentHeaderView addSubview:textView];
    return contentHeaderView;
}


+(UITableViewCell*) createTableViewCellText:(UITableView*)tableView  itemModel:(NAArticleItemModel*)itemModel{
    UITableViewCell *uiTableViewCell=[tableView dequeueReusableCellWithIdentifier:@"createTableViewCellText"];
    if(uiTableViewCell==nil){
        uiTableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"createTableViewCellText"];
        uiTableViewCell.selectedBackgroundView = [[UIView alloc] initWithFrame:uiTableViewCell.frame];
        uiTableViewCell.selectedBackgroundView.backgroundColor=[UIColor whiteColor];
        uiTableViewCell.textLabel.textColor=[UIColor lightGrayColor];//默认颜色
        uiTableViewCell.textLabel.highlightedTextColor = [UIColor lightGrayColor];//选中时颜色
        uiTableViewCell.backgroundColor=[UIColor clearColor];
        uiTableViewCell.contentView.backgroundColor=[UIColor clearColor];
        
        uiTableViewCell.backgroundView = [[UIView alloc] initWithFrame:uiTableViewCell.frame];
        uiTableViewCell.backgroundView.backgroundColor=[UIColor grayColor];
        //uiTableViewCell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
     uiTableViewCell.textLabel.text= [NSString stringWithFormat:@"%ld,type:%u",itemModel.id,itemModel.itemType];
    return uiTableViewCell;
}

+(UITableViewCell*) createTableViewCellImage:(UITableView*)tableView itemModel:(NAArticleItemModel*)itemModel{
    UITableViewCell *uiTableViewCell=[tableView dequeueReusableCellWithIdentifier:@"createTableViewCellImage"];
    if(uiTableViewCell==nil){
        uiTableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"createTableViewCellImage"];
        uiTableViewCell.selectedBackgroundView = [[UIView alloc] initWithFrame:uiTableViewCell.frame];
        uiTableViewCell.selectedBackgroundView.backgroundColor=[UIColor whiteColor];
        uiTableViewCell.textLabel.textColor=[UIColor blackColor];//默认颜色
        uiTableViewCell.textLabel.highlightedTextColor = [UIColor lightGrayColor];//选中时颜色
        uiTableViewCell.backgroundColor=[UIColor clearColor];
        uiTableViewCell.contentView.backgroundColor=[UIColor clearColor];
        
        uiTableViewCell.backgroundView = [[UIView alloc] initWithFrame:uiTableViewCell.frame];
        uiTableViewCell.backgroundView.backgroundColor=[UIColor greenColor];
        //uiTableViewCell.selectionStyle=UITableViewCellSelectionStyleNone;
    }else{
        NSLog(@"复用:createTableViewCellImage");
    }
     uiTableViewCell.textLabel.text= [NSString stringWithFormat:@"%ld,type:%u",itemModel.id,itemModel.itemType];
    return uiTableViewCell;
}

+(UITableViewCell*) createTableViewCellMultiImage:(UITableView*)tableView itemModel:(NAArticleItemModel*)itemModel{
    UITableViewCell *uiTableViewCell=[tableView dequeueReusableCellWithIdentifier:@"createTableViewCellMultiImage"];
    if(uiTableViewCell==nil){
        uiTableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"createTableViewCellMultiImage"];
        uiTableViewCell.selectedBackgroundView = [[UIView alloc] initWithFrame:uiTableViewCell.frame];
        uiTableViewCell.selectedBackgroundView.backgroundColor=[UIColor whiteColor];
        uiTableViewCell.textLabel.textColor=[UIColor yellowColor];//默认颜色
        uiTableViewCell.textLabel.highlightedTextColor = [UIColor lightGrayColor];//选中时颜色
        uiTableViewCell.backgroundColor=[UIColor clearColor];
        uiTableViewCell.contentView.backgroundColor=[UIColor clearColor];
        
        uiTableViewCell.backgroundView = [[UIView alloc] initWithFrame:uiTableViewCell.frame];
        uiTableViewCell.backgroundView.backgroundColor=[UIColor orangeColor];
        //uiTableViewCell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    uiTableViewCell.textLabel.text= [NSString stringWithFormat:@"%ld,type:%u",itemModel.id,itemModel.itemType];
    return uiTableViewCell;
}

//-(void)dealloc{
//    [super dealloc];
//}
@end
