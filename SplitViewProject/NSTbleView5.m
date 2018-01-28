//
//  NSTbleView5.m
//  SplitViewProject
//
//  Created by Sabertooth on 22/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//
//
//  NSTableView.m
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//
#import "NSTbleView5.h"
#import "appInfo.h"

@implementation TextRowView
@synthesize detailTextField;
@synthesize summeryTextField;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)viewWillDraw {
      [self setEmphasized:true];
}



- (NSBackgroundStyle)interiorBackgroundStyle {
    return NSBackgroundStyleLight;
}
@end

@implementation NSTbleView5
@synthesize sourceArray;
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


-(void)viewWillDraw{
    
    [self enumerateAvailableRowViewsUsingBlock:^(NSTableRowView *rowView, NSInteger row){
        rowView.backgroundColor = [NSColor grayColor];
    }];
}


- (BOOL)selectionShouldChangeInTableView:(NSTableView *)aTableView
{
    NSInteger selectedRowNumber = [aTableView selectedRow];
    if (selectedRowNumber > 0) {
        [aTableView setNeedsDisplayInRect:[aTableView rectOfRow:selectedRowNumber-1]];
    }
    return YES;
}


-(void)awakeFromNib{
    
    
    sourceArray = @[@{@"First Name":@"Harshada",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      },
                    @{@"First Name":@"Harshada",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      }
                    ];

//   NSNib *nib = [[NSNib alloc] initWithNibNamed:@"TextRowView" bundle:nil];
//  [self registerNib:nib forIdentifier:@"TextRowView"];
    [self setDelegate:(id)self];
    [self setDataSource:self];
    [self setGridStyleMask:NSTableViewSolidVerticalGridLineMask];
    
    [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
   
    
 
}



-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    
    return  [sourceArray count];
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSTableCellView *view;
    view = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
    [view.textField setStringValue:sourceArray[row][tableColumn.identifier]];
    [tableColumn.headerCell setStringValue:tableColumn.identifier];
    [tableView setIndicatorImage:[NSImage imageNamed:@"NSDescendingSortIndicator"] inTableColumn:tableColumn];

    
    return view;
}


- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    
    TextRowView *tblerow = [tableView rowViewAtRow:row makeIfNecessary:YES];
    tblerow.backgroundColor = [NSColor alternateSelectedControlColor];
    [tblerow setEmphasized:NO];
    return tblerow;
}

@end











