//
//  ViewController.m
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-10-24.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[HTTPService instance] getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMsg) {
        if (dataDict){
            NSLog(@"Dictionary: %@", dataDict.debugDescription);
        }else if (errMsg){
            //
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
