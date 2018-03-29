//
//  NextViewController.h
//  Table View Nevigation via Seqgue and data pass
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController

@property NSString *selectedValue;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)changeColorButtonPressed:(id)sender;


@end
