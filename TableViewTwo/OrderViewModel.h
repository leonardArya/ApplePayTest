//
//  OrderViewModel.h
//  TableViewTwo
//
//  Created by Leonard Li on 10/14/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderViewModel : NSObject

+(OrderViewModel*)instance;
@property NSInteger selectedCardIndex;
@end
