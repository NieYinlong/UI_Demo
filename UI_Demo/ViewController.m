//
//  ViewController.m
//  UI_Demo
//
//  Created by nyl on 2018/6/4.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "ViewController.h"
#import "DottView.h"
#import "ItemLabel.h"
#import "WeightItemView.h"
#import "UISrolViewController.h"
#import "TableViewExpandVC.h"
#import <Masonry.h>
#import "XGTagView.h"
#import "TagViewController.h"
#import <WebKit/WebKit.h>
#import "YYViewController.h"
#import "MasonryAnimationVC.h"
#import "TestModel.h"
#import "NSCharacterSetStudyVC.h"
#import "HalfCircleVC.h"
#import "BottomOutVC.h"
#import "UICollectionViewVC.h"
#import "SlideDemoViewController.h"

@interface ViewController ()<XGTagViewDelegate, UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) XGTagView *tView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *menus;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *serverVersion = @"1.0.4"; // 后台存储的版本号
    NSString *curVersion = @"1.0.1";    // 当前app的版本号
    
    NSComparisonResult comResult = [serverVersion compare:curVersion options:NSNumericSearch];
    
    if (comResult == NSOrderedDescending) {
        
        // serverVersion > curVersion
        // 提示app进行升级
        
    }
    else if (comResult == NSOrderedAscending) {
        
        // serverVersion < curVersion
        
    }
    else if (comResult == NSOrderedSame) {
        
        // serverVersion = curVersion
    }
    
    
    self.navigationItem.title = @"menus";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    return;
    TestModel *model_1 = [[TestModel alloc] init];
    model_1.name = @"001";
    model_1.age = @"20";
    
    TestModel *model_2 = [[TestModel alloc] init];
    model_2.name = @"002";
    model_2.age = @"31";
    
    
    
    TestModel *model_3 = [[TestModel alloc] init];
    model_3.name = @"003";
    model_3.age = @"20";
    
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:model_1];
    [arr addObject:model_2];
    [arr addObject:model_3];
    
    
    
    TestModel *model_4 = [[TestModel alloc] init];
    model_4.name = @"003";
    model_4.age = @"20";
    
//
    for (int i = 0 ; i < arr.count; i++) {
        TestModel *subModel = arr[i];
        if ([subModel.name isEqualToString:model_4.name]) {
            [arr addObject:model_4];
            break;
        }
    }

    for (TestModel *model in arr) {
        NSLog(@"mode.name = %@", model.name);
    }

    //return;
    
    __block BOOL isExist = NO;
    [arr enumerateObjectsUsingBlock:^(TestModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.name isEqualToString:model_4.name]) {//数组中已经存在该对象
            *stop = YES;
            isExist = YES;
        }
    }];
    if (!isExist) {//如果不存在就添加进去
        [arr addObject:model_4];
        for (TestModel *model in arr) {
            NSLog(@"mode.name = %@", model.name);
        }
    }
    return;
    
    
//
    
    
    
    //NSLog(@"%@", arr);
    
    
    
    return;
    MasonryAnimationVC *mAVC = [MasonryAnimationVC new];
    [self.navigationController pushViewController:mAVC animated:YES];
    
    // forin 里面删减数组元素, 必须加break
    for (NSString *str in arr) {
        if ([str isEqualToString:@"002"]) {
            [arr addObject:@"004"];// 不加break会崩溃
            //*** Terminating app due to uncaught exception 'NSGenericException', reason: '*** Collection <__NSArrayM: 0x600000255f00> was mutated while being enumerated.'
            
            
            break; //必须加break, 否则崩溃
        }
    }
    
    // 不会崩溃
    for (int i = 0; i < arr.count; i++) {
        NSString *str = arr[i];
        if ([str isEqualToString:@"002"]) {
            [arr addObject:@"005"];
        }
    }
    
    // enum不会崩溃
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:@"002"]) {
            [arr addObject:@"006"];
            *stop = YES;
        }
    }];
    
    NSLog(@"😁= %@", arr);
    return;
    
   
    //[self setupTitleView];

//    return;
//
//    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"start😁", @"带萨克", @"大", @"撒大大撒娇",@"非常愿意啊啊啊",@"demo",@"带回家萨克", @"结束", @"end", @"end", @"end", @"end"]];
//    _tView = [[XGTagView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 1) tagArray:arr];
//    _tView.isCanSelect = YES;
//    _tView.delegate = self;
//    _tView.lastBtnBottomBlock = ^(CGFloat lastBtnBottom) {
//        NSLog(@"lastBtnBottom=== > %f", lastBtnBottom);
//    };
//    _tView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:_tView];
//    return;
    
    
//    UILabel *label = [[UILabel alloc] init];
//    label.backgroundColor = [UIColor redColor];
//    label.textColor = [UIColor whiteColor];
//    label.layer.cornerRadius = 15;
//    label.clipsToBounds = YES;
//    label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:label];
//    label.text = @"  1  ";
//    [label mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.height.mas_equalTo(30);
//    }];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        label.text = @"   385   ";
//        if (label.text.length > 1) {
//
//            [label mas_updateConstraints:^(MASConstraintMaker *make) {
//                //make.width.mas_equalTo(40);
//            }];
//        }
//    });
    

    
  
