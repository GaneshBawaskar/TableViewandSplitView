//
//  NSTbleView6.m
//  SplitViewProject
//
//  Created by Sabertooth on 25/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "NSTbleView6.h"

@implementation NSTbleView6
@synthesize mArray;
-(void)drawRect:(NSRect)dirtyRect{
    [super drawRect:dirtyRect];
    
}

-(void)awakeFromNib{
    
    [self setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    //[self setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];

    mArray = [[NSArray alloc] initWithObjects:
              [NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed:NSImageNameMobileMe], @"Image",
               NSImageNameMobileMe, @"Name", nil],
              [NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed:NSImageNameUserAccounts], @"Image",
               NSImageNameUserAccounts, @"Name", nil],
              [NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed:NSImageNameColorPanel], @"Image",
               NSImageNameColorPanel, @"Name", nil],
              [NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed:NSImageNameApplicationIcon], @"Image",
               NSImageNameApplicationIcon, @"Name", nil],
              [NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed:NSImageNameFolderSmart], @"Image",
               NSImageNameFolderSmart, @"Name", nil],
              [NSDictionary dictionaryWithObjectsAndKeys:[NSImage imageNamed:NSImageNameFontPanel], @"Image",
               NSImageNameFontPanel, @"Name", nil],
              nil];
    [self setDelegate:(id)self];
    [self setDataSource:self];
    [self reloadData];
    
   
//    [self insertRowsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [mArray count])] withAnimation:NSTableViewAnimationSlideDown];
  
    
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    [self enumerateAvailableRowViewsUsingBlock:^(NSTableRowView *rowView, NSInteger row){

        //[rowView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
        //[rowView setEmphasized:NO];
        
        if ([rowView  isKindOfClass:[RowTableView class]]) {
            NSLog(@"rowView is kind of ViewRow");
        }
        
        for (int count = 0 ; count < rowView.numberOfColumns; count++) {
            NSView *view = [rowView viewAtColumn:count];
            if ([view isKindOfClass:[NSTableCellView class]]) {
                NSTableCellView *cellview = (NSTableCellView *)view;
                NSTextField *textf =  cellview.textField;
              
                NSLog(@"enumerateAvailableRowViewsUsingBlock::%@",[textf stringValue]);
            }
        }
    }];
}


- (NSTableRowView*)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row
{
    static NSString* const kRowIdentifier = @"RowTableView";
    RowTableView * RowView = [tableView makeViewWithIdentifier:kRowIdentifier owner:nil];

    if (!RowView) {
        RowView = [[RowTableView alloc] initWithFrame:NSZeroRect];
        RowView.identifier = kRowIdentifier;
    }
    
    return RowView;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    return [mArray count];
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSTableCellView *view;
    view = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
    [view.textField setStringValue:mArray[row][@"Name"]];
    [view.imageView setImage:mArray[row][@"Image"]];
    return view;
}

@end
