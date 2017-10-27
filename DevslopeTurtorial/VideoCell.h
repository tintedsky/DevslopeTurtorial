//
//  VideoCell.h
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-10-26.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void)configureCell:(nonnull Video*)video;
@end
