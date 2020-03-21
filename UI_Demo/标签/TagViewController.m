//
//  TagViewController.m
//  UI_Demo
//
//  Created by nyl on 2018/6/13.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "TagViewController.h"
#import "TagTableViewCell.h"
#import "XGTagView.h"
#import "TagModel.h"


@interface TagViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) CGFloat myHeight;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *dataArr1;
@property (nonatomic, strong) NSMutableArray *dataArr2;
@property (nonatomic, strong) NSMutableArray *dataArr3;

@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *tempArr1 = [NSMutableArray array];
    _dataArr1 = [NSMutableArray array];
    for (int i = 0; i < 6; i++ ) {
        TagModel *model = [[TagModel alloc] init];
        model.value = @"寡妇";
        model.isChangeLine = NO;
        [tempArr1 addObject:model];
        [_dataArr1 addObject:model];
    }
    
    NSMutableArray *tempArr2 = [NSMutableArray array];
    _dataArr2 = [NSMutableArray array];
    for (int i = 0; i < 2; i++ ) {
        TagModel *model = [[TagModel alloc] init];
        model.value = @"足球2";
        model.isChangeLine = NO;
        [tempArr2 addObject:model];
        [_dataArr2 addObject:model];
    }
    
    NSMutableArray *tempArr3 = [NSMutableArray array];
    _dataArr3 = [NSMutableArray array];
    for (int i = 0; i < 2; i++ ) {
        TagModel *model = [[TagModel alloc] init];
        model.value = @"足球2";
        model.isChangeLine = NO;
        [tempArr3 addObject:model];
        [_dataArr3 addObject:model];
    }
    
    
    _dataArr = [NSMutableArray array];
    [_dataArr addObject:tempArr1];
    [_dataArr addObject:tempArr2];
    
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *inden = @"**SSSS";//[NSString stringWithFormat:@"--%ld", indexPath.row];
    
    TagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inden];
    if (!cell) {
        cell = [[TagTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:inden];
        
    }
    __weak typeof(self) weakSelf = self;
    if (indexPath.section == 0) {
        
        //cell.tView.tagArray = @[@"已婚婚已婚已已婚已婚已婚", @"未婚"];
        cell.tView.tagArray = _dataArr1;
        
        cell.tView.isSingleSelection = YES;
        cell.tView.reloaBlock = ^{
            TagModel *model = weakSelf.dataArr1[indexPath.row];
            model.isChangeLine = YES;
            [weakSelf.dataArr1 replaceObjectAtIndex:indexPath.row withObject:model];
        };
        
    } else if(indexPath.section == 1){
        //cell.tView.tagArray = @[@"四针", @"头疼", @"小儿麻痹"];
        cell.tView.tagArray = _dataArr2;
        cell.tView.reloaBlock = ^{
            TagModel *model = weakSelf.dataArr2[indexPath.row];
            model.isChangeLine = YES;
            [weakSelf.dataArr2 replaceObjectAtIndex:indexPath.row withObject:model];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationTop)];
        };
        
        
    } else if(indexPath.section == 2){
        //cell.tView.tagArray = @[@"骨头", @"腿疼", @"腰疼", @"风湿", @"哈哈"];
        cell.tView.tagArray = _dataArr3;
        cell.tView.reloaBlock = ^{
            TagModel *model = weakSelf.dataArr3[indexPath.row];
            model.isChangeLine = YES;
            [weakSelf.dataArr3 replaceObjectAtIndex:indexPath.row withObject:model];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationTop)];
        };
    } else {
        //cell.tView.tagArray = @[[NSString stringWithFormat:@"其他%ld", indexPath.section], @"222", @"3333", @"dhajkdfhsaj", @"dhsajkldhsajk"];
        
        cell.tView.tagArray = _dataArr3;
        
        cell.tView.reloaBlock = ^{
            TagModel *model = weakSelf.dataArr3[indexPath.row];
            model.isChangeLine = YES;
            [weakSelf.dataArr3 replaceObjectAtIndex:indexPath.row withObject:model];
            //[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.row] withRowAnimation:(UITableViewRowAnimationTop)];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationTop)];
        };
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    TagTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"**SSSS"];
//
//    UIButton *btn3 = nil;
//    for (UIButton *btn in cell.tView.subviews) {
//        btn3 = btn;
//    }
//    return btn3.frame.origin.y + btn3.frame.size.height + 50;
    
    if (indexPath.row == 0) {
        TagModel *model = _dataArr1[indexPath.row];
        return model.isChangeLine ? 270 : 100;
    } else if(indexPath.row == 1) {
        
        TagModel *model = _dataArr2[indexPath.row];
        return model.isChangeLine ? 170 : 100;
        
    } else if (indexPath.row == 2) {
        
        TagModel *model = _dataArr3[indexPath.row];
        return model.isChangeLine ? 170 : 100;
        
    } else {
        
        TagModel *model = _dataArr3[indexPath.row];
        return model.isChangeLine ? 170 : 100;
    }
   
    
