//
//  UICheckboxGroup.h
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckbox.h"
@class UICheckboxGroup;

typedef enum {
    UICheckBoxGroupSingleMode = 0,
    UICheckBoxGroupMultiMode
}UICheckBoxGroupMode;

@protocol UICheckboxGroupDelegate <NSObject>
- (void)checkBoxGroupCallback:(UICheckboxGroup *)checkboxgroup data:(NSMutableArray *) dataArray;

@end

@interface UICheckboxGroup : UIView

@property (strong,nonatomic) id <UICheckboxGroupDelegate>deldgate;

@property (assign,nonatomic) NSInteger checkboxMode;

- (void)initWithTitles:(NSArray *)titleArray withColumn:(NSInteger)defaultColumn;

@end
