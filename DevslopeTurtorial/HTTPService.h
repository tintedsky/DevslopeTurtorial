//
//  HTTPService.h
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-10-24.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import <Foundation/Foundation.h>

//Here we define a block, like a function pointer in C.
typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMsg);

@interface HTTPService : NSObject
+ (id)instance;
- (void)getTutorials:(nullable onComplete)completionHandler;
@end
