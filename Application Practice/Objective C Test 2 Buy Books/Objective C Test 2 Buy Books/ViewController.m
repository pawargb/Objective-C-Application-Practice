//
//  ViewController.m
//  Objective C Test 2 Buy Books
//
//  Created by Ganesh Balaji Pawar on 29/12/17.
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
    
    self.BooksNamesArray=@[@"A",@"B",@"C",@"D",@"E"];
    self.BooksPriceArray=@[@"1",@"2",@"3",@"4",@"5"];
    
    self.orderBooksNames=[[NSMutableArray alloc]init];
    self.orderBooksPrice=[[NSMutableArray alloc]init];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.BooksNamesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text=[self.BooksNamesArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[@"Rs. " stringByAppendingString:[self.BooksPriceArray objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType==UITableViewCellAccessoryCheckmark) {
        cell.accessoryType=UITableViewCellAccessoryNone;
        
        [self.orderBooksNames removeObject:[self.BooksNamesArray objectAtIndex:indexPath.row]];
        [self.orderBooksPrice removeObject:[self.BooksPriceArray objectAtIndex:indexPath.row]];
        self.myLabel.text=[[self.BooksNamesArray objectAtIndex:indexPath.row] stringByAppendingString:@" has been removed from kart."];
    } else {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        self.myLabel.text=[[self.BooksNamesArray objectAtIndex:indexPath.row] stringByAppendingString:@" has been added to kart."];
        [self.orderBooksNames addObject:[self.BooksNamesArray objectAtIndex:indexPath.row]];
        [self.orderBooksPrice addObject:[self.BooksPriceArray objectAtIndex:indexPath.row]];
    }
}

//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType=UITableViewCellAccessoryNone;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buyButtonPressed:(id)sender {
    
    OrderViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"OrderViewController"];
    
    vc.FinalOrderBooksNames=self.orderBooksNames;
    vc.FinalOrderBooksPrices=self.orderBooksPrice;

    [self.navigationController pushViewController:vc animated:YES];
}

@end
