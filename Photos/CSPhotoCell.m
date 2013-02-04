//
//  CSPhotoCell.m
//  Photos
//
//  Created by Cameron Spickert on 2/4/13.
//  Copyright (c) 2013 Cameron Spickert. All rights reserved.
//

#import "CSPhotoCell.h"

@implementation CSPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[self bounds]];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self setImageView:imageView];
        [self addSubview:imageView];
    }
    return self;
}

@end
