//
//  AppDelegate.m
//  Roshani_Calculator
//
//  Created by Ganesh Balaji Pawar on 25/11/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CGFloat cellHeight=[UIScreen mainScreen].bounds.size.height/5;
    CGFloat cellWidth=[UIScreen mainScreen].bounds.size.width/4;
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.myViewController=[[UIViewController alloc]init];
    self.window.rootViewController=self.myViewController;
    
    self.textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,cellHeight)];
    self.textField.layer.borderWidth=1;
    self.textField.layer.borderColor=[UIColor blackColor].CGColor;
    self.textField.backgroundColor=[UIColor whiteColor];
    [self.myViewController.view addSubview:self.textField];
    
    
    self.button7=[[UIButton alloc]initWithFrame:CGRectMake(0, cellHeight,  cellWidth, cellHeight)];
    self.button7.backgroundColor=[UIColor lightGrayColor];
    [self.button7 setTitle:@"7" forState:UIControlStateNormal];
     [self.button7 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button7];
    
    self.button8=[[UIButton alloc]initWithFrame:CGRectMake(cellWidth, cellHeight, cellWidth, cellHeight)];
    self.button8.backgroundColor=[UIColor lightGrayColor];
    [self.button8 setTitle:@"8" forState:UIControlStateNormal];
     [self.button8 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button8];
    
    self.button9=[[UIButton alloc]initWithFrame:CGRectMake(2*cellWidth, cellHeight, cellWidth, cellHeight)];
    self.button9.backgroundColor=[UIColor lightGrayColor];
    [self.button9 setTitle:@"9" forState:UIControlStateNormal];
     [self.button9 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button9];
    
    self.buttonDiv=[[UIButton alloc]initWithFrame:CGRectMake(3*cellWidth,cellHeight , cellWidth, cellHeight)];
    self.buttonDiv.backgroundColor=[UIColor lightGrayColor];
    [self.buttonDiv setTitle:@"/" forState:UIControlStateNormal];
     [self.buttonDiv addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.buttonDiv];
    
    
    self.button4=[[UIButton alloc]initWithFrame:CGRectMake(0, 2*cellHeight, cellWidth, cellHeight)];
    self.button4.backgroundColor=[UIColor lightGrayColor];
    [self.button4 setTitle:@"4" forState:UIControlStateNormal];
     [self.button4 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button4];
    
    self.button5=[[UIButton alloc]initWithFrame:CGRectMake(cellWidth, 2*cellHeight, cellWidth, cellHeight)];
    self.button5.backgroundColor=[UIColor lightGrayColor];
    [self.button5 setTitle:@"5" forState:UIControlStateNormal];
     [self.button5 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button5];
    
    
    self.button6=[[UIButton alloc]initWithFrame:CGRectMake(2*cellWidth, 2*cellHeight, cellWidth, cellHeight)];
    self.button6.backgroundColor=[UIColor lightGrayColor];
    [self.button6 setTitle:@"6" forState:UIControlStateNormal];
     [self.button6 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button6];
    
    self.buttonMul=[[UIButton alloc]initWithFrame:CGRectMake(3*cellWidth, 2*cellHeight, cellWidth, cellHeight)];
    self.buttonMul.backgroundColor=[UIColor lightGrayColor];
    [self.buttonMul setTitle:@"*" forState:UIControlStateNormal];
     [self.buttonMul addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.buttonMul];
    
    
    self.button1=[[UIButton alloc]initWithFrame:CGRectMake(0, 3*cellHeight, cellWidth, cellHeight)];
    self.button1.backgroundColor=[UIColor lightGrayColor];
    [self.button1 setTitle:@"1" forState:UIControlStateNormal];
     [self.button1 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button1];
    
    self.button2=[[UIButton alloc]initWithFrame:CGRectMake(cellWidth, 3*cellHeight, cellWidth, cellHeight)];
    self.button2.backgroundColor=[UIColor lightGrayColor];
    [self.button2 setTitle:@"2" forState:UIControlStateNormal];
     [self.button2 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button2];
    
    
    self.button3=[[UIButton alloc]initWithFrame:CGRectMake(2*cellWidth, 3*cellHeight, cellWidth, cellHeight)];
    self.button3.backgroundColor=[UIColor lightGrayColor];
    [self.button3 setTitle:@"3" forState:UIControlStateNormal];
     [self.button3 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button3];
    
    self.buttonSub=[[UIButton alloc]initWithFrame:CGRectMake(3*cellWidth, 3*cellHeight, cellWidth, cellHeight)];
    self.buttonSub.backgroundColor=[UIColor lightGrayColor];
    [self.buttonSub setTitle:@"-" forState:UIControlStateNormal];
     [self.buttonSub addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.buttonSub];
    
    
    
    self.buttonClear=[[UIButton alloc]initWithFrame:CGRectMake(0, 4*cellHeight, cellWidth, cellHeight)];
    self.buttonClear.backgroundColor=[UIColor lightGrayColor];
    [self.buttonClear setTitle:@"AC" forState:UIControlStateNormal];
     [self.buttonClear addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.buttonClear];
    
    self.button0=[[UIButton alloc]initWithFrame:CGRectMake(cellWidth, 4*cellHeight, cellWidth, cellHeight)];
    self.button0.backgroundColor=[UIColor lightGrayColor];
    [self.button0 setTitle:@"0" forState:UIControlStateNormal];
     [self.button0 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.button0];
    
    
    self.buttonEqual=[[UIButton alloc]initWithFrame:CGRectMake(2*cellWidth, 4*cellHeight, cellWidth, cellHeight)];
    self.buttonEqual.backgroundColor=[UIColor lightGrayColor];
    [self.buttonEqual setTitle:@"=" forState:UIControlStateNormal];
     [self.buttonEqual addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.buttonEqual];
    
    self.buttonAdd=[[UIButton alloc]initWithFrame:CGRectMake(3*cellWidth, 4*cellHeight, cellWidth, cellHeight)];
    self.buttonAdd.backgroundColor=[UIColor lightGrayColor];
    [self.buttonAdd setTitle:@"+" forState:UIControlStateNormal];
    [self.buttonAdd addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [self.myViewController.view addSubview:self.buttonAdd];
    
    
    
    
    
    
    
    
    
   [ self.window makeKeyAndVisible];
    
    return YES;
}

-(void)performOperation:(UIButton *)sender
{
    NSLog(@"Method called");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
