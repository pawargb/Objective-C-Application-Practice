//
//  CreateCompanyVC.m
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 25/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "CreateCompanyVC.h"

@interface CreateCompanyVC ()

@end

@implementation CreateCompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createComapnyButtonPressed:(id)sender {
    
    NSError *error=nil;
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:context];
    
    [object setValue:[NSNumber numberWithInt:[self.companyIDTF.text intValue]] forKey:@"companyID"];
    [object setValue:self.companyNameTF.text forKey:@"companyName"];
    
    @try{
        [context save:&error];
        if (error==nil) {
            [self presentAlert];
        }
    }
    @catch(NSException *exception){
        NSLog(@"Error : %@",error);
        NSLog(@"Exception %@",exception);
    }
    
}

-(void)presentAlert{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Success!" message:@"Company created." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {nil;}];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//below method is not from apple liabraty
//-(void)showAlertWithTitle:(NSString *)title andWwithMessage:(NSString *)message{
//
//
//    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//
//    //when you add textfields, it gets added into array so when you want to access values you can use array index instead of text field name ex. alert.textFields objectAtIndex:0].text
//
//    UIAlertAction *createCompany=[UIAlertAction actionWithTitle:@"Create Company" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){//closure
//
//        CreateCompanyVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CreateCompanyVC"];
//        [self.navigationController pushViewController:vc animated:YES];
//
//    }];
//
//    UIAlertAction *createDepartment=[UIAlertAction actionWithTitle:@"Create Department" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
//
//        CreateDepartmentVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CreateDepartmentVC"];
//        [self.navigationController pushViewController:vc animated:YES];
//
//    }];
//
//    UIAlertAction *createEmployee=[UIAlertAction actionWithTitle:@"Create Employee" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
//
//        CreateEmployeeVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CreateEmployeeVC"];
//        [self.navigationController pushViewController:vc animated:YES];
//
//    }];
//
//    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {nil;}];
//
//    [alert addAction:createCompany];
//    [alert addAction:createDepartment];
//    [alert addAction:createEmployee];
//    [alert addAction:cancel];
//
//    //    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//    //        textField.secureTextEntry=YES;//for password
//    //    }];
//
//
//
//    [self presentViewController:alert animated:YES completion:nil];
//
//}
@end
