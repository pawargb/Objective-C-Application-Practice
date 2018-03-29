//
//  DBWrapper.m
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "DBWrapper.h"

@implementation DBWrapper

+(instancetype)getSharedObject{
    static DBWrapper *sharedObject;
    if (sharedObject == nil) {
        sharedObject = [[DBWrapper alloc]init];
    }
    return sharedObject;
}

-(void)createTable{
    NSString *query = @"create table if not exists tasktable(scheduleName text primary key, roomName text, applianceName text, time text, day text, status text)";
    BOOL isSuccess = [self executeQuery:query];
    if (isSuccess) {
        NSLog(@"Table Created");
    }
}

-(void)getAllEvents{
    
    NSString *query = @"select * from tasktable";
    const char *cQuery = [query UTF8String];
    const char *cPath = [[self getDatabasePath] UTF8String];
    sqlite3_stmt *stmt = NULL;
    
    if (sqlite3_open(cPath, &taskDatabase) == SQLITE_OK) {
        if (sqlite3_prepare(taskDatabase, cQuery, -1, &stmt, nil) == SQLITE_OK) {
            
            self.eventData = [[NSMutableArray alloc]init];
            
            while (sqlite3_step(stmt) == SQLITE_ROW) {

                Schedule *obj = [[Schedule alloc]init];
                
                obj.eventName = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 0)];
                obj.room = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 1)];
                obj.appliances = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 2)];
                obj.eventTime = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 3)];
                obj.eventDays = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 4)];
                obj.EventStatus = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 5)];
                
                [self.eventData addObject:obj];
            }
        }else{
            NSLog(@"Error while preparing stmt : %s",sqlite3_errmsg(taskDatabase));
        }
    }else{
        NSLog(@"Error while opening connection with DB : %s",sqlite3_errmsg(taskDatabase));
    }
    
}

-(NSString *)getDatabasePath{
    NSArray *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[dirPath lastObject]stringByAppendingString:@"/myDatabase.sqlite"];
    return  path;
}

-(BOOL)executeQuery:(NSString *)query{
    BOOL success = NO;
    sqlite3_stmt *stmt = NULL;
    
    const char *cQuery = [query UTF8String];
    const char *cPath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(cPath, &taskDatabase) == SQLITE_OK) {
        if (sqlite3_prepare(taskDatabase, cQuery, -1, &stmt, nil) == SQLITE_OK) {
            if (sqlite3_step(stmt) == SQLITE_DONE) {
                success = YES;
            }else{
                NSLog(@"Error in execute %s", sqlite3_errmsg(taskDatabase));
                success = NO;
            }
        }else{
            success = NO;
            NSLog(@"Error in open : %s",sqlite3_errmsg(taskDatabase));
        }
        sqlite3_finalize(stmt);
        sqlite3_close(taskDatabase);
    }
    
    return success;
}


@end
