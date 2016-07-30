//
//  UICheckboxGroup.h
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICheckboxGroupDelegate <NSObject>

- (void)getCheckBoxGroupData:(NSMutableArray *) dataArray;

@end

@interface UICheckboxGroup : UIView

@property (strong,nonatomic) id <UICheckboxGroupDelegate>deldgate;
@property (assign,nonatomic) NSInteger checkboxMode;

- (void)initWithTitles:(NSArray *)titleArray;

@end
