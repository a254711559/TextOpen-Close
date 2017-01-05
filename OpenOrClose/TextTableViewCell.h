//
//  TextTableViewCell.h
//  OpenOrClose
//
//  Created by 田向阳 on 2017/1/5.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextModel.h"

@protocol TextCellDelegate <NSObject>

/**
 点击展开按钮

 */
- (void)openTextWithModel:(TextModel *)model;

@end

@interface TextTableViewCell : UITableViewCell

@property (nonatomic, strong) TextModel *model;//数据源
@property (nonatomic, weak) id<TextCellDelegate>delegate;

@end
