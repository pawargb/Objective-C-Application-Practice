//
//  ViewController.m
//  SQLiteDatabase
//
//  Created by Student P_10 on 12/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.taskNameArray=[[NSMutableArray alloc]init];
    self.taskIdArray=[[NSMutableArray alloc]init];
    
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    [[dbWrapper getSharedObject] getAllTask:selectQuery];
    
    self.taskNameArray=[[dbWrapper getSharedObject] tnameArray];
    self.taskIdArray=[[dbWrapper getSharedObject] tIdarray];
    
    if(self.taskNameArray.count >0)
    {
        [self.taskTableView reloadData];
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.taskNameArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.taskIdArray objectAtIndex:indexPath.row];
   // NSLog(@"%@",[self.taskIdArray objectAtIndex:indexPath.row]);
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    EditDeleteViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"EditDeleteViewController"];
    
    vc.myTaskName=cell.textLabel.text;
    vc.myTaskID=cell.detailTextLabel.text;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.taskNameArray=[[NSMutableArray alloc]init];
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    [[dbWrapper getSharedObject] getAllTask:selectQuery];
    self.taskNameArray=[[dbWrapper getSharedObject] tnameArray];
    
    if(self.taskNameArray.count >0)
    {
        [self.taskTableView reloadData];
    }
    
    
}

- (IBAction)insertButton:(id)sender {
    
    NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    [self.navigationController pushViewController:nvc animated:YES];
    
}
@end
