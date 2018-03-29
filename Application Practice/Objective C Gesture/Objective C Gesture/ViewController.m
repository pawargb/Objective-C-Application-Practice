//
//  ViewController.m
//  Objective C Gesture
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
    
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap)];
    [self.view addGestureRecognizer:singleTap];
    
    UISwipeGestureRecognizer *rightSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwap)];
    [rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:rightSwipe];
    
    UISwipeGestureRecognizer *leftSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:leftSwipe];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)singleTap{
    NSLog(@"singleTap method called");
    
}

-(void)rightSwap{
    
    NSLog(@"rightSwap method called");
}

-(void)leftSwipe{
    
    ViewControllerTwo *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerTwo"];
    [self.navigationController pushViewController:nvc animated:YES];
    
    NSLog(@"leftSwipe method called");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
