//
//  main.m
//  StudentInfo
//
//  Created by Ganesh Balaji Pawar on 28/12/17.
//  Copyright © 2017 Ganesh Balaji Pawar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int rollno;
        NSMutableDictionary *abc=[[NSMutableDictionary alloc]init];
        [abc setValue:@"Rosh" forKey:@"1"];
        [abc setValue:@"Ganesh" forKey:@"2"];
        [abc setValue:@"Mayur" forKey:@"3"];
        [abc setValue:@"Pravin" forKey:@"4"];
        [abc setValue:@"Roshani" forKey:@"5"];
        NSLog(@"Enter the rollno");
        scanf("%d",&rollno);
        NSString *key=[NSString stringWithFormat:@"%d",rollno];
        NSString *name=[abc objectForKey:key];
        NSLog(@"Name of student:%@",name);
        
    }
    return 0;
}
