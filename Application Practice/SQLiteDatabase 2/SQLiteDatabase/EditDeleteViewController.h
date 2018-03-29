//
//  EditDeleteViewController.h
//  SQLiteDatabase
//
//  Created by Ganesh Balaji Pawar on 13/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"

@interface EditDeleteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *taskID;
@property (weak, nonatomic) IBOutlet UITextField *taskName;

- (IBAction)updateButtonPressed:(UIButton *)sender;
- (IBAction)deleteButtonPressed:(UIButton *)sender;

@property NSString *myTaskID;
@property NSString *myTaskName;

@end
