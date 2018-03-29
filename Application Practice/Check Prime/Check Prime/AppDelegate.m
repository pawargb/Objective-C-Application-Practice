//
//  AppDelegate.m
//  Check Prime
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
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    self.myViewController=[[UIViewController alloc]init];
    self.window.rootViewController=self.myViewController;
    
    self.button=[[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 30)];
    [self.button setTitle:@"CheckPrime" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button.layer.borderColor=[UIColor blackColor].CGColor;
    self.button.layer.borderWidth=1;
    [self.button addTarget:self action:@selector(checkPrime:) forControlEvents:UIControlEventTouchUpInside];
    
    self.textField=[[UITextField alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    self.textField.backgroundColor=[UIColor grayColor];
    
    self.Label=[[UILabel alloc]initWithFrame:CGRectMake(50, 150, 200, 30)];
    self.Label.backgroundColor=[UIColor blueColor];
    
    [self.myViewController.view addSubview:self.button];
    [self.myViewController.view addSubview:self.textField];
    [self.myViewController.view addSubview:self.Label];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(void)checkPrime:(UIButton *)sender
{
    int number,i;
    BOOL isPrime=true;
    number=(int)self.textField.text;
    for (i=2; i<=number/2; ++i) {
        if (number%i== 0) {
            isPrime=false;
            break;
        }
    }
    if (isPrime) {
        self.Label.text=@"Number is prime";
        
    }
    else
    {
        self.Label.text=@"Not prime";
    }
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
