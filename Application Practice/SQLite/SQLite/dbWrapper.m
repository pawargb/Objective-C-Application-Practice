//
//  dbWrapper.m
//  SQLite
//
//  Created by Student P_10 on 09/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import "dbWrapper.h"

@implementation dbWrapper
+(instancetype)getSharedObject
{
    static dbWrapper *sharedObj;
    if(sharedObj==nil)
    {
        sharedObj=[[dbWrapper alloc]init];
        
    }
    return sharedObj;
}

-(NSString *)getDatabasePath
{
    NSArray *dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[dirPath lastObject]stringByAppendingString:@"/myDatabase.sqlite"];
    return path;
}

-(BOOL)executeQuery:(NSString *)query
{
    BOOL success=NO;
    sqlite3_stmt *stmt=NULL;
    const char *cQuery=[query UTF8String];
    const char *cPath=[[self getDatabasePath]UTF8String];
    if(sqlite3_open(cPath, &taskDatabase)==SQLITE_OK)
    {
        if (sqlite3_prepare(taskDatabase, cQuery, -1, &stmt, nil)==SQLITE_OK) {
            if (sqlite3_step(stmt)==SQLITE_DONE) {
                success=YES;
            }
            else
            {
                NSLog(@"Error in execute:%s",sqlite3_errmsg(taskDatabase));
            }
            
            }
        else
        {
            NSLog(@"Error in open:%s",sqlite3_errmsg(taskDatabase));
        }
        sqlite3_finalize(stmt);
        sqlite3_close(taskDatabase);
    }
        return success;
        
    
}
-(void)getAllTasks:(NSString *)query
{
    const char *cQuery=[query UTF8String];
    const char *cPath=[[self getDatabasePath]UTF8String];
     sqlite3_stmt *stmt=NULL;
    if (sqlite3_open(cPath, &taskDatabase)==SQLITE_OK) {
        if (sqlite3_prepare(taskDatabase, cQuery, -1, &stmt, nil)==SQLITE_OK) {
            while (sqlite3_step(stmt)==SQLITE_ROW) {
                const unsigned char *taskname=sqlite3_column_text(stmt,1);
                NSLog(@"%s",taskname);
            }
        }
        else
        {
            NSLog(@"Error in prepare:%s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in open:%s",sqlite3_errmsg(taskDatabase));
    }
}
    
-(void)createTable
    {
    NSString *query=@"create table if not exists tasktable(taskId text,taskName text)";
        bool isSuccess=[self executeQuery:query];
        if (isSuccess==YES)
        {
            NSLog(@"Table created");
        }
    }

@end
