//
//  ViewController.m
//  Objective C Test 5 Registration Form Date Picker
//
//  Created by Ganesh Balaji Pawar on 01/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data=[[NSMutableArray alloc]init];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Submit:(id)sender {
    
    if ([self.password.text isEqualToString:self.retype.text]) {
        
        [self.data addObject:self.fname.text];
        [self.data addObject:self.lname.text];
        [self.data addObject:self.contact.text];
        [self.data addObject:[NSString stringWithFormat:@"%@",self.birthdate.date]];

        [self.data addObject:self.email.text];
        [self.data addObject:self.password.text];
        
        
        
        //self.dateOrTimeLabel.text=[NSString stringWithFormat:@"%@",myDatePicker.date];
        NSLog(@"%@",self.data);
        NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
        nvc.data=self.data;
        [self.navigationController pushViewController:nvc animated:YES];
        
    } else {
        self.myLabel.text=@"Password mismatch";
    }
   
}
@end
