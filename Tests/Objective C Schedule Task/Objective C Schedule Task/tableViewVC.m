//
//  tableViewVC.m
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "tableViewVC.h"

@interface tableViewVC ()

@end

@implementation tableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rooms = @[@"Bedroom", @"Living room", @"Dining room", @"Kitchen"];
    self.appliances = @[@"Light1", @"Light2", @"Light3", @"Fan"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
 
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_flag) {
        self.navigationItem.title = @"Choose Appliances";
        return self.appliances.count;
    } else {
        self.navigationItem.title = @"Choose Room";
        return self.rooms.count;
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (_flag) {
        cell.textLabel.text = [self.appliances objectAtIndex:indexPath.section];
    } else {
        cell.textLabel.text = [self.rooms objectAtIndex:indexPath.section];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.delegate sendTextBackToVC: cell.textLabel.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
