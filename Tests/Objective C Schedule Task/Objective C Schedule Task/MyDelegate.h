//
//  MyDelegate.h
//  Objective C Schedule Task
//
//  Created by Ganesh Balaji Pawar on 12/02/18.
//  Copyright © 2018 Ganesh Balaji Pawar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyDelegate <NSObject>

-(void)sendTextBackToVC:(NSString *)value;

@end
