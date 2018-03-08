//
//  MainViewController.m
//  MenuTableview
//
//  Created by zzg on 2018/3/8.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "MainViewController.h"
#import "MenuItemCell.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,MenuItemDelegate>
@property (nonatomic, strong) NSMutableArray * myData;

@property (nonatomic, strong) UITableView * tableview;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.estimatedRowHeight = 0;
    self.tableview.estimatedSectionHeaderHeight = 0;
    self.tableview.estimatedSectionFooterHeight = 0;
    self.tableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableview];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 100, 100, 100);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self btnClick];
    });
}
- (void)btnClick {
    for (NSInteger index = 0; index < 10; index++) {
        [self.myData addObject:[NSString stringWithFormat:@"%ld",index]];
        NSIndexPath * path = [NSIndexPath indexPathForRow:self.myData.count-1 inSection:0];
        [self.tableview insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
        
//        [self.tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.myData.count -1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuItemCell * cell = [MenuItemCell cellWithTableView:tableView];
    cell.delegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


-(void)menuItem:(MenuItemCell *)item {
    [item.contentBackGroundView becomeFirstResponder];
}


-(NSMutableArray *)myData {
    if (!_myData) {
        _myData = [NSMutableArray new];
        [_myData addObject:@"1"];
        [_myData addObject:@"2"];
        [_myData addObject:@"3"];
        [_myData addObject:@"4"];
        [_myData addObject:@"5"];
    }
    return _myData;
}

@end
