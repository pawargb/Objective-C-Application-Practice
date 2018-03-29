//
//  ViewController.h
//  Objective C Table View Nevigation with data
//
//  Created by Ganesh Balaji Pawar on 23/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property NSArray *days;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

