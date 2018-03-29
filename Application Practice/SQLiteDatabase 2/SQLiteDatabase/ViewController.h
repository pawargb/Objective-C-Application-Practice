//
//  ViewController.h
//  SQLiteDatabase
//
//  Created by Student P_10 on 12/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"
#import "NextViewController.h"
#import "EditDeleteViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (IBAction)insertButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *taskTableView;

@property NSMutableArray *taskNameArray;
@property NSMutableArray *taskIdArray;


@end

