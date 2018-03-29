//
//  ViewController.m
//  HeaderFooter
//
//  Created by Ganesh Balaji Pawar on 30/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.games = [[NSMutableArray alloc] init];
    
    NSArray *indoor = @[@"candycrush",@"chess",@"carrom"];
    NSDictionary *indoorGames = @{@"games" : indoor};
    NSArray *outdoor = @[@"Tennis", @"Cricket",@"Football"];
    NSDictionary *outdoorGames = @{@"games" : outdoor};
    
    
    [self.games addObject:indoorGames];
    [self.games addObject:outdoorGames];

    // Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return self.games.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dictionary = self.games[section];
    NSArray *array = dictionary[@"games"];
    return [array count];
    
    
    // return self.games.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dictionary = self.games[indexPath.section];
    //  NSArray *array = dictionary[@"games"];
    // NSString *cellvalue = array[indexPath.row];
    
    // cell.textLabel.text = cellvalue;
    
    cell.textLabel.text=[self.games objectAtIndex:indexPath.row];
    
    return cell;
    

    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 50)];
    sectionHeaderView.backgroundColor = [UIColor cyanColor];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(15, 15, sectionHeaderView.frame.size.width, 25)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setFont:[UIFont fontWithName:@"Verdana" size:20.0]];
    [sectionHeaderView addSubview:headerLabel];
    
    switch (section) {
        case 0:
            headerLabel.text = @"Indoor";
            return sectionHeaderView;
            break;
        case 1:
            headerLabel.text = @"Outdoor";
            return sectionHeaderView;
            break;
            
        default:
            break;
    }
    
    return sectionHeaderView;
    
}


//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
    //UIImage *myImage = [UIImage imageNamed:@"gradient.png"];
   // UIImageView *imageView = [[UIImageView alloc] initWithImage:abc];
  //  imageView.frame = CGRectMake(10,10,1,30);
    
    // return imageView;
   // return 1;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
