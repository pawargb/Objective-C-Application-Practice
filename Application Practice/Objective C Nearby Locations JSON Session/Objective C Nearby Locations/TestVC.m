//
//  TestVC.m
//  Objective C Nearby Locations
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "TestVC.h"

@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url=[NSURL URLWithString:[self.dictionary valueForKey:@"icon"]];
    NSData *data=[NSData dataWithContentsOfURL:url];
    self.iconImage.image=[UIImage imageWithData:data];
    
    self.placeNamelabel.text=[self.dictionary valueForKey:@"name"];
    self.ratingLabel.text=[@"Rating : " stringByAppendingString:[NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"rating"]]];
    self.addressLabel.text=[self.dictionary valueForKey:@"vicinity"];
    self.addressTextView.text=[self.dictionary valueForKey:@"vicinity"];
    self.addressTextView.frame = CGRectMake(16, 280, self.view.bounds.size.width-32, self.addressTextView.contentSize.height);
    
    self.navigationItem.title = @"Place details";
    
}

@end
