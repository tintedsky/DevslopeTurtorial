//
//  HTTPService.m
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-10-24.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService
+ (id)instance{
    static HTTPService *sharedInstance = nil; //static function only executed once.
    
    @synchronized (self) {
        if(!sharedInstance){ // if (sharedInsance == nil)
            //Rather than using [HTTPService alloc], we use and should use [self alloc] inside class methods.
            sharedInstance = [[self alloc]init];
        }
    }
    
    return sharedInstance;
}

-(void)test{
    NSLog(@"This is a test!");
}
@end
