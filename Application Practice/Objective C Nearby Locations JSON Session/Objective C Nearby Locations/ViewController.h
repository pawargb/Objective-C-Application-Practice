//
//  ViewController.h
//  Objective C Nearby Locations
//
//  Created by Ganesh Balaji Pawar on 08/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SearchResultVC.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate>

@property NSArray *LocationTypes;
@property NSMutableString *selectedLocationType;
@property CLLocationManager *locationManager;
@property UITableViewCell *selectedCell;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)searchWithCurrentLocation:(id)sender;

@end

