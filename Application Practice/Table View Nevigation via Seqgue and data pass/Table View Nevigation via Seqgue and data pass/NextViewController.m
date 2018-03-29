//
//  NextViewController.m
//  Table View Nevigation via Seqgue and data pass
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end


@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myLabel.text=self.selectedValue;
    NSLog(@"%@",self.selectedValue);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeColorButtonPressed:(id)sender {
    self.view.backgroundColor=[UIColor blackColor];
}
@end
