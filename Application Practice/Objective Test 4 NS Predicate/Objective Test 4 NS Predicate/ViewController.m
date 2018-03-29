//
//  ViewController.m
//  Objective Test 4 NS Predicate
//
//  Created by Ganesh Balaji Pawar on 31/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.recipeListArray=@[@"Poha",@"Upama",@"Idali",@"Shira",@"Dosa",@"Uthappa"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.resultArray.count<1) {
        return self.recipeListArray.count;
    } else {
        return self.resultArray.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (self.resultArray.count<1) {
        cell.textLabel.text=[self.recipeListArray objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text=[self.resultArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchTextField:(id)sender {
    UITextField *SearchTxtField=sender;
    
    NSPredicate *myNSPredicate=[NSPredicate predicateWithFormat:@"self contains[cd] %@",SearchTxtField.text];
    self.resultArray=[self.recipeListArray filteredArrayUsingPredicate:myNSPredicate];
    [self.myTableView reloadData];
    
}
@end
