//
//  ViewController.m
//  AdapterPattern
//
//  Created by jewelz on 15/8/13.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "UserBusinessAdapter.h"
#import "CardView.h"
#import "Cat.h"
#import "CatBusinessAdapter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *user = [[User alloc] init];
    user.name = @"huauhuuh";
    user.phone = @"123-3453-6879";
    
    Cat *cat = [[Cat alloc] init];
    cat.name = @"Tom";
    BusinessAdapter *catAdapter = [[CatBusinessAdapter alloc] initWithData:cat];
    
    BusinessAdapter *adapter = [[UserBusinessAdapter alloc] initWithData:user];
    
    CardView *cardView = [CardView cardView];
    cardView.center = self.view.center;
    [self.view addSubview:cardView];
    [cardView configWithData:catAdapter];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
