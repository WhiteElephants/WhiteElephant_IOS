//
//  NAHomeViewController.m
//  NiceArticle
//
//  Created by krmao on 16/9/2.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAHomeViewController.h"

@interface NAHomeViewController ()

@end

@implementation NAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self view] setBackgroundColor:[UIColor redColor]];
    
    [[self tabBarItem]setTitle:@"首页"];
    [[self tabBarItem]setImage:[UIImage imageNamed:@"ic_menu_home.png"]];
    [[self tabBarItem]setSelectedImage:[UIImage imageNamed:@"ic_menu_home.png"]];
    //self.tabBarItem.badgeValue=@"1";//图标右上角内容
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
