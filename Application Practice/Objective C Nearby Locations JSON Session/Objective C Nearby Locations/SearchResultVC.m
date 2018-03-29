//
//  SearchResultVC.m
//  Objective C Nearby Locations
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "SearchResultVC.h"

@interface SearchResultVC ()

@end

@implementation SearchResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.navigationItem.title = @"Nearest Places";
    
    [self fetchDataFromURL:self.stringURL];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio{
    return self.namesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = [self.namesArray objectAtIndex:indexPath.row];
    
    if ([NSString stringWithFormat:@"%@",[self.ratingArray objectAtIndex:indexPath.row]]) {
        cell.detailTextLabel.text = @"No Rating";
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[self.ratingArray objectAtIndex:indexPath.row]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     TestVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"TestVC"];
    
    vc.dictionary=[self.myAllDataArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)fetchDataFromURL:(NSString *)stringURL{
    
        self.namesArray=[[NSMutableArray alloc]init];
        self.ratingArray=[[NSMutableArray alloc]init];
    
    NSURL *url=[NSURL URLWithString:stringURL];
    
    NSLog(@"%@",stringURL);
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        <#code#>
    }];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *myResponse=(NSHTTPURLResponse *)response;//convert NSURLResponse *response to (NSHTTPURLResponse *)response
        
        if (myResponse.statusCode==200) {
            NSLog(@"Response found");
            if (data) {
                NSDictionary *dictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                
                self.myAllDataArray=[dictionary valueForKey:@"results"];
                NSLog(@"myAllDataArray length : %ld",(unsigned long)self.myAllDataArray.count);
                if (error) {
                    NSLog(@"Error : %@",error.localizedDescription);
                    NSLog(@"error");
                }else{
                    NSLog(@"else");
                    for (NSDictionary *temp in _myAllDataArray) {
                            
                        [self.namesArray addObject:[temp valueForKey:@"name"]];
                        if ([temp valueForKey:@"rating"] == nil) {
                            [self.ratingArray addObject:@"0.0"];
                        }else{
                            [self.ratingArray addObject:[temp valueForKey:@"rating"]];
                        }
                        
                        
                        NSLog(@"%lu",(unsigned long)self.namesArray.count);
                       
                    }
                    
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        NSLog(@"in dispatch");
                        // This will be called on the main thread, so that
                        // you can update the UI, for example.
                        [self.myTableView reloadData];
                    });
                    NSLog(@"Data fetch completed.");
                    
                }
                
            }else{
                NSLog(@"Data not found");
            }
            
        } else {
            NSLog(@"Response not found");
        }
    }];
    
    
    [dataTask resume];//This method actual start execution above method, it executes completion handler else completion handler will not be called/executed
    //NSLog(@"fetchDataFromURL Completed");
}

@end
