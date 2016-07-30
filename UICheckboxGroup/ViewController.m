//
//  ViewController.m
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.checkBoxGroup1 initWithTitles:@[@"Apple",@"Orange",@"Banana"]];
    self.checkBoxGroup1.deldgate = self;
    self.checkBoxGroup1.checkboxMode = 1;
    
    [self.checkBoxGroup2 initWithTitles:@[@"Apple",@"Orange",@"Banana"]];
    self.checkBoxGroup2.deldgate = self;
    self.checkBoxGroup2.checkboxMode = 0;
}

#pragma mark - UICheckBoxDelegate

- (void)getCheckBoxGroupData:(NSMutableArray *)dataArray{
    NSLog(@"dataArray = %@",dataArray);
}

@end
