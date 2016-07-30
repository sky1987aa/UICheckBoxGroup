//
//  UICheckboxGroup.m
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "UICheckboxGroup.h"

static NSInteger SINGLE_MODE = 0;
static NSInteger MULITI_MODE = 1;


@protocol UICheckboxDelegate <NSObject>

- (void)onCheckBoxPressed:(NSString *)title;

@end

@interface UICheckbox : UIControl

-(void)setChecked:(BOOL)boolValue;
-(void)setDisabled:(BOOL)boolValue;
-(void)setText:(NSString *)stringValue;

@property(nonatomic, assign)BOOL checked;
@property(nonatomic, assign)BOOL disabled;
@property(nonatomic, strong)NSString *text;
@property(nonatomic, strong)id<UICheckboxDelegate> delegate;

@end

@interface UICheckbox (){
    BOOL loaded;
}

@property(nonatomic, strong)UILabel *textLabel;

@end

@implementation UICheckbox
@synthesize checked = _checked;
@synthesize disabled = _disabled;
@synthesize text = _text;
@synthesize textLabel = _textLabel;

-(void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
}

-(void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"checkbox_%@checked.png", (self.checked) ? @"" : @"un"]];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    if(self.disabled) {
        self.userInteractionEnabled = FALSE;
        self.alpha = 0.7f;
    } else {
        self.userInteractionEnabled = TRUE;
        self.alpha = 1.0f;
    }
    
    if(self.text) {
        if(!loaded) {
            _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width + 5, 0, self.text.length*10, CGRectGetHeight(self.frame))];
            _textLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:_textLabel];
            
            loaded = TRUE;
        }
        
        _textLabel.text = self.text;
    }
    
    
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self setChecked:!self.checked];
    [self.delegate onCheckBoxPressed:self.text];
    return TRUE;
}

-(void)setChecked:(BOOL)boolValue {
    _checked = boolValue;
    [self setNeedsDisplay];
}

-(void)setDisabled:(BOOL)boolValue {
    _disabled = boolValue;
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)stringValue {
    _text = stringValue;
    [self setNeedsDisplay];
}


@end

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
        checkbox.disabled = NO;
        [self addSubview:checkbox];
        [self.checkBoxDic setObject:checkbox forKey:title];
    }
    
}

- (void)onCheckBoxPressed:(NSString*)title{
    
    if(self.checkboxMode == 0){
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
    
    [self.deldgate getCheckBoxGroupData:[self getCheckBoxDataArray]];

    
    
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
