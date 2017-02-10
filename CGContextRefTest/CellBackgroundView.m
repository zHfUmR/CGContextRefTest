//
//  CellBackgroundView.m
//  CGContextRefTest
//
//  Created by GES-iMac on 17/2/10.
//  Copyright © 2017年 GES-iMac. All rights reserved.
//

#import "CellBackgroundView.h"

@implementation CellBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    // 创建起点的颜色
    CGRect paperRect = self.bounds;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    // 1.
    {
//        CGColorRef beginColor = CGColorCreate(colorSpaceRef, (CGFloat[]){1.0f,1.0f,1.0f,1.0f});
//        
//        CGColorRef endColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.83f, 0.83f, 0.83f, 1.0f});
//        
//        CGFloat locations[] = {0.0,1.0};
//        
//        NSArray *colors = [NSArray arrayWithObjects:(__bridge id)beginColor,(__bridge id)endColor, nil];
//        
//        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)CFBridgingRetain(colors), locations);
    }
    
#pragma mark - easy write
    
    // 2.
    CGFloat colors[] =
    {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (colorSpace, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    
    /*************************************************************************/
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    
    CGContextAddRect(context, rect);
    
    CGContextClip(context);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    
    CGColorSpaceRelease(colorSpace);
    
    // add line stroke
    
    CGRect strokeRect = CGRectInset(paperRect, 5.0, 5.0);
    
    CGColorRef lineColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.81,0.43,0.99,1.0f});
    
    CGContextSetStrokeColorWithColor(context, lineColor);
    
    CGContextSetLineWidth(context, 0.5);
    
    CGContextStrokeRect(context, strokeRect);
}



@end
