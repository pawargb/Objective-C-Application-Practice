//
//  ViewController.h
//  Objective C Test 5 Registration Form Date Picker
//
//  Created by Ganesh Balaji Pawar on 01/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"

@interface ViewController : UIViewController

@property NSMutableArray *data;

@property (weak, nonatomic) IBOutlet UILabel *firstName;

@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *contactNo;
@property (weak, nonatomic) IBOutlet UILabel *birthDate;
@property (weak, nonatomic) IBOutlet UITextField *fname;
@property (weak, nonatomic) IBOutlet UITextField *lname;
@property (weak, nonatomic) IBOutlet UITextField *contact;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthdate;
- (IBAction)Submit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *retype;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

