//
//  NAAddImageCollectionViewCell.m
//  NiceArticle
//
//  Created by krmao on 16/9/14.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAAddImageCollectionViewCell.h"

static NSString *reuseID=@"collectionImageReuseId";

@interface NAAddImageCollectionViewCell()
//====>>>>瀑布流 start =================================================================================
@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, assign) CGFloat minimumColumnSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign) UIEdgeInsets sectionInset;
//@property (nonatomic, assign) ItemRenderDirection itemRenderDirection;
//====<<<<瀑布流 end   =================================================================================
@end

@implementation NAAddImageCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.uiCollectionView.delegate=self;
    self.uiCollectionView.dataSource=self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(200, 100);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UINib *nib=[UINib nibWithNibName:@"NACollectionViewCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:reuseID];
    UICollectionViewCell* cellView= [self.uiCollectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    return cellView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
