//
//  ViewController.h
//  TabCounter
//
//  Created by Ganesh Balaji Pawar on 16/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic)int i;
@property (weak, nonatomic) IBOutlet UILabel *Label;

- (IBAction)Decrement:(id)sender;
- (IBAction)Increment:(id)sender;

@end

