//
//  IRPopupMenuPath.h
//  IRPopupMenu
//
//  Created by Phil on 2019/7/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, IRPopupMenuArrowDirection) {
    IRPopupMenuArrowDirectionTop = 0,  //箭头朝上
    IRPopupMenuArrowDirectionBottom,   //箭头朝下
    IRPopupMenuArrowDirectionLeft,     //箭头朝左
    IRPopupMenuArrowDirectionRight,    //箭头朝右
    IRPopupMenuArrowDirectionCircle,
    IRPopupMenuArrowDirectionNone      //没有箭头
};

@interface IRPopupMenuPath : NSObject

+ (CAShapeLayer *)ir_maskLayerWithRect:(CGRect)rect
                            rectCorner:(UIRectCorner)rectCorner
                          cornerRadius:(CGFloat)cornerRadius
                            arrowWidth:(CGFloat)arrowWidth
                           arrowHeight:(CGFloat)arrowHeight
                         arrowPosition:(CGFloat)arrowPosition
                        arrowDirection:(IRPopupMenuArrowDirection)arrowDirection;

+ (UIBezierPath *)ir_bezierPathWithRect:(CGRect)rect
                             rectCorner:(UIRectCorner)rectCorner
                           cornerRadius:(CGFloat)cornerRadius
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor
                        backgroundColor:(UIColor *)backgroundColor
                             arrowWidth:(CGFloat)arrowWidth
                            arrowHeight:(CGFloat)arrowHeight
                          arrowPosition:(CGFloat)arrowPosition
                         arrowDirection:(IRPopupMenuArrowDirection)arrowDirection;
@end

NS_ASSUME_NONNULL_END