//    return;
    

    DottView *dLine = [[DottView alloc] initWithFrame:CGRectMake(20, 20, 2, 200)];
    dLine.backgroundColor = [UIColor clearColor];
    [self.view addSubview:dLine];

    WeightItemView *V = [[WeightItemView alloc] initWithFrame:CGRectMake(10, 100, 200, 40)];
    V.selColor = [UIColor greenColor];
    V.itemLabel.text = @"   BMI";
    V.backgroundColor = [UIColor clearColor];
    [self.view addSubview:V];
    
    WeightItemView *V2 = [[WeightItemView alloc] initWithFrame:CGRectMake(10, 160, 120, 40)];
    V2.selColor = [UIColor redColor];
    V2.itemLabel.text = @"   体重";
    V2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:V2];
    
}

#pragma mark - 目录
- (NSArray *)menus {
    if (!_menus) {
        _menus = @[@"NSCharacterSet",
                   @"masonry布局使用动画",
                   @"YYLabel标签",
                   @"普通标签",
                   @"tableView展开收缩",
                   @"UISCrollView滚动区域自适应",
                   @"半圆环形",
                   @"底部弹出",
                   @"UICollectionView横线滚动自适应",
        @"UIView随手势滑动"];
    }
    return _menus;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.menus.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:iden];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.menus[indexPath.row];
    if ([self.menus[indexPath.row] isEqualToString:@"UIView随手势滑动"]) {
        cell.detailTextLabel.text = @"仿QQ音乐播放界面弹出效果";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *cellStr = self.menus[indexPath.row];
    UIViewController *superVC = nil;
    
    if ([cellStr isEqualToString:@"NSCharacterSet"]) {
        superVC = [NSCharacterSetStudyVC new];
    }
    
    else if ([cellStr isEqualToString:@"masonry布局使用动画"]) {
        superVC = [MasonryAnimationVC new];
    }
    
    else if ([cellStr isEqualToString:@"YYLabel标签"]) {
        superVC = [YYViewController new];
    }

    else if ([cellStr isEqualToString:@"普通标签"]){
        superVC = [TagViewController new];
    }
    
    else if ([cellStr isEqualToString:@"tableView展开收缩"]) {
        superVC = [TableViewExpandVC new];
    }
    
    else if ([cellStr isEqualToString:@"UISCrollView滚动区域自适应"]) {
        superVC = [UISrolViewController new];
    }
    else if ([cellStr isEqualToString:@"半圆环形"]) {
        superVC = [HalfCircleVC new];
    }
    else if ([cellStr isEqualToString:@"底部弹出"]) {
        superVC = [BottomOutVC new];
    }
    else if ([cellStr isEqualToString:@"UICollectionView横线滚动自适应"]) {
        superVC = [UICollectionViewVC new];
    }
    else if ([cellStr isEqualToString:@"UIView随手势滑动"]) {
        superVC = [SlideDemoViewController new];
    }
    if (superVC) {
        [self.navigationController pushViewController:superVC animated:YES];
    }
        
}



- (void)getLastBtnBottom:(CGFloat)bottom {
    [_tView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(bottom);
    }];
}


/** 创建title视图 */
-(void)setupTitleView
{
    
    NSMutableArray * titleArr = [NSMutableArray arrayWithObjects:@"OC",
                 @"Java",
                 @"JavaScript",
                 @"jQuery113",
                 @"Python",
                 @"都是语言",
                 @"我都不会",
                 @"CF最牛rrr看看",
                 @"CF最牛X",
                 @"我都会",
                 @"都是电脑语言",
                 @"PHP",
                 @"网站开发",
                 @"Object-C",nil];
    //拿到屏幕的宽
    CGFloat kScreenW = 200;//[UIScreen mainScreen].bounds.size.width;
    
    //间距
    CGFloat padding = 10;
    
    CGFloat titBtnX = 10;
    CGFloat titBtnY = 100;
    CGFloat titBtnH = 40;
    
    for (int i = 0; i < titleArr.count; i++) {
        UIButton *titBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置按钮的样式
        titBtn.backgroundColor = [UIColor yellowColor];
        [titBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        titBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [titBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        titBtn.tag = 1000+i;
        [titBtn addTarget:self action:@selector(titBtnClike:) forControlEvents:UIControlEventTouchUpInside];
       
        
        //计算文字大小
        CGSize titleSize = [titleArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, titBtnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titBtn.titleLabel.font} context:nil].size;
        CGFloat titBtnW = titleSize.width + 2 * padding;
        //判断按钮是否超过屏幕的宽
        if ((titBtnX + titBtnW) > kScreenW) {
            titBtnX = 10;
            titBtnY += titBtnH + padding;
        }
        //设置按钮的位置
        titBtn.frame = CGRectMake(titBtnX, titBtnY, titBtnW, titBtnH);
        
        titBtnX += titBtnW + padding;
        
        // 圆角
        titBtn.layer.cornerRadius = titBtn.frame.size.height / 2.f;
        titBtn.layer.masksToBounds = YES;
        // 边框
        titBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        titBtn.layer.borderWidth = 0.5;
        [self.view addSubview:titBtn];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


