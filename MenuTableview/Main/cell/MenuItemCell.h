//
//  MenuItemCell.h
//  MenuTableview
//
//  Created by zzg on 2018/3/8.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuItemCell;

@protocol MenuItemDelegate <NSObject>
-(void)menuItem:(MenuItemCell *)item;
@end


@interface MenuItemCell : UITableViewCell

+(MenuItemCell *)cellWithTableView:(UITableView *)tableview;

@property (nonatomic, strong) UIImageView * contentBackGroundView;

@property (nonatomic, weak) id<MenuItemDelegate>  delegate;

@end
