//
//  UICheckbox.h
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICheckboxDelegate <NSObject>

- (void)onCheckBoxPressed:(NSString *)title;

@end

@interface UICheckbox : UIControl

@property(nonatomic, strong)id<UICheckboxDelegate> delegate;

@property(nonatomic, assign)BOOL checked;
@property(nonatomic, strong)NSString *text;

-(void)setChecked:(BOOL)boolValue;
-(void)setText:(NSString *)stringValue;


@end

