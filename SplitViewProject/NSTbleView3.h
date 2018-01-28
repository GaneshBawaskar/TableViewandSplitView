//
//  NSTbleView3.h
//  SplitViewProject
//
//  Created by Sabertooth on 20/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTbleView3 : NSTableView <NSTabViewDelegate, NSTableViewDataSource>
{
    NSArray *sourceArray;
}
@property(strong) NSArray *sourceArray;
@end