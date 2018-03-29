//
//  EditEmployee.h
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EditEmployee : UIViewController

@property NSArray *employeeArray;

@property NSManagedObject *obj;

@property (weak, nonatomic) IBOutlet UITextField *employeeID;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UITextField *departmentName;
- (IBAction)updateButtonPressed:(id)sender;


@end
