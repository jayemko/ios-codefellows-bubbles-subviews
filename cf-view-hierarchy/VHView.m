//
//  VHView.m
//  cf-view-hierarchy
//
//  Created by Jason Koceja on 9/12/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "VHView.h"

@implementation VHView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self setBackgroundColor:[UIColor redColor]];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
//    int i = arc4random() % 100;
    CGFloat random = 1 * .20;
    CGContextSetAlpha(ctx, random);
    CGContextFillPath(ctx);
    
}

@end
