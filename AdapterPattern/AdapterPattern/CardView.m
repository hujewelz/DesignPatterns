//
//  CardView.m
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "CardView.h"

@interface CardView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation CardView

+ (instancetype)cardView {
    return [[[NSBundle mainBundle] loadNibNamed:@"CareView" owner:nil options:nil] lastObject];
}

- (void)configWithData:(id<MyAdapterProtocol>)data {
    self.nameLabel.text = [data name];
    self.phoneLabel.text = [data phone];
}

@end
