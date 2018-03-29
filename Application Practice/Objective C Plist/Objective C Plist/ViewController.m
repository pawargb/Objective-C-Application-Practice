//
//  ViewController.m
//  Objective C Plist
//
//  Created by Ganesh Balaji Pawar on 25/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *pathForResource=[[NSBundle mainBundle]pathForResource:@"FoodItemList" ofType:@"plist"];
    NSDictionary *myDictionary=[NSDictionary dictionaryWithContentsOfFile:pathForResource];
    
    self.recipeList=[myDictionary objectForKey:@"RecipeName"];
    self.preparationTime=[myDictionary objectForKey:@"PreparationTime"];
    
    NSLog(@"%@",self.recipeList);
    
    NSLog(@"%@",self.preparationTime);
    
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    //To adjust height and width of tableview according to content
    self.myTableView.rowHeight=UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight=300;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recipeList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text=[self.recipeList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.preparationTime objectAtIndex:indexPath.row];
    
    //UIImage *myImage=[UIImage imageNamed:@"Imagename"]'
    //cell.imageView.image=myImage;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
