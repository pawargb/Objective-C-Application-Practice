//
//  MyCustomCell.m
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 14/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.layer.cornerRadius = 20;
    
    self.contentView.layer.shadowOffset = CGSizeMake(2.0f, 4.0f);
    self.contentView.layer.shadowOpacity = 0.5f;
    self.contentView.layer.shadowRadius = 1.0f;
    self.contentView.layer.masksToBounds = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)eventStatus:(UIButton *)sender {
    NSLog(@"eventStatus button pressed");
}
@end
