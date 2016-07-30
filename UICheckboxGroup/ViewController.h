//
//  ViewController.h
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckboxGroup/UICheckboxGroup.h"

@interface ViewController : UIViewController<UICheckboxGroupDelegate>

@property(nonatomic, weak)IBOutlet UICheckboxGroup *checkBoxGroup1;
@property(nonatomic, weak)IBOutlet UICheckboxGroup *checkBoxGroup2;
@property (weak, nonatomic) IBOutlet UILabel *result1Label;
@property (weak, nonatomic) IBOutlet UILabel *result2Label;


@end

