//
//  ViewController.h
//  Objective C Test 2 Buy Books
//
//  Created by Ganesh Balaji Pawar on 29/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property NSArray *BooksNamesArray;
@property NSArray *BooksPriceArray;
@property NSMutableArray *orderBooksNames;
@property NSMutableArray *orderBooksPrice;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

- (IBAction)buyButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

