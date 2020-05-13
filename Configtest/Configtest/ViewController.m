//
//  ViewController.m
//  ConfigTest
//
//  Created by mikewang on 2020/5/12.
//  Copyright © 2020 chiron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *name = [NSBundle.mainBundle.infoDictionary objectForKey:@"AppName"];
    NSLog(@"%@", name); // CT Config Test
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = name;
    
    [self.view addSubview:nameLabel];
    
    
}


@end
