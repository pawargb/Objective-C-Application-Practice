//
//  ViewController.h
//  Objective C Session
//
//  Created by Student016 on 16/01/18.
//  Copyright (c) 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *myNames;
@property NSMutableArray *myDates;
@property NSMutableArray *myEmails;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

