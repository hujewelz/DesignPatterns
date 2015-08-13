//
//  UserBusinessAdapter.m
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "UserBusinessAdapter.h"

@implementation UserBusinessAdapter

- (NSString *)name {
    User *user = self.data;
    return user.name;
}
- (NSString *)phone {
    User *user = self.data;
    return user.phone;
}

@end
