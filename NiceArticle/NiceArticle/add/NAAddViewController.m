//
//  NAAddViewController.m
//  NiceArticle
//
//  Created by krmao on 16/9/2.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAAddViewController.h"
#import "MToastUtil.h"

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
        for (NSInteger row = 0; row < 10; row ++) {
            [sectionArray addObject:[NSString stringWithFormat:@"section -- %ld row -- %ld", section, row]];
        }
        [self.dataArray addObject:sectionArray];
    }
    
    self.uiTableView=[[JXMovableCellTableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.uiTableView.delegate=self;
    self.uiTableView.dataSource=self;
    self.uiTableView.separatorColor=[UIColor blueColor];
    self.uiTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    //[self.uiTableView setEditing:true animated:true];
    [self.view addSubview:self.uiTableView];
    
    self.uiTableView.gestureMinimumPressDuration = 0.5;
    self.uiTableView.drawMovalbeCellBlock = ^(UIView *movableCell){
        movableCell.layer.shadowColor = [UIColor grayColor].CGColor;
        movableCell.layer.masksToBounds = NO;
        movableCell.layer.cornerRadius = 0;
        movableCell.layer.shadowOffset = CGSizeMake(-5, 0);
        movableCell.layer.shadowOpacity = 0.4;
        movableCell.layer.shadowRadius = 5;
    };
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *uiTableViewCell=[self.uiTableView dequeueReusableCellWithIdentifier:@"tag"];
    if(uiTableViewCell==nil)
        uiTableViewCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tag"];
    uiTableViewCell.contentView.backgroundColor=[UIColor yellowColor];
    uiTableViewCell.textLabel.text=[NSString stringWithFormat:@"haha%ld",(long)indexPath.row];
    return uiTableViewCell;
}

@end
