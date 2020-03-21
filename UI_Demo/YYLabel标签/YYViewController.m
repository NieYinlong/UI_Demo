//
//  YYViewController.m
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "YYViewController.h"
#import "NSMutableAttributedString+DCTagView.h"
#import "DCTagView.h"
#import <Masonry.h>
#import "YYTableViewCell.h"

@interface YYViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *tagArr1;
@property (nonatomic, strong) NSArray *tagArr2;

@end

@implementation YYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    _tagArr1 = @[@"寡妇", @"未婚", @"已婚", @"未婚"];
    _tagArr2 = @[@"足球", @"篮球", @"排球", @"乒乓球", @"篮球", @"排球", @"乒乓球", @"篮球", @"排球", @"乒乓球"];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDID"];
    if (!cell) {
        cell = [[YYTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"IDID"];
    }
    if (indexPath.row %2 == 0) {
        cell.tagArray = _tagArr1;
    } else {
        cell.tagArray = _tagArr2;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
