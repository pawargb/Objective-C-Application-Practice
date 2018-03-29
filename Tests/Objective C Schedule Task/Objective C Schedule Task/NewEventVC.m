//
//  NewEventVC.m
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "NewEventVC.h"

@interface NewEventVC ()

@end

@implementation NewEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.time = [[NSMutableString alloc]init];
    self.daysArray = [[NSMutableArray alloc]init];
    self.eventName.delegate = self;
    self.navigationItem.title = @"New Schedule";
    
    if (_editDeleteOperationFlag == 2) {
        self.eventName.text = self.eventObj.eventName;
        self.eventRoom.text = self.eventObj.room;
        self.eventAppliances.text = self.eventObj.appliances;
        
        // set date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        self.timePickerOutlet.date = [dateFormatter dateFromString:self.eventObj.eventTime];
        
        //set buttons selected
        [self.daysArray addObjectsFromArray:[self.eventObj.eventDays componentsSeparatedByString:@", "]];
        NSLog(@"days array : %@",self.daysArray);
        [self setButtonSelected:self.daysArray];
        
        self.deleteButtonOutlet.hidden = NO;
        
    }else{
        self.deleteButtonOutlet.hidden = YES;
    }
    
    self.sunButton.layer.cornerRadius = 10;
    self.monButton.layer.cornerRadius = 10;
    self.tuesButton.layer.cornerRadius = 10;
    self.wednButton.layer.cornerRadius = 10;
    self.thuButton.layer.cornerRadius = 10;
    self.FriButton.layer.cornerRadius = 10;
    self.satButton.layer.cornerRadius = 10;
    self.updateButtonOutlet.layer.cornerRadius = 10;
    self.deleteButtonOutlet.layer.cornerRadius = 5;
    
    self.mySubView.layer.cornerRadius = 20;
    self.mySubView.layer.shadowOffset = CGSizeMake(2.0f, 4.0f);
    self.mySubView.layer.shadowOpacity = 0.5f;
    self.mySubView.layer.shadowRadius = 1.0f;
    self.mySubView.layer.masksToBounds = NO;
}


// MARK : Button Methods

- (IBAction)updateRoomButtonPressed:(UIButton *)sender {
    NSString *query;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *time = [dateFormatter stringFromDate:self.timePickerOutlet.date];
    
    if (_editDeleteOperationFlag == 1) {
        
        query=[NSString stringWithFormat:@"insert into taskTable(scheduleName, roomName, applianceName, time, day, status) values('%@','%@', '%@','%@', '%@','%@')",self.eventName.text, self.eventRoom.text, self.eventAppliances.text, time, [self.daysArray componentsJoinedByString:@", "], @"TURN ON"];
        
    } else {
        query=[NSString stringWithFormat:@"update taskTable set scheduleName='%@', roomName='%@', applianceName='%@', time='%@', day='%@', status='%@' where scheduleName='%@'",self.eventName.text, self.eventRoom.text, self.eventAppliances.text, time, [self.daysArray componentsJoinedByString:@", "], @"TURN ON",self.eventObj.eventName];
    }
//    NSString *query=[NSString stringWithFormat:@"update taskTable set taskName='%@' where taskId='%@'",self.taskName.text,self.taskID.text];
    
    BOOL isSuccess = [[DBWrapper getSharedObject] executeQuery:query];
    
    if(isSuccess==YES)
    {
        NSLog(@"Insert Success:");
    }else{
        [self presentAlert:@"Error!" withMessage:@"Event name must be unique"];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)daysButtonPressed:(id)sender {
    
    UIButton *button = sender;

    NSLog(@"%i",button.isSelected);
    
    if (!button.isSelected) {
//        button.backgroundColor = [UIColor grayColor];
        [self.daysArray addObject:button.titleLabel.text];
        button.selected = YES;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //button.backgroundColor = [UIColor colorWithRed:255 green:212 blue:121 alpha:1.0];
        button.backgroundColor = [UIColor blueColor];
    }else{
        [self.daysArray removeObject:button.titleLabel.text];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.selected = NO;
    }
    NSLog(@"%@",self.daysArray);
}

- (IBAction)dropDownButtonPressed:(UIButton *)sender {
    
    tableViewVC *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"tableViewVC"];
    
    if (sender.tag == 1) {
        nvc.flag = 1;
        self.flag = 1;
    } else {
        nvc.flag = 0;
        self.flag = 0;
    }
    
    [nvc setDelegate:self];
    [self.navigationController pushViewController:nvc animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}

// MARK : Delegate methods

-(void)sendTextBackToVC:(NSString *)value{
    if (self.flag == 1) {
        self.eventAppliances.text = value;
    } else {
        self.eventRoom.text = value;
    }
}


- (IBAction)delebuttonPressed:(UIButton *)sender {
    
    [self presentAlert:@"Please Confirm" withMessage:@"Are you sure ?"];
}

// MARK : Sub task methods

-(void)presentAlert:(NSString *)title withMessage:(NSString *)message{
    UIAlertController *alert= [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction;
    
    if ([title isEqualToString:@"Please Confirm"]) {
        okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *query=[NSString stringWithFormat:@"delete from taskTable where scheduleName='%@'",self.eventName.text];
            
            BOOL isSuccess = [[DBWrapper getSharedObject] executeQuery:query];
            
            if (isSuccess) {
                
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
    }
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)setButtonSelected:(NSArray *)selectedDaysArray{
    for (NSString *str in selectedDaysArray) {
        if ([self.sunButton.titleLabel.text isEqualToString:str]) {
            self.sunButton.selected = YES;
            self.sunButton.backgroundColor = [UIColor blueColor];
            [self.sunButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else if ([self.monButton.titleLabel.text isEqualToString:str]) {
            self.monButton.selected = YES;
            self.monButton.backgroundColor = [UIColor blueColor];
            [self.monButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else if ([self.tuesButton.titleLabel.text isEqualToString:str]) {
            self.tuesButton.selected = YES;
            self.tuesButton.backgroundColor = [UIColor blueColor];
            [self.tuesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else if ([self.wednButton.titleLabel.text isEqualToString:str]) {
            self.wednButton.selected = YES;
            self.wednButton.backgroundColor = [UIColor blueColor];
            [self.wednButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else if ([self.thuButton.titleLabel.text isEqualToString:str]) {
            self.thuButton.selected = YES;
            self.thuButton.backgroundColor = [UIColor blueColor];
            [self.thuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else if ([self.FriButton.titleLabel.text isEqualToString:str]) {
            self.FriButton.selected = YES;
            self.FriButton.backgroundColor = [UIColor blueColor];
            [self.FriButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else if ([self.satButton.titleLabel.text isEqualToString:str]) {
            self.satButton.selected = YES;
            self.satButton.backgroundColor = [UIColor blueColor];
            [self.satButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    
}

@end
