//
//  TextModel.h
//  OpenOrClose
//
//  Created by 田向阳 on 2017/1/5.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextModel : NSObject

@property (nonatomic, copy) NSString *text; //文本
@property (nonatomic, assign) CGFloat textHeight; // 文本高度
@property (nonatomic, assign) BOOL isOpen; // 是否展开

+ (void)getDataComplete:(void(^)(NSMutableArray<TextModel *>* dataArray))complete;

@end
