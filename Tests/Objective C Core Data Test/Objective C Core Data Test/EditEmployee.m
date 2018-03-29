//
//  EditEmployee.m
//  Objective C Core Data Test
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "EditEmployee.h"

@interface EditEmployee ()

@end

@implementation EditEmployee

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"%@",[[self.employeeArray objectAtIndex:0] valueForKey:@"employeeID"]);
    //NSLog(@"%@",[self.obj valueForKey:@"employeeID"]);
    self.departmentName.text=[NSString stringWithFormat:@"%@",[self.obj valueForKey:@"employeeID"]];
    self.firstName.text=[NSString stringWithFormat:@"%@",[self.obj valueForKey:@"firstName"]];
    self.lastName.text=[NSString stringWithFormat:@"%@",[self.obj valueForKey:@"lastName"] ];
    self.companyName.text=[NSString stringWithFormat:@"%@",[self.obj valueForKey:@"companyName"] ];
    self.departmentName.text=[NSString stringWithFormat:@"%@",[self.obj valueForKey:@"departmentName"] ];
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

- (IBAction)updateButtonPressed:(id)sender {
}
@end
