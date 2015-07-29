//
//  ViewController.m
//  DynamicCellHeight
//
//  Created by chenfeng on 15/7/29.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()
{
    NSString *_title;
    NSString *_subTitle;
    NSString *_price;
    UIImage *_image;
    UIImage *_indicateImage;
    TableViewCell *cellCache;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _title = @"没有红包的时候好难好难没有红包的时候好难好难";
    
    _subTitle = @"1没有红包的时候好难好难没有红包的时候好难好难 \
    2没有红包的时候好难好难没有红包的时候好难好难 \
    3没有红包的时候好难好难没有红包的时候好难好难 \
    4没有红包的时候好难好难没有红包的时候好难好难 \
    5没有红包的时候好难好难没有红包的时候好难好难 \
    6没有红包的时候好难好难没有红包的时候好难好难 \
    7没有红包的时候好难好难没有红包的时候好难好难 \
    8没有红包的时候好难好难没有红包的时候好难好难 \
    9没有红包的时候好难好难没有红包的时候好难好难 \
    10没有红包的时候好难好难没有红包的时候好难好难 \
    11没有红包的时候好难好难没有红包的时候好难好难 \
    12没有红包的时候好难好难没有红包的时候好难好难 \
    13没有红包的时候好难好难没有红包的时候好难好难 \
    14没有红包的时候好难好难没有红包的时候好难好难 \
    15没有红包的时候好难好难没有红包的时候好难好难 \
    16没有红包的时候好难好难没有红包的时候好难好难 \
    17没有红包的时候好难好难没有红包的时候好难好难 \
    18没有红包的时候好难好难没有红包的时候好难好难 \
    19没有红包的时候好难好难没有红包的时候好难好难 \
    20没有红包的时候好难好难没有红包的时候好难好难 \
    21没有红包的时候好难好难没有红包的时候好难好难 \
    22没有红包的时候好难好难没有红包的时候好难好难 \
    23没有红包的时候好难好难没有红包的时候好难好难 \
    24没有红包的时候好难好难没有红包的时候好难好难 \
    25没有红包的时候好难好难没有红包的时候好难好难 \
    26没有红包的时候好难好难没有红包的时候好难好难 \
    27没有红包的时候好难好难没有红包的时候好难好难 \
    28没有红包的时候好难好难没有红包的时候好难好难 ";
    
    _price = @"10元";
    _image = [UIImage imageNamed:@"@pocket"];
    _indicateImage = [UIImage imageNamed:@"@000"];
    ///缓存cell用于计算动态高度
    cellCache = [_tableview dequeueReusableCellWithIdentifier:@"cell"];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.imagev.image = _image;
    cell.indateImage.image = _indicateImage;
    cell.titleLb.text = _title;
    cell.subTitleLb.text = _subTitle;
    cell.priceLb.text = _price;
    return cell;
}
#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    ///填充cell内容
    TableViewCell *cell = cellCache;
    cell.imagev.image = _image;
    cell.indateImage.image = _indicateImage;
    cell.titleLb.text = _title;
    cell.subTitleLb.text = _subTitle;
    cell.priceLb.text = _price;
    
    ///此刻不会自动更新cell的bounds，所以手动设置cell的宽度与tableview一致
    cell.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    ///获取实时preferenceWidth
    [cell layoutIfNeeded];
    
    ///通过约束计算精确高度
    CGSize size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"height is %f ",round(size.height));
    return  round(size.height);
}

///为了使滚动性能更好而使用，但是对于动态高度，他的不精确性也会造成视图显示问题，所以以下所给的估计可以通过多个if给出一个精确cgfloat比较好
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0)
//{
//    return UITableViewAutomaticDimension;
//}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
}

-(void)updateViewConstraints
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
