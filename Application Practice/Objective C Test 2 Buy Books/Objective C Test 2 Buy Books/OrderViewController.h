//
//  OrderViewController.h
//  Objective C Test 2 Buy Books
//
//  Created by Ganesh Balaji Pawar on 31/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *FinalOrderBooksNames;
@property NSMutableArray *FinalOrderBooksPrices;
@property int total;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
