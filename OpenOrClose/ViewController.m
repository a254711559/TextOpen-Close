//
//  ViewController.m
//  OpenOrClose
//
//  Created by 田向阳 on 2017/1/5.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "ViewController.h"
#import "TextTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,TextCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**获取数据*/
    [TextModel getDataComplete:^(NSMutableArray<TextModel *> *dataArray) {
        self.dataArray = dataArray;
        [self.tableView reloadData];
    }];
}

#pragma mark - textCell delegate 

- (void)openTextWithModel:(TextModel *)model
{
    model.isOpen = !model.isOpen;  // 改变 是否展开 的状态值
    NSInteger index = [self.dataArray indexOfObject:model];
        /**刷新指定行*/
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - TableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[TextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.delegate = self;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextModel *model = self.dataArray[indexPath.row];
    if (model.isOpen) {
        return model.textHeight + 30;//(这个30 是指 label上下间距 和 按钮高度)
    }
    else
    {
        if (model.textHeight>100) { // 规定个界限高度  界限高度 + 30
            return 100 + 30;
        }
       return model.textHeight + 30;
    }
}
@end
