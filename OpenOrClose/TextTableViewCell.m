//
//  TextTableViewCell.m
//  OpenOrClose
//
//  Created by 田向阳 on 2017/1/5.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "TextTableViewCell.h"

@interface TextTableViewCell ()

@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIButton *menuButton;

@end

@implementation TextTableViewCell

#pragma mark - LifeCycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

#pragma mark - Action

- (void)setModel:(TextModel *)model
{
    _model = model;
    self.contentLabel.text = model.text;
    self.menuButton.selected = model.isOpen;
}

- (void)buttonClick
{
    if ([self.delegate respondsToSelector:@selector(openTextWithModel:)]) {
        [self.delegate openTextWithModel:self.model];
    }
}

#pragma mark - createUI

- (void)createUI
{
    self.menuButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"展开" forState:UIControlStateNormal];
        [button setTitle:@"收起" forState:UIControlStateSelected];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(self.contentView).offset(-5);
            make.size.mas_equalTo(CGSizeMake(40, 20));
        }];
        button;
    });

    self.contentLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0; //必须的
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(5);
            make.right.equalTo(self.contentView).offset(-5);
            make.bottom.mas_equalTo(self.menuButton.mas_top);
        }];
        label;
    });
    
    
}

@end
