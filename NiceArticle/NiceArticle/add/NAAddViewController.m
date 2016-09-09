//
//  NAAddViewController.m
//  NiceArticle
//
//  Created by krmao on 16/9/2.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAAddViewController.h"
#import "MToastUtil.h"
#import "NAArticleItemModel.h"

#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0]

@interface NAAddViewController ()
    @property (nonatomic, strong) NSMutableArray* dataArray;
@end

@implementation NAAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blackColor];
    
    //====>>>> 设置图标、标题(tabBarItem是显示在tabBar上的标签) start ==========================================
    self.title=@"";
    self.tabBarItem.title=@"";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    self.tabBarItem.image=[UIImage imageNamed:@"sym_action_add.png"];//默认图片
    self.tabBarItem.selectedImage=[UIImage imageNamed:@"sym_action_add.png"];//选中图片
    //self.tabBarItem.badgeValue=@"3";//图标右上角内容
    self.tabBarItem.imageInsets = UIEdgeInsetsMake( 5.0, 0, - 5.0, 0);
    //====<<<< 设置图标、标题(tabBarItem是显示在tabBar上的标签) end   ==========================================
    
    [self initUITabbleView];
}

- (void)initUITabbleView{
    self.dataArray=[NSMutableArray new];
    for (NSInteger section = 0; section < 1; section++) {
        NSMutableArray *sectionArray = [NSMutableArray new];
        for (NSInteger row = 0; row < 30; row ++) {
            NAArticleItemModel *itemModel=[[NAArticleItemModel alloc] initWithIdAndType:row setType:(row%3==0?TEXT:(row%3==1?IMAGE:MULTI_IMAGE))];
            [sectionArray addObject:itemModel];
        }
        [self.dataArray addObject:sectionArray];
    }
    
    self.uiTableView=[[JXMovableCellTableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.uiTableView.delegate=self;
    self.uiTableView.dataSource=self;
    self.uiTableView.separatorColor=[UIColor lightGrayColor];
    self.uiTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.uiTableView.backgroundColor=UIColorFromHex(0xefefef);
    //[self.uiTableView setEditing:true animated:true];
    [self.view addSubview:self.uiTableView];//处理 UITableView 覆盖状态栏问题
    if (self.uiTableView.style == UITableViewStylePlain) {
        CGRect statusBarRect=[[UIApplication sharedApplication] statusBarFrame];
        
        UIEdgeInsets contentInset = self.uiTableView.contentInset;
        contentInset.top = statusBarRect.size.height;
        [self.uiTableView setContentInset:contentInset];
        
        UIView *barBackground = [[UIView alloc] initWithFrame:statusBarRect];//使得文字在状态栏下半透明显示
        barBackground.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
        [self.view addSubview:barBackground];
    }
    NAArticleItemModel * headerModel=[[NAArticleItemModel alloc]init];
    [headerModel setId:-1];
    [headerModel setItemType:HEADER];
    self.uiTableView.tableHeaderView=[NAArticleItemModel createTableViewHeader:self.uiTableView itemModel:headerModel setDelegate:self];
    self.uiTableView.gestureMinimumPressDuration = 0.5;
    self.uiTableView.drawMovalbeCellBlock = ^(UIView *movableCell){
        movableCell.layer.shadowColor = [UIColor blackColor].CGColor;
        movableCell.layer.masksToBounds = NO;
        movableCell.layer.cornerRadius = 0;
        movableCell.layer.shadowOffset = CGSizeMake(10, 7);
        movableCell.layer.shadowOpacity = 7;
        movableCell.layer.shadowRadius = 7;
    };
}

//当开始点击textField会调用的方法
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [MToastUtil showWithText:@"beigin"];
}

//当textField编辑结束时调用的方法
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [MToastUtil showWithText:@"end"];
}


//按下Done按钮的调用方法，我们让键盘消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [MToastUtil showWithText:@"return"];
    //[textField resignFirstResponder];
    return YES;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [MToastUtil showWithText:@"you click"];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}

- (NSArray *)dataSourceArrayInTableView:(JXMovableCellTableView *)tableView{
    return self.dataArray.copy;
}

- (void)tableView:(JXMovableCellTableView *)tableView newDataSourceArrayAfterMove:(NSArray *)newDataSourceArray{
    self.dataArray = newDataSourceArray.mutableCopy;
    [self.uiTableView reloadData];
}

- (void)tableView:(JXMovableCellTableView *)tableView didMoveCellFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    NSLog(@"moveRowAtIndexPath:fromIndexPath:%ld,toIndexPath:%ld",fromIndexPath.row,toIndexPath.row);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NAArticleItemModel*itemModel=[self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    UITableViewCell *uiTableViewCell=nil;
    switch (itemModel.itemType) {
        default:
        case TEXT:
            uiTableViewCell=[NAArticleItemModel createTableViewCellText:tableView itemModel:itemModel];
            break;
        case IMAGE:
            uiTableViewCell=[NAArticleItemModel createTableViewCellImage:tableView itemModel:itemModel];
            break;
        case MULTI_IMAGE:
            uiTableViewCell=[NAArticleItemModel createTableViewCellMultiImage:tableView itemModel:itemModel];
            break;
    }
    return uiTableViewCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.uiTableView deselectRowAtIndexPath:indexPath animated:YES];//松开手指时,取消选中背景色
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.uiTableView deselectRowAtIndexPath:indexPath animated:YES];//松开手指时,取消选中背景色
}

-(void)viewWillAppear:(BOOL)animated{
    [self.uiTableView deselectRowAtIndexPath:[self.uiTableView indexPathForSelectedRow] animated:YES];//UITableView点击进入下一页 push页返回取消选中状态
}

@end
