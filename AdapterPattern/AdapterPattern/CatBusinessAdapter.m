//
//  CatBusinessAdapter.m
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "CatBusinessAdapter.h"
#import "Cat.h"

@implementation CatBusinessAdapter

- (NSString *)name {
    Cat *cat = self.data;
    return cat.name;
}

- (NSString *)phone {
    return @"喵, 我是一只猫，没有手机";
}

@end
