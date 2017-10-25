//
//  UITextField+TextSeparater.h
//  TF
//
//  Created by pangpangpig-Mac on 2017/10/25.
//  Copyright © 2017年 _Doctor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TextSeparater)
/**
 *  给UITextField添加了一个设置分割数的属性，
 */
- (void)setSeparatedInterval:(NSInteger)separatedInterval;
- (NSInteger)separatedInterval;
@end
