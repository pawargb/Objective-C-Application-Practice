//
//  ViewController.m
//  demoPlist
//
//  Created by Ganesh Balaji Pawar on 28/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *pathForResource=[[NSBundle mainBundle]pathForResource:@"propertyList" ofType:@"plist"];
    NSDictionary *myDictionary=[NSDictionary dictionaryWithContentsOfFile:pathForResource];
    NSLog(@"%@",myDictionary);
    
    self.Recipes=[myDictionary objectForKey:@"Recipes"];
    self.PreparationTime=[myDictionary objectForKey:@"PreparatioinTime"];
    
    NSLog(@"Recipes:%@",self.Recipes);
    NSLog(@"PreparatioinTime :%@",self.PreparationTime);
    
    self.myTableView.rowHeight=UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight=300;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Recipes.count;
    return self.PreparationTime.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.Recipes objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.PreparationTime objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
