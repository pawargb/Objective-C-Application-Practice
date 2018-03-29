//
//  SearchResultVC.h
//  Objective C Nearby Locations
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestVC.h"

@interface SearchResultVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property NSString *stringURL;
@property NSArray *myAllDataArray;

@property NSMutableArray *namesArray;
@property NSMutableArray *ratingArray;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
