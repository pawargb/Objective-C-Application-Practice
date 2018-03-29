//
//  CreateDepartmentVC.m
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 25/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "CreateDepartmentVC.h"

@interface CreateDepartmentVC ()

@end

@implementation CreateDepartmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCompanyNames];
    
    
    self.companyName.delegate=self;
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    self.pickerView.showsSelectionIndicator=YES;
    self.toolBar.hidden=YES;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerViewArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerViewArray objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.companyName.text=[self.pickerViewArray objectAtIndex:row];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.pickerView.hidden=NO;
    self.toolBar.hidden=NO;
}

- (IBAction)doneButtonPressed:(id)sender {
    self.pickerView.hidden=YES;
    self.toolBar.hidden=YES;
    
}

- (IBAction)createButtonPressed:(id)sender {
    
    NSError *error=nil;
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:context];
    
    [object setValue:[NSNumber numberWithInt:[self.departmentID.text intValue]] forKey:@"departmentID"];
    [object setValue:self.departmentName.text forKey:@"departmentName"];
    [object setValue:self.companyName.text forKey:@"companyName"];
    
    
    @try{
        [context save:&error];
        if (error==nil) {
            [self presentAlert];
        }
    }@catch(NSException *exception){
        NSLog(@"Error : %@",error);
        NSLog(@"Exception : %@", exception);
    }
    
}

-(void)getCompanyNames{
    
    NSError *error=nil;
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Company" inManagedObjectContext:context];
    
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSArray *allObjects=[context executeFetchRequest:request error:&error];
    
    if (allObjects.count>0) {
        self.pickerViewArray=[allObjects valueForKey:@"companyName"];
    }
    
}

-(void)presentAlert{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Success" message:@"Department created." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {nil;}];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
