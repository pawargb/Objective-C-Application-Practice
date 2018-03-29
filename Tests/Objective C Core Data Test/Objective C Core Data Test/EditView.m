//
//  EditView.m
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "EditView.h"

@interface EditView ()

@end

@implementation EditView

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.departmentName=[[NSMutableArray alloc]init];
    
    self.pickerView.hidden=YES;
    self.toolBar.hidden=YES;
    self.myTableView.hidden=YES;
    
    self.companyName.delegate=self;
    self.departmentName.delegate=self;
    
    self.flag=0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allEmployeesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //cell.accessoryType=UITableViewCellAccessoryDetailButton;
    cell.textLabel.text=[[self.allEmployeesArray objectAtIndex:indexPath.row] valueForKey:@"firstName"];
    //cell.detailTextLabel.text=[[self.allEmployeesArray objectAtIndex:indexPath.row] valueForKey:@"employeeID"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditEmployee *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"myEditEmployee"];
    nvc.obj=[self.allEmployeesArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:nvc animated:YES];
}

- (IBAction)doneButtonPressed:(id)sender {
    if (self.flag == 1) {
        [self getDepartmentList];
        self.pickerView.hidden=YES;
        self.toolBar.hidden=YES;
        [self.pickerView reloadAllComponents];
    }else{
        [self getEmployees];
        
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        
        [self.myTableView reloadData];
        
        self.myTableView.hidden = NO;
        self.pickerView.hidden=YES;
        self.toolBar.hidden=YES;
        
    }
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.pickerView.hidden=NO;
    self.toolBar.hidden=NO;
    if (textField == self.companyName) {
        [self getCompanyNames];
        self.pickerView.delegate=self;
        self.pickerView.dataSource=self;
        self.flag = 1;
    } else {
        self.flag = 0;
        [self getDepartmentList];
        [self.pickerView reloadAllComponents];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (self.flag == 1) {
        return self.companyNamesArray.count;
    } else {
        return self.departmentNamesArray.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (self.flag == 1) {
        //NSLog(@"%@",[[self.companyNamesArray objectAtIndex:row] valueForKey:@"companyName"]);
        return [[self.companyNamesArray objectAtIndex:row] valueForKey:@"companyName"];
    } else {
        return [[self.departmentNamesArray objectAtIndex:row] valueForKey:@"departmentName"];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.flag == 1) {
        self.companyName.text=[[self.companyNamesArray objectAtIndex:row] valueForKey:@"companyName"];;
    } else {
        self.departmentName.text=[[self.departmentNamesArray objectAtIndex:row] valueForKey:@"departmentName"];;
    }
}

-(void)getDepartmentList{
    NSError *error;
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *moc=delegate.persistentContainer.viewContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Department" inManagedObjectContext:moc];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    [request setPredicate:[NSPredicate predicateWithFormat:@"companyName == %@",self.companyName.text]];
    
    self.departmentNamesArray=[moc executeFetchRequest:request error:&error];
    
    NSLog(@"%@",self.departmentNamesArray);
    
}

// To Do - Coding Improvement - only fetch those recording which are required
-(void)getCompanyNames{

    NSError *error=nil;
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Company" inManagedObjectContext:context];

    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];

    self.companyNamesArray=[context executeFetchRequest:request error:&error];
    
    NSLog(@"%@",self.companyNamesArray);
    
}

-(void)getEmployees{
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *moc=delegate.persistentContainer.viewContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:moc];
    
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    
    [request setEntity:entity];
    [request setPredicate:[NSPredicate predicateWithFormat:@"departmentName == %@ AND companyName == %@",self.departmentName.text,self.companyName.text]];
    NSError *error=nil;
    self.allEmployeesArray=[moc executeFetchRequest:request error:&error];
    
    NSLog(@"Employees : %@",self.allEmployeesArray);
    
}

//
//NSString *firstName = @"Trevor";
//[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"firstName == %@", firstName]];


@end
