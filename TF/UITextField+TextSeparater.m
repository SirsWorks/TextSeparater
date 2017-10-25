//
//  UITextField+TextSeparater.m
//  TF
//
//  Created by pangpangpig-Mac on 2017/10/25.
//  Copyright © 2017年 _Doctor. All rights reserved.
//

#import "UITextField+TextSeparater.h"
#import <objc/runtime.h>
#define SeparatedDistance  10.f
@implementation UITextField (TextSeparater)


- (NSInteger)separatedInterval{
    return [objc_getAssociatedObject(self, @"separatedIntervalKey") integerValue];
}
- (void)setSeparatedInterval:(NSInteger)separatedInterval{
    
    objc_setAssociatedObject(self, @"separatedIntervalKey", [NSNumber numberWithInteger:separatedInterval], OBJC_ASSOCIATION_ASSIGN);
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
}


-(void)valueChanged:(UITextField*)tf{
    UITextRange * editRange =  self.selectedTextRange;
    if ((tf.text != nil) && (tf.text.length>self.separatedInterval) ) {
        NSMutableAttributedString * string =[[NSMutableAttributedString alloc]initWithString:tf.text];
        
        for (int i = 1; i < tf.text.length; i ++) {
            if ( i %self.separatedInterval == 0) {
                [string addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:SeparatedDistance] range:NSMakeRange(i-1, 1)];
            }
        }
        self.attributedText = string;
        self.selectedTextRange = editRange;
    }
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"text"]) {
        UITextRange * editRange =  self.selectedTextRange;
        UITextField * tf = (UITextField*)object;
        if ((tf.text != nil) && (tf.text.length>self.separatedInterval) ) {
            NSMutableAttributedString * string =[[NSMutableAttributedString alloc]initWithString:tf.text];
            for (int i = 1; i < tf.text.length; i ++) {
                if ( i %self.separatedInterval == 0) {
                    [string addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:SeparatedDistance] range:NSMakeRange((i-1), 1)];
                }
            }
            self.attributedText = string;
            self.selectedTextRange = editRange;
        }
    }
    
}
- (void)dealloc{
    [self removeObserver:self forKeyPath:@"text"];
    [self removeTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
}

@end
