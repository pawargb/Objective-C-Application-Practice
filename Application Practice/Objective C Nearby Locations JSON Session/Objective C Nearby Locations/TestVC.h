//
//  TestVC.h
//  Objective C Nearby Locations
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *placeNamelabel;

@property NSDictionary *dictionary;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;

@end
