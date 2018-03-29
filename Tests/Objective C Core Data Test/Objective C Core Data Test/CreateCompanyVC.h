//
//  CreateCompanyVC.h
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 25/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface CreateCompanyVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *companyIDTF;
@property (weak, nonatomic) IBOutlet UITextField *companyNameTF;
- (IBAction)createComapnyButtonPressed:(id)sender;

@end
