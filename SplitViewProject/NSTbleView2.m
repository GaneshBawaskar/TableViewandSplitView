//
//  NSTbleView2.m
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "NSTbleView2.h"

@implementation NSTbleView2
@synthesize sourceArray;
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    //
    // TODO:Change Table View Cell Highlite Color.
    // TODO:NSTableHeaderView
    // TODO:NSTableRowView
    // Drawing code here.
    //
}


-(void)awakeFromNib {
    
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
                    @{@"First Name":@"Harshada",
                      @"Last Name":@"Bawaskar",
                      @"Email ID":@"gbawskar@gmail.com"
                      }
                    ];
    
    [self setDelegate: (id) self];
    [self setDataSource:self];
    [self reloadData];
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return  [sourceArray count];
}


- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSTableCellView *view;
    view = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
    [view.textField setStringValue:[[sourceArray objectAtIndex:row] objectForKey:tableColumn.identifier]];
    
    return view;
}

@end
