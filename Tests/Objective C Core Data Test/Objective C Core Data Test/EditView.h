//
//  EditView.h
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "EditEmployee.h"


@interface EditView : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UITextField *departmentName;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

- (IBAction)doneButtonPressed:(id)sender;

@property NSArray *companyNamesArray;
@property NSArray *departmentNamesArray;

@property NSArray *allEmployeesArray;
@property NSInteger flag;


@end
