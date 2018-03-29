//
//  SecondViewController.h
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 11/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Custom Cell.h"
#import "MyCustomCell.h"
#import "Schedule.h"
#import <QuartzCore/QuartzCore.h>
#import "NewEventVC.h"
#import "DBWrapper.h"

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;
- (IBAction)addEventButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addEventButtonOutlet;


@property NSArray *eventsArray;

@end

