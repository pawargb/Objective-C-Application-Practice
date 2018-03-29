//
//  ViewController.h
//  Table View Nevigation via Seqgue and data pass
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property NSArray *day;

@property NSString *selectedValue;
@property NextViewController *nvc;



@end

