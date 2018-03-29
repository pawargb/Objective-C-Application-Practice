//
//  tableViewVC.h
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDelegate.h"

@interface tableViewVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property NSArray *rooms;
@property NSArray *appliances;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) id<MyDelegate>delegate;
@property NSInteger flag;

@end
