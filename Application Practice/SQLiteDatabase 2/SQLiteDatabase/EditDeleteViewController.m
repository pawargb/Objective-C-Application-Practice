//
//  EditDeleteViewController.m
//  SQLiteDatabase
//
//  Created by Ganesh Balaji Pawar on 13/01/18.
//  Copyright © 2018 prashant. All rights reserved.
//

#import "EditDeleteViewController.h"

@interface EditDeleteViewController ()

@end

@implementation EditDeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.taskName.text=self.myTaskName;
    self.taskID.text=self.myTaskID;
    
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

- (IBAction)updateButtonPressed:(UIButton *)sender {
    
    NSString *query=[NSString stringWithFormat:@"update taskTable set taskName='%@' where taskId='%@'",self.taskName.text,self.taskID.text];
    
    bool isSucess=[[dbWrapper getSharedObject] executeQuery:query];
    if(isSucess==YES)
    {
        NSLog(@"Table updated");
    }
    
    //taskTable(taskId,taskName)
    
}

- (IBAction)deleteButtonPressed:(UIButton *)sender {
    
    NSString *query=[NSString stringWithFormat:@"delete from tasktable where taskId='%@'",self.taskID.text];
    
    bool isSucess=[[dbWrapper getSharedObject] executeQuery:query];
    if(isSucess==YES)
    {
        NSLog(@"Table updated");
    }
    
}
@end
