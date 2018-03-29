//
//  AppDelegate.h
//  iOS day 4 Calculator
//
//  Created by Ganesh Balaji Pawar on 23/11/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (nonatomic) NSInteger counter;
@property (nonatomic) float number1;
@property (nonatomic) float number2;
@property (nonatomic) NSString *choosenOperation;
@property (nonatomic) NSString *lableHistrotyTitle;
@property(nonatomic) float number3Float;
@property(nonatomic) BOOL precesion;

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) UIViewController *newViewController;

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *labelHistrory;
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (strong, nonatomic) UIButton *button5;
@property (strong, nonatomic) UIButton *button6;
@property (strong, nonatomic) UIButton *button7;
@property (strong, nonatomic) UIButton *button8;
@property (strong, nonatomic) UIButton *button9;
@property (strong, nonatomic) UIButton *button0;
@property (strong, nonatomic) UIButton *buttonDot;
@property (strong, nonatomic) UIButton *buttonAdd;
@property (strong, nonatomic) UIButton *buttonMultiplication;
@property (strong, nonatomic) UIButton *buttonDivision;
@property (strong, nonatomic) UIButton *buttonSubstraction;
@property (strong, nonatomic) UIButton *buttonClear;
@property (strong, nonatomic) UIButton *buttonResult;


@end

