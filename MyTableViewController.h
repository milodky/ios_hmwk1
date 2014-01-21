//
//  MyTableViewController.h
//  ios_hmwk1
//
//  Created by Xiaoting Ye on 2/7/13.
//  Copyright (c) 2013 Xiaoting Ye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *strings;

@end
