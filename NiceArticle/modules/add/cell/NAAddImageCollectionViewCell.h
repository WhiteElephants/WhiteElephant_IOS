//
//  NAAddImageCollectionViewCell.h
//  NiceArticle
//
//  Created by krmao on 16/9/14.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NAAddImageCollectionViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *uiCollectionView;
@end
