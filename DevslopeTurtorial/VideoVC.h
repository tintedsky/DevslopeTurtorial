//
//  VideoVC.h
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-11-01.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;
@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;
@end
