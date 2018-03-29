//
//  MyTableViewCell.h
//  Objective C Session
//
//  Created by Student016 on 16/01/18.
//  Copyright (c) 2018 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *myNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *myEmailLabel;
@property (strong, nonatomic) IBOutlet UILabel *myDateLabel;
@property (strong, nonatomic) IBOutlet UIView *myCell;

@end
