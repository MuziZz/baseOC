//
//  ViewController.m
//  baseUITest
//
//  Created by 李真真(80002457) on 2019/12/18.
//  Copyright © 2019 李真真(80002457). All rights reserved.
//

#import "ViewController.h"
#import "MassonaryViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
{
    UITableView *_tableView;
    NSMutableArray *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"tableView";
    [self initTableView];
    [self initDataArr];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initTableView{
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //    [_tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DefaultCell"]; //注册cell
    [self.view addSubview:_tableView];
}
-(void)initDataArr{
    dataArr=[[NSMutableArray alloc]initWithObjects:@"massonary",@"222",@"333",@"444",@"555",@"666",nil];
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    cell.textLabel.text=dataArr[indexPath.row];
    return cell;
}
//设置组头标题
-(nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return nil;
}
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        MassonaryViewController *massonaryVC=[[MassonaryViewController alloc]init];
        [self.navigationController pushViewController:massonaryVC animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
