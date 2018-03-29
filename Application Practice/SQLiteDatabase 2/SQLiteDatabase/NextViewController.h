//
//  NextViewController.h
//  SQLiteDatabase
//
//  Created by Student P_10 on 12/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"

@interface NextViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *taskIdText;
@property (strong, nonatomic) IBOutlet UITextField *taskNameText;

- (IBAction)insertButton:(id)sender;
@end
