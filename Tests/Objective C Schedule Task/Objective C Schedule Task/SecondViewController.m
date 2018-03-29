//
//  SecondViewController.m
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 11/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addEventButtonOutlet.layer.cornerRadius = 16;
    self.addEventButtonOutlet.clipsToBounds = YES;
    
    self.addEventButtonOutlet.layer.shadowOffset = CGSizeMake(2.0f, 4.0f);
    self.addEventButtonOutlet.layer.shadowOpacity = 0.5f;
    self.addEventButtonOutlet.layer.shadowRadius = 1.0f;
    self.addEventButtonOutlet.layer.masksToBounds = NO;
    
    //[self.eventsTableView registerNib:[UINib nibWithNibName:@"UITableViewCell" bundle:nil] forCellReuseIdentifier:@"UITableViewCell"];
    
    self.eventsTableView.delegate=self;
    self.eventsTableView.dataSource=self;
    
    [[DBWrapper getSharedObject] getAllEvents];
    self.eventsArray = [DBWrapper getSharedObject].eventData;
    
    self.navigationItem.title = @"Schedules";
    
    NSLog(@"viewDidLoad");
}

-(void)viewWillAppear:(BOOL)animated{
    [[DBWrapper getSharedObject] getAllEvents];
    self.eventsArray = [DBWrapper getSharedObject].eventData;
    [self.eventsTableView reloadData];
    NSLog(@"view will appear");
}

// MARK: table view delegate and data source methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.eventsArray.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    
    [headerView setBackgroundColor:[UIColor lightGrayColor]];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCustomCell *cell=[tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Schedule *obj = [self.eventsArray objectAtIndex:indexPath.row];
    
    MyCustomCell *mycell = (MyCustomCell *)cell;
    
    mycell.eventNameLabel.text = obj.eventName;
    mycell.eventDaysLabel.text = obj.eventDays;
    if (obj.EventStatus == NO) {
        [mycell.eventStatusButtonOutlet setTitle:@"TURN OFF" forState:UIControlStateNormal];
    }else{
        [mycell.eventStatusButtonOutlet setTitle:@"TURN ON" forState:UIControlStateNormal];
    }
    
    NSArray *tempTime = [obj.eventTime componentsSeparatedByString:@" "];
    
    mycell.eventTimeLabel.text = [tempTime objectAtIndex:0];
    mycell.meridieM.text = [tempTime objectAtIndex:1];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewEventVC *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewEventVC"];
    
    nvc.editDeleteOperationFlag=2;
    nvc.eventObj = [self.eventsArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:nvc animated:YES];
}

// MARK: buttont click methods

- (IBAction)addEventButton:(id)sender {
    NSLog(@"addEventButton");
    NewEventVC *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewEventVC"];
    nvc.editDeleteOperationFlag=1;
    [self.navigationController pushViewController:nvc animated:YES];
}

@end
