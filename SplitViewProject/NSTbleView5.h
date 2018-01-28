//
//  NSTbleView5.h
//  SplitViewProject
//
//  Created by Sabertooth on 22/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTbleView5 : NSTableView <NSTableViewDelegate, NSTableViewDataSource>
{
     NSArray *sourceArray;
}
@property(retain) IBOutlet NSArray *sourceArray;
@end

@interface TextRowView : NSTableRowView
{
    NSTextField *summeryTextField;
    NSTextField *detailTextField;
}
@property(strong) IBOutlet NSTextField *detailTextField;
@property(strong) IBOutlet NSTextField *summeryTextField;

@end