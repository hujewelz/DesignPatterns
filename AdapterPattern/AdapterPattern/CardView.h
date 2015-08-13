//
//  CardView.h
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAdapterProtocol.h"

@interface CardView : UIView

+ (instancetype)cardView;

- (void)configWithData:(id<MyAdapterProtocol>)data;

@end
