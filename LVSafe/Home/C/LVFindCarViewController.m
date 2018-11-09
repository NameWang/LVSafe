//
//  LVFindCarViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVFindCarViewController.h"
#import "LVFindCarModel.h"
#import "LVFindCarTableViewCell.h"

@interface LVFindCarViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UISegmentedControl *segment;
    UITableView *carListTableView;
    NSMutableArray *dataSource;
    BOOL isLogin;
    UIView *line;
}

@end

@implementation LVFindCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"全员寻车";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"sky"] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:17],   NSForegroundColorAttributeName:[UIColor whiteColor]}];
    segment=[[UISegmentedControl alloc] initWithItems:@[@"正在寻找的车辆",@"结案奖励车辆"] ];
    segment.frame=CGRectMake(0, 0, kScreenWidth, 30);
    segment.tintColor=kBGWhiteColor;
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:(UIControlEventValueChanged)];
    //设置Segment的字体
    NSDictionary *dic = @{
                          //1.设置字体样式:例如黑体,和字体大小
                        //  NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:20],
                          //2.字体颜色
                          NSForegroundColorAttributeName:[UIColor grayColor]
                          };
    
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    NSDictionary *dic2=@{  NSForegroundColorAttributeName:[UIColor blackColor]};
    [segment setTitleTextAttributes:dic2 forState:(UIControlStateSelected)];
    segment.selectedSegmentIndex=0;
    [self.view addSubview:segment];
    line=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segment.frame)-1, kScreenWidth/2, 1)];
    line.backgroundColor=[UIColor redColor];
    [self.view addSubview:line];
    //
    dataSource=[NSMutableArray array];
    [self initTableView];
    
}
-(void)segmentClick:(UISegmentedControl*)seg{
    __weak UIView *lll=line;
    __weak UISegmentedControl*sss=segment;
    if (seg.selectedSegmentIndex==0) {
        [UIView animateWithDuration:0.2 animations:^{
              lll.frame=CGRectMake(0, CGRectGetMaxY(sss.frame)-1, kScreenWidth/2, 1);
        }];
        [carListTableView reloadData];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
               lll.frame=CGRectMake(kScreenWidth/2, CGRectGetMaxY(sss.frame)-1, kScreenWidth/2, 1);
        }];
          [carListTableView reloadData];
    }
    
}
-(void)initTableView{
    carListTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segment.frame)+2, kScreenWidth, kScreenHeight-kiPhoneX_Bottom_Height-104-segment.frame.size.height) style:(UITableViewStylePlain)];
    [carListTableView registerNib:[UINib nibWithNibName:@"LVFindCarTableViewCell" bundle:nil] forCellReuseIdentifier:@"LVFindCarTableViewCell"];
    [carListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    carListTableView.backgroundColor=kBGWhiteColor;
    carListTableView.delegate=self;
    carListTableView.dataSource=self;
    carListTableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:carListTableView];
    carListTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
}
-(void)refresh{
    [carListTableView reloadData];
    [carListTableView.mj_header endRefreshing];
}
#pragma mark tableView delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    if (dataSource.count>0) {
        LVFindCarModel *model=dataSource[indexPath.row];
        LVFindCarTableViewCell *carcell=[tableView dequeueReusableCellWithIdentifier:@"LVFindCarTableViewCell" forIndexPath:indexPath];
        [carcell showDataWithModel:model];
        cell=carcell;
    }else{
        UITableViewCell *nocell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        nocell.textLabel.textAlignment=NSTextAlignmentCenter;
        
        if (segment.selectedSegmentIndex==0) {
            nocell.textLabel.text=@"当前区域没有正在寻找车辆数据！";
        }else{
               nocell.textLabel.text=@"当前区域没有结案奖励车辆数据！";
        }
        cell=nocell;
    }
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (dataSource.count>0) {
        return 90;
    }else{
        return 60;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (dataSource.count>0) {
        return dataSource.count;
    }else{
        return 1;
    }
    
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
