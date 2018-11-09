//
//  DBManager.m
//  Legend
//
//  Created by cnelc on 15/9/30.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "DBManager.h"
#import "LVCarLocationInfoModel.h"

@implementation DBManager
{
    FMDatabase *_database;
}

+ (DBManager *)sharedManager {
      static DBManager *manager = nil;
      static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
           manager = [[self alloc] init];
    });
    
    return manager;
}
- (id)init {
    if (self = [super init]) {
        
        NSString *filePath = [self getFileFullPathWithFileName:@"peoplesafe.db"];
        _database = [[FMDatabase alloc] initWithPath:filePath];
        
        if ([_database open]) {
            [self createCarLocationInfoTable];
          
        }else {
            NSLog(@"database open failed:%@",_database.lastErrorMessage);
        }
    }
    return self;
}
#pragma mark - 获取文件的全路径
- (NSString *)getFileFullPathWithFileName:(NSString *)fileName {
    NSString *docPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:docPath]) {
        //文件的全路径
        return [docPath stringByAppendingFormat:@"/%@",fileName];
    }else {
        //如果不存在可以创建一个新的
        NSLog(@"Documents不存在");
        return nil;
    }
}
#pragma mark - 创建表
-(void)createCarLocationInfoTable{
    NSString *sql = @"create table if not exists carLocationInfos(serial integer  Primary Key Autoincrement,articleID integer,MyID integer,typeID integer)";
    //创建表 如果不存在则创建新的表
    BOOL isSuccees = [_database executeUpdate:sql];
    if (!isSuccees) {
        NSLog(@"creatTable error:%@",_database.lastErrorMessage);
    }
}
#pragma mark 增加数据
-(void)insertCarLocationDataWithNewsModelAry:(NSArray *)ary{
//    [_database beginTransaction];
//
//    BOOL isRollBack = NO;
//
//    @try {
//        for (PSCarLocationInfoModel *model in ary) {
//
//            NSString *sql = @"insert into carLocationInfos(videoId,videoTitle,playRecord,typeId,userId,dtCreate,dtUpdate,videoUrl,img,status,userName,face) values (?,?,?,?,?,?,?,?,?,?,?,?)";
//            BOOL isSuccess = [_database executeUpdate:sql,@(model.videoId),model.videoTitle,@(model.playRecord),@(model.typeId),@(model.userId),model.dtCreate,model.dtUpdate,model.videoUrl,model.img,@(model.status),model.userName,model.face];
//
//
//            if (!isSuccess) {
//                NSLog(@"insert error:%@",_database.lastErrorMessage);
//            }
//        }
//    }
//    @catch (NSException *exception) {
//        isRollBack = YES;
//        [_database rollback];
//    }
//    @finally {
//        if (!isRollBack) {
//            [_database commit];
//        }
//    }
}
#pragma mark 读取数据
//
//-(id)selectArticalReplyModelByCommentID:(NSInteger)commentID Andid:(NSInteger)ID{
//    WZJReplyModel *model=[[WZJReplyModel alloc] init];
//    NSString *sql = @"select * from articleInfos where id = ? and commentID = ?";
//    FMResultSet *rs = [_database executeQuery:sql,@(ID),@(commentID)];
//    while ([rs next]) {//id,replyID,commentID,type,text,dtTime,ip,userId,to_userid
//        model.id=[rs intForColumn:@"id"];
//        model.replyID=[rs intForColumn:@"replyID"];
//        model.commentID=[rs intForColumn:@"commentID"];
//        model.type=[rs intForColumn:@"type"];
//        model.userId=[rs intForColumn:@"userId"];
//        model.to_userid=[rs intForColumn:@"to_userid"];
//        model.text=[rs stringForColumn:@"text"];
//        model.dtTime=[rs stringForColumn:@"dtTime"];
//        model.ip=[rs stringForColumn:@"ip"];
//        model.userName=[rs stringForColumn:@"userName"];
//    }
//    return model;
//}
//-(NSArray *)readNewsDataWithTypeId:(NSInteger)typeId{
//    NSMutableArray *ary=[NSMutableArray array];
//    NSString *sql = @"select * from newsInfos where typeID = ? order by articleID desc limit 0,100";
//    FMResultSet * rs = [_database executeQuery:sql,@(typeId)];
//    //articleID,title,text,dtTime,covers,userID,typeID,typeName,num,url,userName,face
//    while ([rs next]) {
//        HNHomeNewsInfoModel *firstModel=[[HNHomeNewsInfoModel alloc] init];
//        firstModel.typeID=[rs intForColumn:@"typeID"];
//        firstModel.articleID=[rs intForColumn:@"articleID"];
//        firstModel.text=[rs stringForColumn:@"text"];
//        firstModel.userName=[rs stringForColumn:@"userName"];
//        firstModel.userID=[rs intForColumn:@"userID"];
//        firstModel.face=[rs stringForColumn:@"face"];
//        firstModel.dtTime=[rs stringForColumn:@"dtTime"];
//        firstModel.url=[rs stringForColumn:@"url"];
//        firstModel.title=[rs stringForColumn:@"title"];
//        firstModel.num=[rs intForColumn:@"num"];
//        firstModel.covers=[rs stringForColumn:@"covers"];
//        firstModel.typeName=[rs stringForColumn:@"typeName"];
//        [ary addObject:firstModel];
//    }
//    return ary;
//}
//-(int)maxVideoID{
//    NSString *sql = @"select * from videoInfos order by videoId desc limit 0,1";
//    FMResultSet * rs = [_database executeQuery:sql];
//    NSMutableArray *ary=[NSMutableArray array];
//    while ([rs next]) {
//        HNVideoListModel *firstModel=[[HNVideoListModel alloc] init];
//
//        firstModel.videoId=[rs intForColumn:@"videoId"];
//
//        [ary addObject:firstModel];
//    }
//    HNVideoListModel *firstModel=[ary firstObject];
//    return firstModel.videoId;
//}
#pragma mark 删除数据
-(void)deleteAllCarLocationData{
        NSString *sql1 = @"delete from carLocationInfos";
        BOOL isSuccess1 = [_database executeUpdate:sql1];
        if (!isSuccess1) {
            NSLog(@"delete error:%@",_database.lastErrorMessage);
        }
}

@end
