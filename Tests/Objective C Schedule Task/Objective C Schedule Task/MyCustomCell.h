//
//  MyCustomCell.h
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 14/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *meridieM;
@property (weak, nonatomic) IBOutlet UILabel *eventDaysLabel;
@property (weak, nonatomic) IBOutlet UIButton *eventStatusButtonOutlet;
- (IBAction)eventStatus:(UIButton *)sender;

@end
