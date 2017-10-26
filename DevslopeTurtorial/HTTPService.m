//
//  HTTPService.m
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-10-24.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService
+ (id)instance{
    static HTTPService *sharedInstance = nil; //static function only executed once.
    
    @synchronized (self) {
        if(!sharedInstance){ // if (sharedInsance == nil)
            sharedInstance = [[self alloc]init];
        }
    }
    
    return sharedInstance;
}

-(void)getTutorials:(nullable onComplete)completionHandler{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(data){
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if(!err){
                completionHandler(json, nil);
            }else{ //When Data was failed to converted to json dictionary.
                completionHandler(nil, @"Data is corrupt. Please try again");
            }
        }else{
            NSLog(@"Network Err: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server");
        }
    }] resume];
}
@end
