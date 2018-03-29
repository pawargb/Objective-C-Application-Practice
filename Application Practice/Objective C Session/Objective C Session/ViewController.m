//
//  ViewController.m
//  Objective C Session
//
//  Created by Student016 on 16/01/18.
//  Copyright (c) 2018 Felix. All rights reserved.
//

// no delegate is required for session

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.myDates=[[NSMutableArray alloc]init];
    self.myNames=[[NSMutableArray alloc]init];
    self.myEmails=[[NSMutableArray alloc]init];
    
    NSString *str=@"https://api.github.com/repositories/19438/commits";
    NSURL *url=[NSURL URLWithString:str];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *myResponse=(NSHTTPURLResponse *)response;//convert NSURLResponse *response to (NSHTTPURLResponse *)response
        
        if (myResponse.statusCode==200) {
            NSLog(@"Response found");
            if (data) {
                NSArray *myArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                
                if (error) {
                    NSLog(@"Error : %@",error.localizedDescription);
                }else{
                    
                    for ( NSDictionary *temp in myArray) {
                        
                        [self.myEmails addObject:[[[temp valueForKey:@"commit"] valueForKey:@"committer"] valueForKey:@"email"]];
                        [self.myNames addObject:[[[temp valueForKey:@"commit"] valueForKey:@"author"] valueForKey:@"name"]];
                        [self.myDates addObject:[[[temp valueForKey:@"commit"] valueForKey:@"author"] valueForKey:@"date"] ];
                        }
                    NSLog(@"Data fetch completed.");
                    [self.myTableView reloadData];
                }
                
            }else{
                NSLog(@"Data not found");
            }
            
        } else {
            NSLog(@"Response not found");
        }
    }];
    

    [dataTask resume];//This method actual start execution above method, it executes completion handler else completion handler will not be called/executed

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",(unsigned long)self.myNames.count);
    return self.myNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    cell.myNameLabel.text=[self.myNames objectAtIndex:indexPath.row];
    cell.myDateLabel.text=[self.myDates objectAtIndex:indexPath.row];
    cell.myEmailLabel.text=[self.myEmails objectAtIndex:indexPath.row];
    
    return cell;
}

@end
