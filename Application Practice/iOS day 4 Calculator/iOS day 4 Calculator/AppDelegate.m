//
//  AppDelegate.m
//  iOS day 4 Calculator
//
//  Created by Ganesh Balaji Pawar on 23/11/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.number1=0;
    self.number2=0;
    self.counter=0;
    self.number3Float=0;
    self.lableHistrotyTitle=@"";
    self.precesion=false;
    

    CGFloat cellHeight=[UIScreen mainScreen].bounds.size.height/6;
    CGFloat cellWidth=[UIScreen mainScreen].bounds.size.width/4;
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *newViewController=[[UIViewController alloc]init];
    self.window.rootViewController=newViewController;
    
    //row 1
    self.labelHistrory=[[UILabel alloc]init];
    self.labelHistrory.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, cellHeight);
    self.labelHistrory.backgroundColor=[UIColor grayColor];
    [newViewController.view addSubview:self.labelHistrory];
    //row 2
    self.label=[[UILabel alloc]init];
    self.label.frame=CGRectMake(0, cellHeight, [UIScreen mainScreen].bounds.size.width, cellHeight);
    self.label.backgroundColor=[UIColor lightGrayColor];
    self.label.text=@"0";
    
    self.label.textAlignment=NSTextAlignmentRight;
    [newViewController.view addSubview:self.label];
    //row 3
    self.button7=[[UIButton alloc]init];
    self.button7.frame=CGRectMake(0, cellHeight*2, cellWidth, cellHeight);
    self.button7.backgroundColor=[UIColor whiteColor];
    [self.button7 setTitle:@"7" forState:UIControlStateNormal];
    self.button7.tag=7;
    [self.button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button7.layer.borderWidth=0.3f;
    self.button7.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button7 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button7];
    
    self.button8=[[UIButton alloc]init];
    [self.button8 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    self.button8.frame=CGRectMake(cellWidth, cellHeight*2, cellWidth, cellHeight);
    self.button8.backgroundColor=[UIColor whiteColor];
    [self.button8 setTitle:@"8" forState:UIControlStateNormal];
    self.button8.tag=8;
    [self.button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button8.layer.borderWidth=0.3f;
    self.button8.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button8 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button8];
    
    self.button9=[[UIButton alloc]init];
    self.button9.frame=CGRectMake(cellWidth*2, cellHeight*2, cellWidth, cellHeight);
    self.button9.backgroundColor=[UIColor whiteColor];
    [self.button9 setTitle:@"9" forState:UIControlStateNormal];
    self.button9.tag=9;
    [self.button9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button9.layer.borderWidth=0.3f;
    self.button9.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button9 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button9];
    
    self.buttonDivision=[[UIButton alloc]init];
    self.buttonDivision.frame=CGRectMake(cellWidth*3, cellHeight*2, cellWidth, cellHeight);
    self.buttonDivision.backgroundColor=[UIColor colorWithRed:1.00 green:0.60 blue:0.00 alpha:1.0];
    [self.buttonDivision setTitle:@"/" forState:UIControlStateNormal];
    self.buttonDivision.tag=11;
    self.buttonDivision.layer.borderWidth=0.3f;
    self.buttonDivision.layer.borderColor=[UIColor blackColor].CGColor;
    [self.buttonDivision addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.buttonDivision];
    //row 4
    self.button4=[[UIButton alloc]init];
    self.button4.frame=CGRectMake(0, cellHeight*3, cellWidth, cellHeight);
    self.button4.backgroundColor=[UIColor whiteColor];
    [self.button4 setTitle:@"4" forState:UIControlStateNormal];
    self.button4.tag=4;
    [self.button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button4.layer.borderWidth=0.3f;
    self.button4.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button4 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button4];
    
    self.button5=[[UIButton alloc]init];
    self.button5.frame=CGRectMake(cellWidth, cellHeight*3, cellWidth, cellHeight);
    self.button5.backgroundColor=[UIColor whiteColor];
    [self.button5 setTitle:@"5" forState:UIControlStateNormal];
    self.button5.tag=5;
    [self.button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button5.layer.borderWidth=0.3f;
    self.button5.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button5 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button5];
    
    self.button6=[[UIButton alloc]init];
    self.button6.frame=CGRectMake(cellWidth*2, cellHeight*3, cellWidth, cellHeight);
    self.button6.backgroundColor=[UIColor whiteColor];
    [self.button6 setTitle:@"6" forState:UIControlStateNormal];
    self.button6.tag=6;
    [self.button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button6.layer.borderWidth=0.3f;
    self.button6.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button6 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button6];
    
    self.buttonSubstraction=[[UIButton alloc]init];
    self.buttonSubstraction.frame=CGRectMake(cellWidth*3, cellHeight*3, cellWidth, cellHeight);
    self.buttonSubstraction.backgroundColor=[UIColor colorWithRed:1.00 green:0.60 blue:0.00 alpha:1.0];
    [self.buttonSubstraction setTitle:@"-" forState:UIControlStateNormal];
    self.buttonSubstraction.tag=12;
    self.buttonSubstraction.layer.borderWidth=0.3f;
    self.buttonSubstraction.layer.borderColor=[UIColor blackColor].CGColor;
    [self.buttonSubstraction addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.buttonSubstraction];
    //row 5
    self.button1=[[UIButton alloc]init];
    self.button1.frame=CGRectMake(0, cellHeight*4, cellWidth, cellHeight);
    self.button1.backgroundColor=[UIColor whiteColor];
    [self.button1 setTitle:@"1" forState:UIControlStateNormal];
    self.button1.tag=1;
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button1.layer.borderWidth=0.3f;
    self.button1.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button1 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button1];
    
    self.button2=[[UIButton alloc]init];
    self.button2.frame=CGRectMake(cellWidth, cellHeight*4, cellWidth, cellHeight);
    self.button2.backgroundColor=[UIColor whiteColor];
    [self.button2 setTitle:@"2" forState:UIControlStateNormal];
    self.button2.tag=2;
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button2.layer.borderWidth=0.3f;
    self.button2.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button2 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button2];
    
    self.button3=[[UIButton alloc]init];
    self.button3.frame=CGRectMake(cellWidth*2, cellHeight*4, cellWidth, cellHeight);
    self.button3.backgroundColor=[UIColor whiteColor];
    [self.button3 setTitle:@"3" forState:UIControlStateNormal];
    self.button3.tag=3;
    [self.button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button3.layer.borderWidth=0.3f;
    self.button3.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button3 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button3];
    
    self.buttonAdd=[[UIButton alloc]init];
    self.buttonAdd.frame=CGRectMake(cellWidth*3, cellHeight*4, cellWidth, cellHeight);
    self.buttonAdd.backgroundColor=[UIColor colorWithRed:1.00 green:0.60 blue:0.00 alpha:1.0];
    [self.buttonAdd setTitle:@"+" forState:UIControlStateNormal];
    self.buttonAdd.tag=13;
    self.buttonAdd.layer.borderWidth=0.3f;
    self.buttonAdd.layer.borderColor=[UIColor blackColor].CGColor;
    [self.buttonAdd addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.buttonAdd];
    //row 6
    self.buttonClear=[[UIButton alloc]init];
    self.buttonClear.frame=CGRectMake(0, cellHeight*5, cellWidth, cellHeight);
    self.buttonClear.backgroundColor=[UIColor whiteColor];
    [self.buttonClear setTitle:@"AC" forState:UIControlStateNormal];
    self.buttonClear.tag=14;
    [self.buttonClear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.buttonClear.layer.borderWidth=0.3f;
    self.buttonClear.layer.borderColor=[UIColor blackColor].CGColor;
    [self.buttonClear addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.buttonClear];
    
    self.button0=[[UIButton alloc]init];
    self.button0.frame=CGRectMake(cellWidth, cellHeight*5, cellWidth, cellHeight);
    self.button0.backgroundColor=[UIColor whiteColor];
    [self.button0 setTitle:@"0" forState:UIControlStateNormal];
    self.button0.tag=0;
    [self.button0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button0.layer.borderWidth=0.3f;
    self.button0.layer.borderColor=[UIColor blackColor].CGColor;
    [self.button0 addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.button0];
    
    self.buttonDot=[[UIButton alloc]init];
    self.buttonDot.frame=CGRectMake(cellWidth*2, cellHeight*5, cellWidth, cellHeight);
    self.buttonDot.backgroundColor=[UIColor whiteColor];
    [self.buttonDot setTitle:@"." forState:UIControlStateNormal];
    self.buttonDot.tag=15;
    [self.buttonDot setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.buttonDot.layer.borderWidth=0.3f;
    self.buttonDot.layer.borderColor=[UIColor blackColor].CGColor;
    [self.buttonDot addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.buttonDot];
    
    self.buttonResult=[[UIButton alloc]init];
    self.buttonResult.frame=CGRectMake(cellWidth*3, cellHeight*5, cellWidth, cellHeight);
    self.buttonResult.backgroundColor=[UIColor colorWithRed:1.00 green:0.60 blue:0.00 alpha:1.0];
    [self.buttonResult setTitle:@"=" forState:UIControlStateNormal];
    self.buttonResult.tag=16;
    self.buttonResult.layer.borderWidth=0.3f;
    self.buttonResult.layer.borderColor=[UIColor blackColor].CGColor;
    [self.buttonResult addTarget:self action:@selector(performOperation:) forControlEvents:UIControlEventTouchUpInside];
    [newViewController.view addSubview:self.buttonResult];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)performOperation:(UIButton *)sender {
    
    //NSLog(@"performOperation called %ld",(long)sender.tag);
    if (sender.tag==14) {  //clear all or AC pressed
        self.counter=0;
        self.number1=0;
        self.number2=0;
        self.number3Float=0;
        self.label.text=@"0";
        self.labelHistrory.text=@"";
        self.lableHistrotyTitle=@"";
        self.precesion=false;
    }else if (sender.tag==16) { // result or = pressed
        
        if ([self.choosenOperation isEqualToString:@"add"]) {
            self.add;
        }else if ([self.choosenOperation isEqualToString:@"sub"]) {
            self.sub;
        }else{
            self.div;
        }
        
        if (self.precesion) {
            self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:[NSString stringWithFormat:@"%.2f", self.number2]];
            
        }else{
            self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:[NSString stringWithFormat:@"%.f", self.number2]];
        }
        self.updateLabelHistrory;
        self.number2=0;
    
    }else if (sender.tag==11 || sender.tag==12 || sender.tag==13) {///,-,+ clicked
        
            if (self.counter==0 || self.counter==1) {
                self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)self.number1]];
            }
            self.counter=3;
            //in case user doesn't hit "=" after entering 2 numbers and instead he/she hits "+,/,-" to continue operation with rest number Ex. 1+2+3+4+5 and at the end hits "="
            if (self.number2!=0) {
                self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)self.number2]];
                self.updateLabelHistrory;
                if ([self.choosenOperation isEqualToString:@"add"]) {
                    self.add;
                }else if ([self.choosenOperation isEqualToString:@"sub"]) {
                    self.sub;
                }else{
                    self.div;
                }
        }
        
        //NSLog(@"%@",self.lableHistrotyTitle);
        
        if (sender.tag==11) {
            self.choosenOperation=@"div";
            self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:@"/"];
        }else if (sender.tag==12){
            self.choosenOperation=@"sub";
            self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:@"-"];
        }else{
            self.choosenOperation=@"add";
            self.lableHistrotyTitle=[self.lableHistrotyTitle stringByAppendingString:@"+"];
        }
        NSLog(@"%@",self.lableHistrotyTitle);
        //self.updateLabelHistrory;
        
    }else if (self.counter==0) {
        
        self.number1=sender.tag;
        self.label.text=[NSString stringWithFormat:@"%ld", (long)self.number1];
        self.counter+=1;
        
    }else if (self.counter==1){
       
        self.number1=(self.number1*10) + sender.tag;
        self.label.text=[NSString stringWithFormat:@"%ld", (long)self.number1];
        
    }else if (self.counter==3) {
        
        self.number2=sender.tag;
        self.label.text=[NSString stringWithFormat:@"%ld", (long)self.number2];
        self.counter+=1;
        
    }else if (self.counter==4){
        
        self.number2=(self.number2*10) + sender.tag;
        self.label.text=[NSString stringWithFormat:@"%ld", (long)self.number2];
        
    }
    
    NSLog(@"COunter : %ld",(long)self.counter);
}

- (void)updateLabelHistrory{
    self.labelHistrory.text=self.lableHistrotyTitle;
}

- (void)add{
    if (self.precesion) {
        self.label.text=[NSString stringWithFormat:@"%.2f", self.number1+=self.number2];
    }else{
        self.label.text=[NSString stringWithFormat:@"%.f", self.number1+=self.number2];
    }
    //self.number2=0;
}

- (void)sub{
    if(self.precesion){
        self.label.text=[NSString stringWithFormat:@"%.2f", self.number1-=self.number2];
    }else{
        self.label.text=[NSString stringWithFormat:@"%.f", self.number1-=self.number2];
    }
    //self.number2=0;
}

- (void)div{
    
    if ( ( (int)self.number1 % (int)self.number2 ) !=0 ) {
        
        self.number3Float=self.number1/=self.number2;
        NSLog(@"%.2f",self.number3Float);
        self.label.text=[NSString stringWithFormat:@"%.2f", self.number3Float];
        self.precesion=true;
        
    }else{
        self.label.text=[NSString stringWithFormat:@"%.f", self.number1/=self.number2];
    }
    //self.number2=0;
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
