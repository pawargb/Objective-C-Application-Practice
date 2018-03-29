//
//  DBWrapper.h
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Schedule.h"

@interface DBWrapper : NSObject
{
    sqlite3 *taskDatabase;
}

+(instancetype)getSharedObject;
-(BOOL)executeQuery:(NSString *)query;
-(void)createTable;
-(void)getAllEvents;

@property NSMutableArray *eventData;

@end
