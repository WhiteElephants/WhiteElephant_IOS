//
//  NAAddViewController.h
//  NiceArticle
//
//  Created by krmao on 16/9/2.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXMovableCellTableView.h"

@interface NAAddViewController : UIViewController<JXMovableCellTableViewDataSource,JXMovableCellTableViewDelegate,UITextViewDelegate>

@property(strong,nonatomic)JXMovableCellTableView *uiTableView;

@end
