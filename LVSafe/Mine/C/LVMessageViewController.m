//
//  LVMessageViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVMessageViewController.h"
#import "LVMessageModel.h"
#import "LVMessageTableViewCell.h"

@interface LVMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *messageTableView;
    NSMutableArray *dataSource;
    
}
@end

@implementation LVMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"消息管理";
    self.view.backgroundColor=kBGWhiteColor;
    [self addLeftItemWithImageName:@"leftbackicon_white_titlebar_24x24_@2x"];
    UIBarButtonItem *rightBtn=[[UIBarButtonItem alloc] initWithTitle:@"清空消息" style:(UIBarButtonItemStylePlain) target:self action:@selector(cleanMessage)];
    [rightBtn setTitleTextAttributes:@{  //1.设置字体样式:例如黑体,和字体大小
                                        NSFontAttributeName:[UIFont systemFontOfSize:14],
                                       //2.字体颜色
                                       NSForegroundColorAttributeName:[UIColor whiteColor]} forState:(UIControlStateNormal)];
    self.navigationItem.rightBarButtonItem=rightBtn;
    
    dataSource=[NSMutableArray array];
    LVMessageModel *model=[[LVMessageModel alloc] init];
    model.userName=@"润库云";
    model.picPath=@"http://cc.cocimg.com/api/uploads/181018/739edb962e633691b323b105fbe3fe6b.jpg";
    model.message=@"这是第一次测试，不要惊讶，啥都有！1️⃣🌹😊多写点，啧啧啧啧啧啧做做做做做做做做做做做做做做做做哒哒哒哒哒哒多多多多多多多多多多";
    [dataSource addObject:model];
    [self initTableView];
}
-(void)cleanMessage{
    
}
-(void)initTableView{
    messageTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kiPhoneX_Top_Height) style:(UITableViewStylePlain)];
    [messageTableView registerNib:[UINib nibWithNibName:@"LVMessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"LVMessageTableViewCell"];
    messageTableView.backgroundColor=kBGWhiteColor;
    
    messageTableView.delegate=self;
    messageTableView.dataSource=self;
    
    messageTableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:messageTableView];
}
#pragma mark tableView delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    LVMessageModel *model=dataSource[indexPath.row];
    LVMessageTableViewCell *nocell=[tableView dequeueReusableCellWithIdentifier:@"LVMessageTableViewCell" forIndexPath:indexPath];
    [nocell showDataWithModel:model];
    cell=nocell;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (dataSource.count>0) {
        LVMessageModel *model=dataSource[indexPath.row];
        CGFloat height=[DHHleper textHeightFromTextString:model.message width:kScreenWidth-65 fontSize:17];
        return height+20;
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
