//
//  ViewController.m
//  Objective C Animation App
//
//  Created by Ganesh Balaji Pawar on 26/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)MoveBall:(id)sender {
    
    UIButton *button=sender;
    
    switch (button.tag) {
        case 1:
            [self moveBallTopLeft];
            break;
        case 2:
            [self moveBallUp];
            break;
        case 3:
            [self moveBallTopRight];
            break;
        case 4:
            [self moveBallLeft];
            break;
        case 5:
            [self moveBallToCenter];
            break;
        case 6:
            [self moveBallRight];
            break;
        case 7:
            [self moveBallBottomLeft];
            break;
        case 8:
            [self moveBallDown];
            break;
        case 9:
            [self moveBallBottomRight];
            break;
        default:
            break;
    }
    
}

-(CGFloat)checkLeftBoundry:(CGFloat)X{
    
    if ((X-100)<0) {
        return 0;
    }
    return (X-100);
}

-(CGFloat)checkRightBoundry:(CGFloat)X{
    
    if ((X+100+134)>self.view.frame.size.width) {
        return self.view.frame.size.width-134;
    }
    return (X+100);
}

-(CGFloat)checkTopBoundry:(CGFloat)Y{
    
    if ((Y-100)<0) {
        return 0;
    }
    return Y-100;
}

-(CGFloat)checkBottomBoundry:(CGFloat)Y{
    
    if ((Y+100+131+150)>self.view.frame.size.height) {
        return self.view.frame.size.height-281;
    }
    return Y+100;
}

-(void)moveBallTopLeft{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.ballImage.frame=CGRectMake([self checkLeftBoundry:self.ballImage.frame.origin.x], [self checkTopBoundry:self.ballImage.frame.origin.y], self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved Top Left...hurreeyyyy");
    }];
}

-(void)moveBallUp{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    
        self.ballImage.frame=CGRectMake(self.ballImage.frame.origin.x,[self checkTopBoundry:self.ballImage.frame.origin.y], self.ballImage.frame.size.width, self.ballImage.frame.size.height);

    } completion:^(BOOL finished) {
        NSLog(@"Ball moved up...hurreeyyyy");
    }];
}

-(void)moveBallTopRight{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.ballImage.frame=CGRectMake([self checkRightBoundry:self.ballImage.frame.origin.x], [self checkTopBoundry:self.ballImage.frame.origin.y], self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved Top Right...hurreeyyyy");
    }];
}

-(void)moveBallLeft{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.ballImage.frame=CGRectMake([self checkLeftBoundry:self.ballImage.frame.origin.x], self.ballImage.frame.origin.y, self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved left...hurreeyyyy");
    }];
}

-(void)moveBallToCenter{
    CGFloat windowWidthCenter=(self.view.frame.size.width/2)-65;
    CGFloat windowHeightCenter=(self.view.frame.size.height/2)-65;
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.ballImage.frame=CGRectMake(windowWidthCenter, windowHeightCenter, self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved right...hurreeyyyy");
    }];
}


-(void)moveBallRight{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.ballImage.frame=CGRectMake([self checkRightBoundry:self.ballImage.frame.origin.x], self.ballImage.frame.origin.y, self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved right...hurreeyyyy");
    }];
}


-(void)moveBallDown{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.ballImage.frame=CGRectMake(self.ballImage.frame.origin.x, [self checkBottomBoundry:self.ballImage.frame.origin.y], self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved down...hurreeyyyy");
    }];
}

-(void)moveBallBottomLeft{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.ballImage.frame=CGRectMake([self checkLeftBoundry:self.ballImage.frame.origin.x], [self checkBottomBoundry:self.ballImage.frame.origin.y], self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved Top Right...hurreeyyyy");
    }];
}

-(void)moveBallBottomRight{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.ballImage.frame=CGRectMake([self checkRightBoundry:self.ballImage.frame.origin.x], [self checkBottomBoundry:self.ballImage.frame.origin.y], self.ballImage.frame.size.width, self.ballImage.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"Ball moved Top Right...hurreeyyyy");
    }];
}


@end
