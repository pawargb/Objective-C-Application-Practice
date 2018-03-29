//
//  dbWrapper.m
//  SQLiteDatabase
//
//  Created by Student P_10 on 12/01/18.
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

-(void)createTable
{
    NSString *query=@"create table if not exists tasktable(taskId text,taskName text)";
    bool isSucess=[self executeQuery:query];
    if(isSucess==YES)
    {
        NSLog(@"Table created");
    }
    
}

-(NSString *)getDatabasePath
{
    NSArray *dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[dirPath lastObject] stringByAppendingString:@"/myDatabase.sqlite"];
    
    return path;
    
}

-(BOOL)executeQuery:(NSString *)query
{
    BOOL success=NO;
    sqlite3_stmt *stmt = NULL;
    const char *cQuery=[query UTF8String];
    const char *cPath=[[self getDatabasePath] UTF8String];
    
    if(sqlite3_open(cPath, &taskDatabase)==SQLITE_OK)
    {
        
        if(sqlite3_prepare_v2(taskDatabase, cQuery, -1, &stmt, nil)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=YES;
            }
            else
            {
                NSLog(@"Error in execute: %s", sqlite3_errmsg(taskDatabase));
            }
        }
        else
        {
            NSLog(@"Error in prepare: %s", sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in open: %s", sqlite3_errmsg(taskDatabase));
    }
    sqlite3_finalize(stmt);
    sqlite3_close(taskDatabase);
    return success;
}

-(void)getAllTask:(NSString *)query
{
    self.tnameArray=[[NSMutableArray alloc]init];
    self.tIdarray=[[NSMutableArray alloc]init];
    
    sqlite3_stmt *stmt;
    const char *cQuery=[query UTF8String];
    const char *cPath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(cPath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, cQuery, -1, &stmt, nil)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const unsigned char *taskname= sqlite3_column_text(stmt, 1);
                
                NSString *tname=[NSString stringWithFormat:@"%s",taskname];
                [self.tnameArray addObject:tname];
                
                const unsigned char *taskID= sqlite3_column_text(stmt, 0);
                NSString *tID=[NSString stringWithFormat:@"%s",taskID];
                [self.tIdarray addObject:tID];
                //NSLog(@"%@",[self.tIdarray objectAtIndex:indexPath.row]);
            }
        }
        else
        {
            NSLog(@"Error in prepare: %s", sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in open: %s", sqlite3_errmsg(taskDatabase));
    }
    //NSLog(@"task array=%@",self.tnameArray);
}


@end

