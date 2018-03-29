//
//  CreateEmployeeVC.m
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 25/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "CreateEmployeeVC.h"

@interface CreateEmployeeVC ()

@end

@implementation CreateEmployeeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.flag=0;
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    self.pickerView.showsSelectionIndicator=YES;
    
    self.deptName.delegate=self;
    self.companyName.delegate=self;
    
    self.pickerView.hidden=YES;
    self.toolBar.hidden=YES;
    
    //[self fetchCompanyNames];
    self.deptNamesArray=[[NSMutableArray alloc]init];
    [self fetchCompanyAndDeptNames];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField==self.companyName) {
        self.flag=1;
    }else{
        self.flag=0;
    }
    
    self.pickerView.hidden=NO;
    self.toolBar.hidden=NO;
    [self.pickerView reloadAllComponents];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (self.flag==1) {
        return self.companyNamesArray.count;
    }else{
        return self.deptNamesArray.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (self.flag==1) {
       return [self.companyNamesArray objectAtIndex:row];
    }else{
        return [self.deptNamesArray objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (self.flag==1) {
        self.companyName.text=[self.companyNamesArray objectAtIndex:row];
        
        for (NSManagedObject *obj in self.allObjects) {
            if ([self.companyName.text isEqualToString: [obj valueForKey:@"companyName"]] ) {
                [self.deptNamesArray addObject: [obj valueForKey:@"DepartmentName"]];
            }
        }
        
    }else{
        self.deptName.text=[self.deptNamesArray objectAtIndex:row];
    }
}

- (IBAction)doneButtonPressed:(id)sender {
    self.pickerView.hidden=YES;
    self.toolBar.hidden=YES;
}

- (IBAction)createButtonPressed:(id)sender {
    
    NSError *error;
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    
    [object setValue:[NSNumber numberWithInt:[self.empID.text intValue]] forKey:@"employeeID"];
    [object setValue:self.empFirstName.text forKey:@"firstName"];
    [object setValue:self.empLastName.text forKey:@"lastName"];
    [object setValue:self.companyName.text forKey:@"companyName"];
    [object setValue:self.deptName.text forKey:@"departmentName"];
    
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

-(void)presentAlert{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Success" message:@"Employee created." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
        self.empID.text=@"";
        self.empFirstName.text=@"";
        self.empLastName.text=@"";
        self.deptName.text=@"";
        self.companyName.text=@"";
        
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)fetchCompanyAndDeptNames{
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Department" inManagedObjectContext:context];
    
    [request setEntity:entity];
    NSError *error;
//    NSPredicate *namePredicate=[NSPredicate predicateWithFormat:@"(companyName contains[cd] %@)",@"Infosys"];
//    [request setPredicate:namePredicate];
    self.allObjects=[context executeFetchRequest:request error:&error];
    
    //NSArray *filteredArray=[self.allObjects filteredArrayUsingPredicate:namePredicate];
    
    if (self.allObjects.count>0) {
        
//        self.deptNamesArray=[allObjects valueForKey:@"departmentName"];
        self.companyNamesArray=[self.allObjects valueForKey:@"companyName"];
    }
    
    
    NSLog(@"%@",self.allObjects);
    
}

@end
