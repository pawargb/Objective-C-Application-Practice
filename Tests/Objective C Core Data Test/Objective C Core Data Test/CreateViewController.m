//
//  CreateViewController.m
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 24/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//below method is not from apple liabraty
-(void)showAlertWithTitle:(NSString *)title andWwithMessage:(NSString *)message{
    
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //when you add textfields, it gets added into array so when you want to access values you can use array index instead of text field name ex. alert.textFields objectAtIndex:0].text
    
    UIAlertAction *createCompany=[UIAlertAction actionWithTitle:@"Create Company" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){//closure
        
        CreateCompanyVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CreateCompanyVC"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    UIAlertAction *createDepartment=[UIAlertAction actionWithTitle:@"Create Department" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        CreateDepartmentVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CreateDepartmentVC"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    UIAlertAction *createEmployee=[UIAlertAction actionWithTitle:@"Create Employee" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        CreateEmployeeVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CreateEmployeeVC"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {nil;}];
    
    [alert addAction:createCompany];
    [alert addAction:createDepartment];
    [alert addAction:createEmployee];
    [alert addAction:cancel];
    
//    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.secureTextEntry=YES;//for password
//    }];
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createButtonPressed:(id)sender {
    
    [self showAlertWithTitle:@"Choose options" andWwithMessage:@"Nothing"];
    
}
@end
