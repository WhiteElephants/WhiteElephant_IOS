//
//  NAMainViewController.m
//  NiceArticle
//
//  Created by krmao on 16/9/2.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAMainViewController.h"
#import "MToastUtil.h"

@interface NAMainViewController ()

@end

@implementation NAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addMainItem];
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

- (void)addMainItem{
    int height=self.tabBar.frame.size.height+20;
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, height, height);
    [button setBackgroundImage:[UIImage imageNamed:@"ic_menu_btn_add.png"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"ic_menu_btn_add.png"] forState:UIControlStateHighlighted];
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    
    CGFloat heightDifference = height - self.tabBar.frame.size.height;
    if (heightDifference < 0){
        //如果自定义的view高度小于tabBar 则相对tabBar居中
        button.center = self.tabBar.center;
    } else
    {
        //如果自定义的view高度大于等于tabBar 则相对tabBar水平居中，重设y轴中点
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    // action for this button
    [button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:button];
}

- (void)buttonEvent{
    [self setSelectedIndex:2];
    [MToastUtil showWithText:@"YOU CLICKED"];
    
}



@end
