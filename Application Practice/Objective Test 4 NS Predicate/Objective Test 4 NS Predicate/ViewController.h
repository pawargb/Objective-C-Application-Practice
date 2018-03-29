//
//  ViewController.h
//  Objective Test 4 NS Predicate
//
//  Created by Ganesh Balaji Pawar on 31/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property NSArray *recipeListArray;
@property NSArray *resultArray;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)searchTextField:(id)sender;

    
@end

