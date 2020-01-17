//
//  UITabBar+JHBadge.m
//  JHKit
//
//  Created by xuejinghao on 2018/4/12.
//  Copyright © 2018年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2018 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "UITabBar+JHBadge.h"

@implementation UITabBar (JHBadge)

- (void)jh_showRedDot:(NSInteger)index{
    [[self reddotForIndex:index number:@"" height:16] setHidden:NO];
}

- (void)jh_showRedDot:(NSInteger)index number:(NSString *)number
{
    [[self reddotForIndex:index number:number height:16] setHidden:NO];
}

- (void)jh_showRedDot:(NSInteger)index number:(NSString *)number height:(CGFloat)height
{
    [[self reddotForIndex:index number:number height:height] setHidden:NO];
}

- (void)jh_hideRedDot:(NSInteger)index{
    [[self reddotForIndex:index number:@"" height:16] setHidden:YES];
}

#pragma mark - private
- (UIView *)reddotForIndex:(NSInteger)index number:(NSString *)number height:(CGFloat)height
{
    NSInteger tag = 666 + index;
    UILabel *reddot = [self viewWithTag:tag];
    if (!reddot) {
        
        // If add custom button in 'Tabbar', 'count' should +1.
        // 如果添加了自定义按钮，这里应该 +1.
        NSInteger count = self.items.count + 1;
        CGFloat offset = 0.6;
        if (count == 5) {
            offset = 0.7;
        }else if (count == 4) {
            offset = 0.65;
        }else if (count == 3) {
            offset = 0.625;
        }
        
        CGFloat X = CGRectGetWidth(self.bounds)*((index+offset)/count);
        CGFloat Y = CGRectGetHeight(self.bounds)*0.1;
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(X, Y, height, height);
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = height*0.5;
        label.clipsToBounds = YES;
        label.tag = tag;
        [self addSubview:label];
        
        reddot = label;
    }
    
    if (number.length > 0) {
        reddot.text = number;
        CGSize size = [reddot sizeThatFits:CGSizeZero];
        CGRect frame = reddot.frame;
        frame.size.width = MAX(height, size.width+6);
        reddot.frame = frame;
    }
    
    return reddot;
}

@end
