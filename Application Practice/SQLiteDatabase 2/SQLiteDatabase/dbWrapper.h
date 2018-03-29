//
//  dbWrapper.h
//  SQLiteDatabase
//
//  Created by Student P_10 on 12/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>
@interface dbWrapper : NSObject

{
    sqlite3 *taskDatabase;
}

+(instancetype)getSharedObject;
@property NSMutableArray *tnameArray;
@property NSMutableArray *tIdarray;

-(void)createTable;
-(BOOL)executeQuery:(NSString *)query;
-(void)getAllTask:(NSString *)query;

@end
