//
//  NewEventVC.h
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBWrapper.h"
#import "tableViewVC.h"
#import "Schedule.h"

@interface NewEventVC : UIViewController<MyDelegate, UITextFieldDelegate>

- (IBAction)updateRoomButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *updateButtonOutlet;

- (IBAction)daysButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *eventRoom;
@property (weak, nonatomic) IBOutlet UITextField *eventAppliances;
@property NSMutableString *time;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePickerOutlet;
@property NSMutableArray *daysArray;
- (IBAction)dropDownButtonPressed:(UIButton *)sender;

@property NSInteger flag;
@property NSInteger editDeleteOperationFlag;
@property Schedule *eventObj;

@property (weak, nonatomic) IBOutlet UIButton *sunButton;
@property (weak, nonatomic) IBOutlet UIButton *monButton;
@property (weak, nonatomic) IBOutlet UIButton *tuesButton;
@property (weak, nonatomic) IBOutlet UIButton *wednButton;
@property (weak, nonatomic) IBOutlet UIButton *thuButton;
@property (weak, nonatomic) IBOutlet UIButton *FriButton;
@property (weak, nonatomic) IBOutlet UIButton *satButton;

@property (weak, nonatomic) IBOutlet UIView *mySubView;
- (IBAction)delebuttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteButtonOutlet;

@end
