//
//  dbWrapper.h
//  SQLite
//
//  Created by Student P_10 on 09/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface dbWrapper : NSObject
{
    sqlite3 *taskDatabase;
}

+(instancetype)getSharedObject;
-(BOOL)executeQuery:(NSString *)query;
-(void)createTable;
-(void)getAllTasks:(NSString *)query;

@end
