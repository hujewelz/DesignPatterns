//
//  UserBusinessAdapter.m
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "BusinessAdapter.h"

@implementation BusinessAdapter
- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)name { return nil; }
- (NSString *)phone { return nil; };

@end
