//
//  NSTableView.m
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "NSTbleView4.h"
#import "appInfo.h"
@implementation HeaderView
@synthesize headerName;
- (void)drawRect:(NSRect)dirtyRect {
   
    
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:dirtyRect xRadius:3.0 yRadius:3.0];
    [path addClip];
    NSColor *nsColor = [NSColor colorWithRed:1.0 green:0.7 blue:0 alpha:1.0];
    [nsColor setFill];
    [path fill];
    NSRectFill(dirtyRect);
     [super drawRect:dirtyRect];
    
}
@end

@implementation TextCellView
@synthesize detailTextField;
@synthesize summeryTextField;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    // Drawing code here.
}
@end


@implementation NSTbleView4
@synthesize sourceArray;
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)awakeFromNib{
  
    
    sourceArray = @[@{@"headerInfo":@"iPad"},
                         @{@"summaryInfo":@"iPad Pro",@"detailInfo":@"This is a very long description about iPad Pro.iOS 9 brings key enhancements to the powerful built-in apps you use every day. And new multitasking features help make you even more productive.",@"imageIcon":@"NSStatusUnavailable"},
                         @{@"summaryInfo":@"iPad Air",@"detailInfo":@"Thiss is a very long description about iPad Air.iOS 9 brings key enhancements to the powerful built-in apps you use every day. And new multitasking features help make you even more productive.",@"imageIcon":@"NSStatusAvailable"},
                         @{@"headerInfo":@"CPU"},
                         @{@"summaryInfo":@"Mac Mini",@"detailInfo":@"This is a very long description about Mac Mini",@"imageIcon":@"NSStatusPartiallyAvailable"},
                        @{@"headerInfo":@"Mac Book"},
                        @{@"summaryInfo":@"Mac Book ",@"detailInfo":@"This is a very long description about iPad Air.iOS 9 brings key enhancements to the powerful built-in apps you use every day. And new multitasking features help make you even more productive",@"imageIcon":@"NSStatusAvailable"}
                    ];

    [self setDelegate:(id)self];
    [self setDataSource:self];
    //[self setSelectionHighlightStyle: NSTableViewSelectionHighlightStyleSourceList];

    
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Action"];
    [menu addItem: [[NSMenuItem alloc] initWithTitle:@"copy" action:@selector(indexesToProcessForContextMenu) keyEquivalent:@""]];
    [menu addItem: [[NSMenuItem alloc] initWithTitle:@"paste" action:@selector(indexesToProcessForContextMenu)  keyEquivalent:@""]];
    [menu addItem: [[NSMenuItem alloc] initWithTitle:@"delete" action:@selector(indexesToProcessForContextMenu)  keyEquivalent:@""]];
    
    [self setMenu:menu];
   
    [self reloadData];
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return  [sourceArray count];
}


- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    
        if (sourceArray[row][@"headerInfo"] != nil)
        {
            return 27.0;
        }
        else
        {
            return 67.0;
        }
    
    
    return 67.0;
}


- (NSIndexSet *)indexesToProcessForContextMenu {
    NSIndexSet *selectedIndexes = [self selectedRowIndexes];
    if ([self clickedRow] != -1 && ![selectedIndexes containsIndex:[self clickedRow]]) {
        selectedIndexes = [NSIndexSet indexSetWithIndex:[self clickedRow]];
    }
    return selectedIndexes;
}



- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    
    //NSTableRowView
    //NSTableHeaderView
    //NSTableViewFooter
    //NSTableItem
    if (sourceArray[row][@"headerInfo"] != nil)
    {
        return false;
    }
 
     NSTableRowView *rowView= [self rowViewAtRow:row makeIfNecessary:NO];
     //rowView.backgroundColor = [NSColor brownColor];
    [rowView setEmphasized:NO];

    return true;
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    //
    //   Change background colur
    //
    //   for (NSUInteger row = 0 ;row < [sourceArray count]; row++){
    //        NSTableRowView *cell = [self rowViewAtRow:row makeIfNecessary:NO];
    //        cell.backgroundColor = [NSColor yellowColor];
    //    }
    //
    //   NSInteger selectedRow = [self selectedRow];
    //   NSTableRowView *cell = [self rowViewAtRow:selectedRow makeIfNecessary:NO];
    //   cell.backgroundColor = [NSColor yellowColor];
    //
    
    [appInfo getAppInfo];

}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSTableCellView *view = nil;
    
    
    if (sourceArray[row][@"headerInfo"] != nil)
    {
        HeaderView *headerCell;
        
        headerCell = [tableView makeViewWithIdentifier:@"HeaderCell" owner:nil];
        [headerCell.textField setStringValue:sourceArray[row][@"headerInfo"]];
      
        return headerCell;
        
    }
    else
    {
        TextCellView *textViewCell;
        textViewCell = [tableView makeViewWithIdentifier:@"ContentView" owner:nil];
        textViewCell.imageView.image = [NSImage imageNamed:sourceArray[row][@"imageIcon"]];
        [textViewCell.imageView setImageScaling:NSImageScaleProportionallyUpOrDown];

      textViewCell.wantsLayer = true;
      textViewCell.imageView.layer.borderColor = [NSColor lightGrayColor].CGColor;
      textViewCell.imageView.layer.borderWidth = 1.0;
    
        [textViewCell.summeryTextField setStringValue:sourceArray[row][@"summaryInfo"]];
        [textViewCell.summeryTextField sizeToFit];
        
        [textViewCell.detailTextField setStringValue:sourceArray[row][@"detailInfo"]];
        [textViewCell.detailTextField sizeToFit];
   
        return textViewCell;
    }
    
    return view;
}


@end










