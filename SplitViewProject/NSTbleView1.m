//
//  NSTbleView1.m
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "NSTbleView1.h"

@implementation NSTbleView1
@synthesize sourceArray;
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    //
    // Change Table View Cell Highlite Color.
    //
    // Drawing code here.
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
                    @{@"First Name":@"Ganesh",
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


- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSDictionary *dict = [sourceArray objectAtIndex:row];
    [tableColumn sizeToFit];
    
    return [dict objectForKey:tableColumn.identifier];
}
@end
