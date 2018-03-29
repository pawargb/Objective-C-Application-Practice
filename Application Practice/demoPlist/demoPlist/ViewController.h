//
//  ViewController.h
//  demoPlist
//
//  Created by Ganesh Balaji Pawar on 28/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSArray *Recipes;
@property NSArray *PreparationTime;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;



@end

