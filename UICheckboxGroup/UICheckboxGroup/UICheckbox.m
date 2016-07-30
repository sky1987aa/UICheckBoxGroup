//
//  UICheckbox.m
//  UICheckboxGroup
//
//  Created by Darren Huang on 2016/7/30.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "UICheckbox.h"

@interface UICheckbox (){
    BOOL loaded;
}
@property(nonatomic, strong)UILabel *textLabel;

@end

@implementation UICheckbox

-(void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
}

-(void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"checkbox_%@checked.png", (self.checked) ? @"" : @"un"]];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
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

-(void)setText:(NSString *)stringValue {
    _text = stringValue;
    [self setNeedsDisplay];
}


@end

