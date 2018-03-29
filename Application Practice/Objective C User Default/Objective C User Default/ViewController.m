//
//  ViewController.m
//  Objective C User Default
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.days=@[@"A", @"B", @"C", @"D"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveData:(id)sender {
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults setObject:self.textField1.text forKey:@"name"];
    [defaults setObject:self.days forKey:@"array"];
    //defaults=self.days;
}

- (IBAction)loadData:(id)sender {
    
    //self.textField2.text=
    self.myNewArray=[[NSUserDefaults standardUserDefaults]valueForKey:@"array"];
    NSLog(@"%@",self.myNewArray);
    
    self.textField2.text=self.myNewArray[0];
    
}
@end
