//
//  RowTableView.h
//  SplitViewProject
//
//  Created by Sabertooth on 27/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RowTableView : NSTableRowView
{
    BOOL mouseInside;
    NSTrackingArea *TrackingArea;
}
@property(assign,nonatomic) BOOL mouseInside;
@end
