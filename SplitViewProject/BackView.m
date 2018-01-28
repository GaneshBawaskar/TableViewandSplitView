//
//  BackView.m
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "BackView.h"

@implementation BackView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [[NSColor lightGrayColor] setFill];
    NSRectFill(dirtyRect);
    // Drawing code here.
}

@end
