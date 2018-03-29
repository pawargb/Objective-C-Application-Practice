//
//  ViewController.m
//  Objective C Nearby Locations
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)viewDidLoad{
    self.LocationTypes = @[@"bank", @"atm", @"hospital", @"restaurant", @"movie_theater"];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.selectedCell=nil;
    self.selectedLocationType=nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"%f",tableView.rowHeight);
//    NSLog(@"%ld",self.LocationTypes.count);
//    NSLog(@"%ld",(tableView.rowHeight * self.LocationTypes.count));
    tableView.frame = CGRectMake(16, 133, 343, tableView.contentSize.height);
    return self.LocationTypes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = [self.LocationTypes objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        if (self.selectedCell == nil) {
            self.selectedCell=cell;
        }else{
            self.selectedCell.accessoryType = UITableViewCellAccessoryNone;
            self.selectedCell = cell;
        }
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedLocationType=[self.LocationTypes objectAtIndex:indexPath.row];
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.selectedCell = nil;
        self.selectedLocationType=nil;
    }
}

//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=AIzaSyAwSuFPdZqDhpDYWumR-BxE_MPPzvhpUhI
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=AIzaSyAwSuFPdZqDhpDYWumR-BxE_MPPzvhpUhI



-(NSString *)createURL:(NSString *)type :(CGFloat)longitude :(CGFloat)latitude  {
    
    NSString *basicURL=@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?";
    NSString *LocationParameter1=[[[@"location=" stringByAppendingString:[NSString stringWithFormat:@"%f",latitude]] stringByAppendingString:@","] stringByAppendingString:[NSString stringWithFormat:@"%f", longitude]];
    NSString *raduis=@"&radius=500&";
    NSString *Locationtype=[@"type=" stringByAppendingString:type];
    NSString *key=@"&key=AIzaSyAwSuFPdZqDhpDYWumR-BxE_MPPzvhpUhI";
    
    return [[[[basicURL stringByAppendingString:LocationParameter1] stringByAppendingString:raduis]stringByAppendingString:Locationtype] stringByAppendingString:key];
}

- (IBAction)searchWithCurrentLocation:(id)sender {
    
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        //self.locationManager.distanceFilter=500;
        [self.locationManager requestWhenInUseAuthorization];
        self.locationManager.delegate=self;
        [self.locationManager startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    NSLog(@"%@",locations);
    CLLocation *currentlocation= locations.firstObject;
    [self.locationManager stopUpdatingLocation];
    
    CLLocation *currentlocation2 = [[CLLocation alloc]initWithLatitude:currentlocation.coordinate.latitude longitude:currentlocation.coordinate.longitude];

    CGFloat latitude2,longitude2;
    
    latitude2 = currentlocation2.coordinate.latitude;
    longitude2 = currentlocation2.coordinate.longitude;

    NSLog(@"latitude,longitude : %f %f",latitude2,longitude2);
    if(currentlocation2 != nil)
    {
        CGFloat latitude,longitude;
        
        latitude=currentlocation.coordinate.latitude;
        longitude=currentlocation.coordinate.longitude;
        
        NSLog(@"latitude,longitude : %f %f",latitude,longitude);
        
        if (self.selectedLocationType != nil) {
            
            SearchResultVC *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultVC"];
            vc.stringURL=[self createURL:self.selectedLocationType :longitude :latitude];
            [self.navigationController pushViewController:vc animated:YES];
        
        }else{
            [self presentAlert];
        }
        
    }
    
}

-(void)presentAlert{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Select Location" message:@"Please select location type"  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {nil;}];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
