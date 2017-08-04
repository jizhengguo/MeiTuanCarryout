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
    
    self.itemSize = self.collectionView.bounds.size;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    self.minimumLineSpacing = 0;
    
    self.minimumInteritemSpacing = 0;
    
}

@end
