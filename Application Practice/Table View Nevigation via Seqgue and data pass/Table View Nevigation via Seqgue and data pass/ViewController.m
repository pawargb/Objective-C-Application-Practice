//
//  ViewController.m
//  Table View Nevigation via Seqgue and data pass
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.day=@[@"Mon",@"Tues",@"Wedn",@"Thur",@"Fri",@"Sat", @"Sun"];
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.day.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text=[self.day objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Row Selected");
    
    //UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    self.selectedValue=[self.day objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"NextViewController" sender:indexPath];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NextViewController *nvc;
    if (self.nvc==nil) {
        self.nvc=segue.destinationViewController;
        self.nvc.selectedValue=self.selectedValue;
        NSLog(@"Condition is true");
    } else {
        self.nvc.selectedValue=self.selectedValue;
        NSLog(@"Condition is false %@",self.nvc.selectedValue);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
