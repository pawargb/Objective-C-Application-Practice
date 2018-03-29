//
//  ViewController.h
//  Objective C Plist
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSArray *recipeList;
@property NSArray *preparationTime;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

