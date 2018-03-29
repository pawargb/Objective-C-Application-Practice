//
//  OrderViewController.m
//  Objective C Test 2 Buy Books
//
//  Created by Ganesh Balaji Pawar on 31/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    self.total=0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (self.FinalOrderBooksNames.count+1);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
    if (indexPath.row != (self.FinalOrderBooksNames.count)) {
        cell.textLabel.text=[self.FinalOrderBooksNames objectAtIndex:indexPath.row];
        cell.detailTextLabel.text=[self.FinalOrderBooksPrices objectAtIndex:indexPath.row];
        self.total = self.total+[[self.FinalOrderBooksPrices objectAtIndex:indexPath.row] intValue];
    } else {
        cell.textLabel.text=@"Total : ";
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%d", self.total];

        cell.detailTextLabel.font=[UIFont boldSystemFontOfSize:30];
        cell.textLabel.font=[UIFont boldSystemFontOfSize:30];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
