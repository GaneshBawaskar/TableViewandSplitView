//
//  NSTableView.h
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTbleView4 : NSTableView <NSTableViewDataSource, NSTableViewDelegate>
{
    NSArray *sourceArray;
}

@property(retain) IBOutlet NSArray *sourceArray;
@end

@interface HeaderView : NSTableCellView
{
    NSTextField *headerName;
}
@property(strong) IBOutlet NSTextField *headerName;
@end

@interface TextCellView : NSTableCellView
{
    NSTextField *summeryTextField;
    NSTextField *detailTextField;
}
@property(strong) IBOutlet NSTextField *detailTextField;
@property(strong) IBOutlet NSTextField *summeryTextField;

@end