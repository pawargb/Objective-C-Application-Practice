//
//  ViewController.h
//  HeaderFooter
//
//  Created by Ganesh Balaji Pawar on 30/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *games;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;



@end

