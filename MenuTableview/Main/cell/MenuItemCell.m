//
//  MenuItemCell.m
//  MenuTableview
//
//  Created by zzg on 2018/3/8.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "MenuItemCell.h"


@interface GZIMResponderImageView : UIImageView
@end
@implementation GZIMResponderImageView
- (BOOL)canBecomeFirstResponder {
    return YES;
}
@end


@interface MenuItemCell()

@end


@implementation MenuItemCell

+(MenuItemCell *)cellWithTableView:(UITableView *)tableview {
    static NSString * ID = @"ids";
    MenuItemCell * cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MenuItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    return self;
}
-(void)initView {
    self.contentBackGroundView = [[GZIMResponderImageView alloc] initWithFrame:CGRectMake(100, 10, 100, 50)];
    self.contentBackGroundView.clipsToBounds = YES;
    self.contentBackGroundView.userInteractionEnabled = YES;
    self.contentBackGroundView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.contentBackGroundView];
    
    UILongPressGestureRecognizer * press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.contentBackGroundView addGestureRecognizer:press];
    
    
}


-(void)longPress:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(menuItem:)]) {
            [self.delegate menuItem:self];
        }
        
        [self setHighlighted:YES];
        UIMenuController *menu=[UIMenuController sharedMenuController];
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(s_copyItemClicked:)];
        UIMenuItem *forwardItem = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(s_forwardItemClicked:)];
        
        menu.menuItems = @[copyItem,forwardItem];
        [menu setTargetRect:self.contentBackGroundView.bounds inView:self.contentBackGroundView];
        [menu setMenuVisible:YES animated:YES];
    }
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action==@selector(s_copyItemClicked:)) {
        return YES;
    } else if (action==@selector(s_forwardItemClicked:)){
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)s_copyItemClicked:(id)sender {
    NSLog(@"----复制");
}

- (void)s_forwardItemClicked:(id)sender {
    NSLog(@"----s_forwardItemClicked");
}




@end