//    if (indexPath.row == 0) {
//        BOOL isChange = [self isChangeLineWithTagArr:@[@"已婚婚已婚已已婚已婚已婚", @"未婚"]];
//
//        return isChange ? 220 : 120;
//    } else if (indexPath.row == 1) {
//        BOOL isChange = [self isChangeLineWithTagArr:@[@"骨头", @"腿疼", @"腰疼", @"风湿", @"哈哈"]];
//        return isChange ? 220 : 120;
//    } else if (indexPath.row == 2) {
//        BOOL isChange = [self isChangeLineWithTagArr:@[@"骨头", @"腿疼", @"腰疼", @"风湿", @"哈哈"]];
//        return isChange ? 220 : 120;
//    } else {
//       BOOL isChange = [self isChangeLineWithTagArr: @[[NSString stringWithFormat:@"其他%ld", indexPath.section], @"222", @"3333", @"dhajkdfhsaj", @"dhsajkldhsajk"]];
//        return isChange ? 220 : 120;
//    }
//    return 120;
    return UITableViewAutomaticDimension;
    //TagTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"**SSSS"];
    //return cell.tView.isChangeLine == YES ? 230 : 100;
    
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)isChangeLineWithTagArr:(NSArray *)tagArr {
    
        
        // 按钮高度
        CGFloat btnH = 28;
        // 距离左边距
        CGFloat leftX = 6;
        // 距离上边距
        CGFloat topY = 10;
        // 按钮左右间隙
        CGFloat marginX = 10;
        // 按钮上下间隙
        CGFloat marginY = 10;
        // 文字左右间隙
        CGFloat fontMargin = 10;
        int hIndex = 1;
        for (int i = 0; i < tagArr.count; i++) {
            
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(100+ marginX + leftX, topY, 100, btnH);
            btn.tag = 100+i;
            // 默认选中第一个
            //        if (i == 0) {
            //            btn.selected = YES;
            //        }
            
            // 按钮文字
            [btn setTitle:tagArr[i] forState:UIControlStateNormal];
            
            //------ 默认样式
            //按钮文字默认样式
            NSMutableAttributedString* btnDefaultAttr = [[NSMutableAttributedString alloc]initWithString:btn.titleLabel.text];
            // 文字大小
            [btnDefaultAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, btn.titleLabel.text.length)];
            // 默认颜色
            [btnDefaultAttr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, btn.titleLabel.text.length)];
            [btn setAttributedTitle:btnDefaultAttr forState:UIControlStateNormal];
            
        
            
            //-----  选中样式
            // 选中字体颜色
            NSMutableAttributedString* btnSelectedAttr = [[NSMutableAttributedString alloc]initWithString:btn.titleLabel.text];
      
            // 选中文字大小
            [btnSelectedAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, btn.titleLabel.text.length)];
            [btn setAttributedTitle:btnSelectedAttr forState:UIControlStateSelected];
            
  
            
            // 圆角
            btn.layer.cornerRadius = btn.frame.size.height / 2.f;
            btn.layer.masksToBounds = YES;
            // 边框
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            btn.layer.borderWidth = 0.5;
            
            // 设置按钮的边距、间隙
            [self setTagButtonMargin:btn fontMargin:fontMargin];
            
            // 处理换行
            if (btn.frame.origin.x + btn.frame.size.width + marginX > self.view. frame.size.width) {
                
                hIndex += 1;
                
                
                
                
                // 换行
                topY += btnH + marginY;
                
                // 重置
                leftX = 6;
                btn.frame = CGRectMake(100+ marginX + leftX, topY, 100, btnH);
                
                // 设置按钮的边距、间隙
                [self setTagButtonMargin:btn fontMargin:fontMargin];
              
                return YES;
                
            }
            
            // 重置高度
            CGRect frame = btn.frame;
            frame.size.height = btnH;
            btn.frame = frame;
            
            //----- 选中事件
    
            
            [self.view addSubview:btn];
            btn.alpha = 0.1;
            leftX += btn.frame.size.width + marginX;
        }
    
    return NO;

}


// 设置按钮的边距、间隙
- (void)setTagButtonMargin:(UIButton*)btn fontMargin:(CGFloat)fontMargin{
    
    // 按钮自适应
    [btn sizeToFit];
    
    // 重新计算按钮文字左右间隙
    CGRect frame = btn.frame;
    frame.size.width += fontMargin*2;
    btn.frame = frame;
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

