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
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    [self.checkBoxGroup1 initWithTitles:@[@"Apple",@"Orange",@"Banana"] withColumn:3];
    self.checkBoxGroup1.deldgate = self;
    self.checkBoxGroup1.checkboxMode = UICheckBoxGroupSingleMode;
    
    [self.checkBoxGroup2 initWithTitles:@[@"Apple",@"Orange",@"Banana",@"Dog",@"Pig",@"Monkey",@"Cat"] withColumn:3];
    self.checkBoxGroup2.deldgate = self;
    self.checkBoxGroup2.checkboxMode = UICheckBoxGroupMultiMode;

}

#pragma mark - UICheckBoxDelegate
- (void)checkBoxGroupCallback:(UICheckboxGroup *)checkboxgroup data:(NSMutableArray *)dataArray{
    
    NSString *result = @"";
    
    for(NSString *title in dataArray){
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@,",title]];
    }
    
    if(checkboxgroup == self.checkBoxGroup1){
        self.result1Label.text = result;
    }else if(checkboxgroup == self.checkBoxGroup2){
        self.result2Label.text = result;
    }
}


@end
