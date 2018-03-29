//
//  CreateEmployeeVC.h
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 25/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
//#import "Department+CoreDataClass.h"
//#import "Department+CoreDataProperties.h"

@interface CreateEmployeeVC : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *empID;
@property (weak, nonatomic) IBOutlet UITextField *empFirstName;
@property (weak, nonatomic) IBOutlet UITextField *empLastName;
@property (weak, nonatomic) IBOutlet UITextField *deptName;
@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)createButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
- (IBAction)doneButtonPressed:(id)sender;

@property int flag;
@property NSArray *companyNamesArray;
@property NSMutableArray *deptNamesArray;
@property NSArray *allObjects;

@end
