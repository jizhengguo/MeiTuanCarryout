//
//  FoodDetailFlowLayout.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/4.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "FoodDetailFlowLayout.h"

@implementation FoodDetailFlowLayout

-(void)prepareLayout{
    //cell尺寸
    self.itemSize = self.collectionView.bounds.size;
    //滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //行列间距
    self.minimumLineSpacing = 0;
    
    self.minimumInteritemSpacing = 0;
    
}

@end
