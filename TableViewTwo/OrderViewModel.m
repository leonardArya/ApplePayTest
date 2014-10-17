//
//  OrderViewModel.m
//  TableViewTwo
//
//  Created by Leonard Li on 10/14/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "OrderViewModel.h"

@implementation OrderViewModel

static OrderViewModel * instance;
+(OrderViewModel*)instance{
    if (instance==nil) {
        instance = [OrderViewModel alloc];
    }
    return instance;
}

@end
