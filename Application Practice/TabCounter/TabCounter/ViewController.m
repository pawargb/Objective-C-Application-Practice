//
//  ViewController.m
//  TabCounter
//
//  Created by Ganesh Balaji Pawar on 16/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.i=0;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Decrement:(id)sender {
    self.i--;
    [self.Label setText:[NSString stringWithFormat:@"%d",self.i]];
    
}

- (IBAction)Increment:(id)sender {
    self.i++;
    [self.Label setText:[NSString stringWithFormat:@"%d",self.i]];
}
@end
