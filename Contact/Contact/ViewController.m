//
//  ViewController.m
//  Contact
//
//  Created by JZG-users on 2017/7/31.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "HMHero.h"
#import "TableViewCell.h"

@interface ViewController ()

@property(nonatomic,strong)NSArray <HMHero *>*contactData;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadContactData];
    
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contactData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _contactData[indexPath.row].name;
    cell.detailTextLabel.text = _contactData[indexPath.row].name;
    cell.imageView.image = [UIImage imageNamed:_contactData[indexPath.row].imageName];
    
    return cell;
}


-(void)loadContactData{
    [[AFHTTPSessionManager manager] GET:@"https://raw.githubusercontent.com/heima26/FriendDemo/master/contacts.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * responseObject) {
        NSMutableArray *arrM = [[NSMutableArray alloc]initWithCapacity:responseObject.count];
        for (NSDictionary *dict in responseObject) {
            HMHero *model = [HMHero heroWithDict:dict];
            [arrM addObject:model];
        }
        _contactData = arrM;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


@end
