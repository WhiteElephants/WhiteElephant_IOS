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
-(instancetype)initWithIdAndType:(NSInteger)id setType:(NAArticalItemType)type{
    self=[super init];
    if(self){
        [self setId:id];
        [self setItemType:type];
    }
    return self;
}

+(UIView*) createTableViewHeader:(UITableView*)tableView  itemModel:(NAArticleItemModel*)itemModel setDelegate:(id<UITextFieldDelegate> )delegate{
    UITextField *textField=nil;
    CGRect frame=CGRectMake(0, 0, [MDeviceUtil getScreenRect].size.width, 60);
    textField=[[UITextField alloc]initWithFrame:frame];
    [textField setTextColor:[UIColor blackColor]];
    textField.borderStyle = UITextBorderStyleRoundedRect;//边框风格
    textField.autocorrectionType = UITextAutocorrectionTypeYes;//设置是否启动自动提醒更正功能
    textField.placeholder = @"点击输入标题";//默认的文本显示
    textField.returnKeyType = UIReturnKeyDone;//设置键盘完成的按钮
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = delegate;
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    textField.text= [NSString stringWithFormat:@"%ld,type:%u",itemModel.id,itemModel.itemType];
    [tableView setTableHeaderView:textField];
    return textField;
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
