//
//  ViewControllerTwo.m
//  Objective C Gesture
//
//  Created by Ganesh Balaji Pawar on 26/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *leftSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:leftSwipe];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftSwipe{
    ViewControllerThree *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThree"];
    [self.navigationController pushViewController:nvc animated:YES];
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
