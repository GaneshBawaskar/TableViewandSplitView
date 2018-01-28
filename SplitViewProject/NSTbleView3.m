//
//  NSTbleView3.m
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "NSTbleView3.h"

@implementation NSTbleView3
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
                      @"Job Title":@"CA"
                      },
                    @{@"First Name":@"Harshada",
                      @"Last Name":@"Bawaskar",
                      @"Job Title":@"Software Engineer"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Job Title":@"CA"
                      },
                    @{@"First Name":@"Ganesh",
                      @"Last Name":@"Bawaskar",
                      @"Job Title":@"HR"
                      },
                    @{@"First Name":@"Harshada",
                      @"Last Name":@"Bawaskar",
                      @"Job Title":@"CA"
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
    
    if ([tableColumn.identifier isEqualToString:@"Image"])
    {
        NSImageView *view1 = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
        [view1 setImage:[NSImage imageNamed:NSImageNameEveryone]];
        return view1;
        
    }
    else if ([tableColumn.identifier isEqualToString:@"Job Title"])
    {
        NSPopUpButton *popUpButton = [tableView makeViewWithIdentifier:@"Popup" owner:nil];
        [popUpButton removeAllItems];
        [popUpButton addItemWithTitle:@"Software Engineer"];
        [popUpButton addItemWithTitle:@"CA"];
        [popUpButton addItemWithTitle:@"HR"];
        [popUpButton addItemWithTitle:@"Cashier"];
        [popUpButton selectItemWithTitle:[[sourceArray objectAtIndex:row] objectForKey:tableColumn.identifier]];
        return popUpButton;
    }
    else{

        view = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
        [view.textField setStringValue:[[sourceArray objectAtIndex:row] objectForKey:tableColumn.identifier]];
    }
    
    return view;
}
@end
