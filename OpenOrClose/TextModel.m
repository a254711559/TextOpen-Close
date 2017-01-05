//
//  TextModel.m
//  OpenOrClose
//
//  Created by 田向阳 on 2017/1/5.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "TextModel.h"

@implementation TextModel

- (void)setText:(NSString *)text
{
    _text = text;
    CGFloat windowWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat labeWidth = windowWidth - 10;//（ 10 为左右边距）
        /** 这里计算label的宽的时候 一定不要有偏差 否则算出的高度不准确*/
    _textHeight = [text boundingRectWithSize:CGSizeMake(labeWidth, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} // font 要和lable的font保持一致
                                     context:nil].size.height + 1;//(末尾 这个 1  是有可能计算存在误差,为矫正数值,可根据具体情况调整)
}

+ (void)getDataComplete:(void (^)(NSMutableArray<TextModel *> *))complete
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<10; i++)
    {
        TextModel *model = [[TextModel alloc] init];
        NSString *str = @"霾愁\n";
            str = [str stringByAppendingString:@"\n古时候\n口罩是一个小小的道具\n我在这头\n强盗在那头\n\n小时候\n口罩是心中深深的恐惧\n我在这头\n针头在那头\n\n再后来\n口罩是2003浅浅的记忆\n我在这头\nSARS在那头\n\n现如今\n口罩是全民的防霾神器\n我在这头\n却看不清谁在那头"];
        model.text = str;
        [array addObject:model];
    }
    complete?complete(array):nil;
}
@end
