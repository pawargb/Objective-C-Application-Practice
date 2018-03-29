//
//  ViewController.h
//  Objective C Core data CRUD
//
//  Created by Ganesh Balaji Pawar on 21/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
- (IBAction)SaveBT:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property NSMutableArray *firstNameArray;
@property NSMutableArray *lastNameArray;

@property NSArray *allObjects;

@end

