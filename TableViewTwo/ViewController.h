//
//  ViewController.h
//  TableViewTwo
//
//  Created by clark Lyu on 10/13/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *data;


@end

