//
//  ViewController.m
//  Segue Nevigation
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
    self.data=@"Hello";
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"NextViewController"]) {
        NextViewController *nvc=segue.destinationViewController;
        nvc.data=self.data;
        NSLog(@"NVC Value : %@",nvc.data);
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
