//
//  ViewController.h
//  Objective C User Default
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

- (IBAction)saveData:(id)sender;
- (IBAction)loadData:(id)sender;

@property NSArray *days;
@property NSArray *myNewArray;

@end

