//
//  NSTbleView6.h
//  SplitViewProject
//
//  Created by Sabertooth on 25/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RowTableView.h"

@interface NSTbleView6 : NSTableView <NSTabViewDelegate, NSTableViewDataSource>
{
    
    NSArray *mArray;
}
@property(strong) NSArray *mArray;
@end
