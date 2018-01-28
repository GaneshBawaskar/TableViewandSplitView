//
//  RowTableView.m
//  SplitViewProject
//
//  Created by Sabertooth on 27/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "RowTableView.h"

@implementation RowTableView
@synthesize mouseInside;
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}


-(void)updateTrackingAreas
{
    [super updateTrackingAreas];
    if (!TrackingArea) {
        TrackingArea = [[NSTrackingArea alloc] initWithRect:NSZeroRect options:NSTrackingInVisibleRect | NSTrackingActiveAlways | NSTrackingMouseEnteredAndExited  owner:self userInfo:nil];
    }
    
    if (![[self trackingAreas] containsObject:TrackingArea]) {
        [self addTrackingArea:TrackingArea];
    }
}


-(void)setMouseInside:(BOOL)value{
    if (mouseInside!=value) {
        mouseInside = value;
        [self setNeedsDisplay:TRUE];
    }
}


-(void)mouseExited:(NSEvent *)theEvent{
    self.mouseInside = NO;
    
}


-(void)mouseEntered:(NSEvent *)theEvent{
    self.mouseInside = YES;
}


- (NSBackgroundStyle)interiorBackgroundStyle {
    return NSBackgroundStyleLight;
}


- (void)drawBackgroundInRect:(NSRect)dirtyRect {
    // Custom background drawing. We don't call super at all.
    [self.backgroundColor set];
    // Fill with the background color first
    NSRectFill(self.bounds);
    // Draw a white/alpha gradient
    static NSGradient *gradient = nil;
    if (self.mouseInside)
    {
        if (gradient == nil) {
            NSColor *targetColor1 = [NSColor whiteColor];
            NSColor *targetColor2 = [targetColor1 colorWithAlphaComponent:0];
            NSArray *array = [NSArray arrayWithObjects:targetColor2,targetColor1,targetColor1,targetColor2, nil];
            const CGFloat locations[4] = { 0.0, 0.35, 0.65, 1.0 };
            gradient = [[NSGradient alloc] initWithColors:array atLocations:locations colorSpace:[NSColorSpace sRGBColorSpace]];
        }
        
        [gradient drawInRect:self.bounds angle:0];
    }
}


//- (void)setFrame:(NSRect)frameRect {
//    [super setFrame:frameRect];
//    // We need to invalidate more things when live-resizing since we fill with a gradient and stroke
//    if ([self inLiveResize]) {
//        // Redraw everything if we are using a gradient
//        if (self.selected || self.mouseInside) {
//            [self setNeedsDisplay:YES];
//        } else {
//            // Redraw our horizontal grid line, which is a gradient
//            [self setNeedsDisplayInRect:[self separatorRect]];
//        }
//    }
//}


// Only called if the 'selected' property is yes.
- (void)drawSelectionInRect:(NSRect)dirtyRect {
    // Check the selectionHighlightStyle, in case it was set to None
    if (self.selectionHighlightStyle != NSTableViewSelectionHighlightStyleNone) {
        // We want a hard-crisp stroke, and stroking 1 pixel will border half on one side and half on another, so we offset by the 0.5 to handle this
        NSRect selectionRect = NSInsetRect(self.bounds, 5.5, 5.5);
        [[NSColor colorWithCalibratedWhite:.72 alpha:1.0] setStroke];
        [[NSColor colorWithCalibratedWhite:.82 alpha:1.0] setFill];
        NSBezierPath *selectionPath = [NSBezierPath bezierPathWithRoundedRect:selectionRect xRadius:10 yRadius:10];
        [selectionPath fill];
        [selectionPath stroke];
    }
}


- (NSRect)separatorRect {
    NSRect separatorRect = self.bounds;
    separatorRect.origin.y = NSMaxY(separatorRect) - 1;
    separatorRect.size.height = 1;
    return separatorRect;
}


- (void)drawSeparatorInRect:(NSRect)dirtyRect {
    static NSGradient *gradient = nil;
    if (gradient == nil) {
        
        NSColor *targetColor1 = [NSColor colorWithSRGBRed:0.8 green:0.8 blue:0.8 alpha:1];
        NSColor *targetColor2 = [targetColor1 colorWithAlphaComponent:0];
        NSArray *array = [NSArray arrayWithObjects:targetColor2,targetColor1,targetColor1,targetColor2, nil];
        const CGFloat locations[4] = { 0.0, 0.35, 0.65, 1.0 };
        gradient = [[NSGradient alloc] initWithColors:array atLocations:locations colorSpace:[NSColorSpace sRGBColorSpace]];
    
    }
    
    [gradient drawInRect:[self separatorRect] angle:0];
}
@end
