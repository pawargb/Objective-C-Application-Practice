//
//  ViewController.m
//  Objective C Core data CRUD
//
//  Created by Ganesh Balaji Pawar on 21/01/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstNameArray=[[NSMutableArray alloc]init];
    self.lastNameArray=[[NSMutableArray alloc]init];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    [self.firstNameArray addObject:@"A"];
    [self.lastNameArray addObject:@"B"];
    
    [self fetch];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.firstNameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    
    cell.detailTextLabel.text=[self.firstNameArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[self.lastNameArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)fetch{
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    
    NSError *error;
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Item" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    self.allObjects=[context executeFetchRequest:request error:&error];
    
    if(self.allObjects.count>0){
        self.firstNameArray=[self.allObjects valueForKey:@"firstName"];
        self.lastNameArray=[self.allObjects valueForKey:@"lastName"];
    }
    [self.myTableView reloadData];
}

//-(void)fetch
//{

//    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    NSManagedObjectContext *context=[delegate managedObjectContext];
//    
//    NSError *error;
//    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"Item" inManagedObjectContext:context];
//    NSFetchRequest *request=[[NSFetchRequest alloc]init];
//    [request setEntity:entityDescription];
//
//    self.allObjects=[context executeFetchRequest:request error:&error];
//    if(self.allObjects.count >0)
//    {
//        self.itemNameArray=[self.allObjects valueForKey:@"itemName"];
//        self.itemRateArray=[self.allObjects valueForKey:@"itemID"];
//
//
//
//    }
//    [self.myTable reloadData];
//}


- (IBAction)SaveBT:(id)sender {
    
    NSError *error=nil;
    
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
    
    [object setValue:self.firstNameTF.text forKey:@"firstName"];
    [object setValue:self.lastNameTF.text forKey:@"lastName"];
    
    @try{
      [context save:&error];
    }
    @catch(NSException *exception){
        NSLog(@"Error : %@",error);
        NSLog(@"Error : %@",exception);
    }
    
}

@end
