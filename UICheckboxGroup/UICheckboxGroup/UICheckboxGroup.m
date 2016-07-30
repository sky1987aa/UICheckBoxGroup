//
//  UICheckboxGroup.m
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "UICheckboxGroup.h"

@interface UICheckboxGroup()<UICheckboxDelegate>
@property (strong,nonatomic) NSMutableDictionary *checkBoxDic;
@end

@implementation UICheckboxGroup

- (void)initWithTitles:(NSArray *)titleArray{
    
    self.checkBoxDic = [[NSMutableDictionary alloc] init];
    
    for (int i = 0 ; i <titleArray.count;i++) {
        NSString *title = titleArray[i];
        UICheckbox *checkbox = [[UICheckbox alloc] initWithFrame:CGRectMake(0, 60*i, 30, 30)];
        checkbox.delegate = self;
        checkbox.text = title;
        checkbox.checked = NO;
        [self addSubview:checkbox];
        [self.checkBoxDic setObject:checkbox forKey:title];
    }
    
}

- (void)onCheckBoxPressed:(NSString*)title{
    
    if(self.checkboxMode == UICheckBoxGroupSingleMode){
        NSArray *keys = [self.checkBoxDic allKeys];
        for(NSString *checkBoxTitle in keys){
            UICheckbox *checkbox = [self.checkBoxDic objectForKey:checkBoxTitle];
            if([checkBoxTitle isEqualToString:title]){
                checkbox.checked  = YES;
            }else{
                checkbox.checked = NO;
            }
        }
    }
    
    [self.deldgate checkBoxGroupCallback:self data:[self getCheckBoxDataArray]];

}

- (NSMutableArray *)getCheckBoxDataArray{
    NSMutableArray *checkBoxDataArray = [[NSMutableArray alloc] init];
    
    NSArray *keys = [self.checkBoxDic allKeys];
    for(NSString *checkBoxTitle in keys){
        UICheckbox *checkbox = [self.checkBoxDic objectForKey:checkBoxTitle];
        if(checkbox.checked){
            [checkBoxDataArray addObject:checkBoxTitle];
        }
    }
    
    return checkBoxDataArray;
}



@end
