//
//  TableViewExpandVC.m
//  UI_Demo
//
//  Created by nyl on 2018/6/11.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "TableViewExpandVC.h"
#import "ExpandCell.h"


@interface TableViewExpandVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isExpand;

@end

@implementation TableViewExpandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *IDD = @"sss";
    ExpandCell *cell =  [tableView dequeueReusableCellWithIdentifier:IDD];
    if (!cell) {
        cell = [[ExpandCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:IDD];
    }
    cell.titleLB.text = @"标题";
    cell.detailLB.text = @"这是内容🏷😁💇🇨🇳容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内🏷😁💇🇨🇳容🏷😁💇🇨🇳？🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳💐🐒这是内容🏷😁💇🇨🇳容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内🏷😁💇🇨🇳容🏷😁💇🇨🇳？🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳💐🐒这是内容🏷😁💇🇨🇳容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内🏷😁💇🇨🇳容🏷😁💇🇨🇳？🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳💐🐒这是内容🏷😁💇🇨🇳容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内🏷😁💇🇨🇳容🏷😁💇🇨🇳？🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳💐🐒这是内容🏷😁💇🇨🇳容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内🏷😁💇🇨🇳容🏷😁💇🇨🇳？🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳💐🐒这是内容🏷😁💇🇨🇳容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内🏷😁💇🇨🇳容🏷😁💇🇨🇳？🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳🏷😁💇🇨🇳💐🐒??";
    
    [cell.seeDetailBtn  addTarget:self action:@selector(seeDetailBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    if (_isExpand) {
        [cell.seeDetailBtn setTitle:@"收起" forState:(UIControlStateNormal)];
    } else {
        [cell.seeDetailBtn setTitle:@"展开" forState:(UIControlStateNormal)];
    }
    
    
    return cell;
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self seeDetailBtnClick];
}


- (void)seeDetailBtnClick {
    _isExpand = !_isExpand;
    [self.tableView reloadData];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isExpand) {
       return  UITableViewAutomaticDimension;
    } else {
        return 140;
    }
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
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
