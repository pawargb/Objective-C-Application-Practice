//
//  ViewController.m
//  Objective C Alert
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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//below method is not from apple liabraty
-(void)showAlertWithTitle:(NSString *)title andWwithMessage:(NSString *)message{
   
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    //when you add textfields, it gets added into array so when you want to access values you can use array index instead of text field name ex. alert.textFields objectAtIndex:0].text
    
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){//closure
        
        NSLog(@"%@",[alert.textFields objectAtIndex:0].text);
        
    }];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){nil;}];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.secureTextEntry=YES;//for password
    }];
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)AlertButtonPressed:(id)sender {
    [self showAlertWithTitle:@"Alert Title" andWwithMessage:@"This is alert Message."];
}
@end
