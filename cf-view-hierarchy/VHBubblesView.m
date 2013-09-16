//
//  VHBubblesView.m
//  cf-view-hierarchy
//
//  Created by Jason Koceja on 9/12/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "VHBubblesView.h"
#import "VHView.h"

@implementation VHBubblesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
    
    [self makeBubbles];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

- (void)orientationDidChange:(NSNotification *)note{
    NSLog(@"Device orientation: %ld", [[UIDevice currentDevice] orientation]);
    [self moveBubbles];
}

- (void)makeBubbles{
    
    CGRect screenbounds = [UIScreen mainScreen].bounds;
    int screenHeight = CGRectGetHeight(screenbounds);
    int screenWidth = CGRectGetWidth(screenbounds);
    int maxSize;
    
    if (screenHeight>screenWidth){
        maxSize = screenWidth;
    }else{
        maxSize = screenHeight;
    }
    
    // use a loop to create a bunch of VHViews
    
    
    for (int i = 0; i < 60; i++){
        
        // random sizes
        CGFloat randSize = (arc4random() % + maxSize) * .7;
        // random x
        CGFloat randX = (arc4random() % screenWidth)*screenHeight;
        // random y
        CGFloat randY = (arc4random() % screenHeight)*screenWidth;
        
        CGRect frame;
        frame.size.height = randSize;
        frame.size.width = randSize;
        frame.origin.x = randX;
        frame.origin.y = randY;
        
        VHView *bubble = [[VHView alloc] initWithFrame:frame];
        [bubble setBackgroundColor:[UIColor clearColor]];
        //        int flag = i%2;
        bubble.flagInt = i%2;
        
        // add the VHViews to VHBubblesView
        [self addSubview:bubble];
    }
    
    //        NSLog(@" flag array: %@", array);
    
}

- (void)moveBubbles{
    
    [UIView animateWithDuration:2.0 animations:^{
        for (VHView *bubble in  [self subviews]) {
            
            int flag = bubble.flagInt;
            //            CGFloat rand = (arc4random() % 1000)*.10;
            
            CGFloat width = bubble.frame.size.width;
            CGFloat height = bubble.frame.size.height;
            
            CGRect frame;
            frame.size.height = height;
            frame.size.width = width;
            
            if (flag) {
                frame.origin.x += (arc4random() % 1000)/2;
                frame.origin.y += (arc4random() % 1000)/2;
            }else{
                frame.origin.x -= (arc4random() % 1000)/2;
                frame.origin.y -= (arc4random() % 1000)/2;
            }
            
            bubble.frame = frame;
        }
    }];
    
}






@end
