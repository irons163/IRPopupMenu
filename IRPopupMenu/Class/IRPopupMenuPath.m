//
//  IRPopupMenuPath.m
//  IRPopupMenu
//
//  Created by Phil on 2019/7/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "IRPopupMenuPath.h"
#import "IRRectConst.h"

@implementation IRPopupMenuPath

+ (CAShapeLayer *)ir_maskLayerWithRect:(CGRect)rect
                            rectCorner:(UIRectCorner)rectCorner
                          cornerRadius:(CGFloat)cornerRadius
                            arrowWidth:(CGFloat)arrowWidth
                           arrowHeight:(CGFloat)arrowHeight
                         arrowPosition:(CGFloat)arrowPosition
                        arrowDirection:(IRPopupMenuArrowDirection)arrowDirection
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self ir_bezierPathWithRect:rect rectCorner:rectCorner cornerRadius:cornerRadius borderWidth:0 borderColor:nil backgroundColor:nil arrowWidth:arrowWidth arrowHeight:arrowHeight arrowPosition:arrowPosition arrowDirection:arrowDirection].CGPath;
    return shapeLayer;
}


+ (UIBezierPath *)ir_bezierPathWithRect:(CGRect)rect
                             rectCorner:(UIRectCorner)rectCorner
                           cornerRadius:(CGFloat)cornerRadius
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor
                        backgroundColor:(UIColor *)backgroundColor
                             arrowWidth:(CGFloat)arrowWidth
                            arrowHeight:(CGFloat)arrowHeight
                          arrowPosition:(CGFloat)arrowPosition
                         arrowDirection:(IRPopupMenuArrowDirection)arrowDirection
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    if (borderColor) {
        [borderColor setStroke];
    }
    if (backgroundColor) {
        [backgroundColor setFill];
    }
    bezierPath.lineWidth = borderWidth;
    rect = CGRectMake(borderWidth / 2, borderWidth / 2, IRRectWidth(rect) - borderWidth, IRRectHeight(rect) - borderWidth);
    CGFloat topRightRadius = 0,topLeftRadius = 0,bottomRightRadius = 0,bottomLeftRadius = 0;
    CGPoint topRightArcCenter,topLeftArcCenter,bottomRightArcCenter,bottomLeftArcCenter;
    
    if (rectCorner & UIRectCornerTopLeft) {
        topLeftRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerTopRight) {
        topRightRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerBottomLeft) {
        bottomLeftRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerBottomRight) {
        bottomRightRadius = cornerRadius;
    }
    
    if (arrowDirection == IRPopupMenuArrowDirectionTop) {
        topLeftArcCenter = CGPointMake(topLeftRadius + IRRectX(rect), arrowHeight + topLeftRadius + IRRectX(rect));
        topRightArcCenter = CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect), arrowHeight + topRightRadius + IRRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) - bottomLeftRadius + IRRectX(rect));
        bottomRightArcCenter = CGPointMake(IRRectWidth(rect) - bottomRightRadius + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius + IRRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > IRRectWidth(rect) - topRightRadius - arrowWidth / 2) {
            arrowPosition = IRRectWidth(rect) - topRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition - arrowWidth / 2, arrowHeight + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, IRRectTop(rect) + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition + arrowWidth / 2, arrowHeight + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - topRightRadius, arrowHeight + IRRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius - IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) + IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectX(rect), arrowHeight + topLeftRadius + IRRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        
    }else if (arrowDirection == IRPopupMenuArrowDirectionBottom) {
        topLeftArcCenter = CGPointMake(topLeftRadius + IRRectX(rect),topLeftRadius + IRRectX(rect));
        topRightArcCenter = CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect), topRightRadius + IRRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) - bottomLeftRadius + IRRectX(rect) - arrowHeight);
        bottomRightArcCenter = CGPointMake(IRRectWidth(rect) - bottomRightRadius + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius + IRRectX(rect) - arrowHeight);
        if (arrowPosition < bottomLeftRadius + arrowWidth / 2) {
            arrowPosition = bottomLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > IRRectWidth(rect) - bottomRightRadius - arrowWidth / 2) {
            arrowPosition = IRRectWidth(rect) - bottomRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition + arrowWidth / 2, IRRectHeight(rect) - arrowHeight + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, IRRectHeight(rect) + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition - arrowWidth / 2, IRRectHeight(rect) - arrowHeight + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) - arrowHeight + IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectX(rect), topLeftRadius + IRRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect), IRRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius - IRRectX(rect) - arrowHeight)];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        
    }else if (arrowDirection == IRPopupMenuArrowDirectionLeft) {
        topLeftArcCenter = CGPointMake(topLeftRadius + IRRectX(rect) + arrowHeight,topLeftRadius + IRRectX(rect));
        topRightArcCenter = CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect), topRightRadius + IRRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + IRRectX(rect) + arrowHeight, IRRectHeight(rect) - bottomLeftRadius + IRRectX(rect));
        bottomRightArcCenter = CGPointMake(IRRectWidth(rect) - bottomRightRadius + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius + IRRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > IRRectHeight(rect) - bottomLeftRadius - arrowWidth / 2) {
            arrowPosition = IRRectHeight(rect) - bottomLeftRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowHeight + IRRectX(rect), arrowPosition + arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(IRRectX(rect), arrowPosition)];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + IRRectX(rect), arrowPosition - arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + IRRectX(rect), topLeftRadius + IRRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - topRightRadius, IRRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius - IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) + IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        
    }else if (arrowDirection == IRPopupMenuArrowDirectionRight) {
        topLeftArcCenter = CGPointMake(topLeftRadius + IRRectX(rect),topLeftRadius + IRRectX(rect));
        topRightArcCenter = CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect) - arrowHeight, topRightRadius + IRRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) - bottomLeftRadius + IRRectX(rect));
        bottomRightArcCenter = CGPointMake(IRRectWidth(rect) - bottomRightRadius + IRRectX(rect) - arrowHeight, IRRectHeight(rect) - bottomRightRadius + IRRectX(rect));
        if (arrowPosition < topRightRadius + arrowWidth / 2) {
            arrowPosition = topRightRadius + arrowWidth / 2;
        }else if (arrowPosition > IRRectHeight(rect) - bottomRightRadius - arrowWidth / 2) {
            arrowPosition = IRRectHeight(rect) - bottomRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(IRRectWidth(rect) - arrowHeight + IRRectX(rect), arrowPosition - arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) + IRRectX(rect), arrowPosition)];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - arrowHeight + IRRectX(rect), arrowPosition + arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - arrowHeight + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius - IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) + IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectX(rect), arrowHeight + topLeftRadius + IRRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect) - arrowHeight, IRRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        
    }else if (arrowDirection == IRPopupMenuArrowDirectionNone) {
        topLeftArcCenter = CGPointMake(topLeftRadius + IRRectX(rect),  topLeftRadius + IRRectX(rect));
        topRightArcCenter = CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect),  topRightRadius + IRRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) - bottomLeftRadius + IRRectX(rect));
        bottomRightArcCenter = CGPointMake(IRRectWidth(rect) - bottomRightRadius + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius + IRRectX(rect));
        [bezierPath moveToPoint:CGPointMake(topLeftRadius + IRRectX(rect), IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - topRightRadius, IRRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius - IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) + IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectX(rect), arrowHeight + topLeftRadius + IRRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
    } else if (arrowDirection == IRPopupMenuArrowDirectionCircle) {
        topLeftArcCenter = CGPointMake(topLeftRadius + IRRectX(rect), arrowHeight + topLeftRadius + IRRectX(rect));
        topRightArcCenter = CGPointMake(IRRectWidth(rect) - topRightRadius + IRRectX(rect), arrowHeight + topRightRadius + IRRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) - bottomLeftRadius + IRRectX(rect));
        bottomRightArcCenter = CGPointMake(IRRectWidth(rect) - bottomRightRadius + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius + IRRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > IRRectWidth(rect) - topRightRadius - arrowWidth / 2) {
            arrowPosition = IRRectWidth(rect) - topRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition - arrowWidth / 2, arrowHeight + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, IRRectTop(rect) + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition + arrowWidth / 2, arrowHeight + IRRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) - topRightRadius, arrowHeight + IRRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectWidth(rect) + IRRectX(rect), IRRectHeight(rect) - bottomRightRadius - IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + IRRectX(rect), IRRectHeight(rect) + IRRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(IRRectX(rect), arrowHeight + topLeftRadius + IRRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
    }
    
    [bezierPath closePath];
    return bezierPath;
}

@end
