//
//  CreateDepartmentVC.h
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 25/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface CreateDepartmentVC : UIViewController<UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *departmentID;
@property (weak, nonatomic) IBOutlet UITextField *departmentName;
@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property NSArray *pickerViewArray;

- (IBAction)doneButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
- (IBAction)createButtonPressed:(id)sender;

@end
