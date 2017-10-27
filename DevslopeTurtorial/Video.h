//
//  Video.h
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-10-26.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *videoIframe;
@property (nonatomic, strong) NSString *thumbnailUrl;
@end
