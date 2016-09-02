//
//  NAMineViewController.m
//  NiceArticle
//
//  Created by krmao on 16/9/2.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAMineViewController.h"

@interface NAMineViewController ()

@end

@implementation NAMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
    self.title=@"我的";
    NSLog(@"%i",self.tabBarController==self.parentViewController);//对于当前应用二者相等
    
    //====>>>> 设置图标、标题(tabBarItem是显示在tabBar上的标签) start ==========================================
    self.tabBarItem.title=@"我的";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    self.tabBarItem.image=[UIImage imageNamed:@"ic_menu_myplaces.png"];//默认图片
    self.tabBarItem.selectedImage=[UIImage imageNamed:@"ic_menu_myplaces.png"];//选中图片
    //self.tabBarItem.badgeValue=@"4";//图标右上角内容
    //====<<<< 设置图标、标题(tabBarItem是显示在tabBar上的标签) end   ==========================================
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
