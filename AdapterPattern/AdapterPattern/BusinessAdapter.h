//
//  UserBusinessAdapter.h
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyAdapterProtocol.h"

@interface BusinessAdapter : NSObject <MyAdapterProtocol>

@property (weak, nonatomic) id data;

- (instancetype)initWithData:(id)data;

@end
