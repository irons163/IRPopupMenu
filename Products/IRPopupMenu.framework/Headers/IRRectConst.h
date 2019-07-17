//
//  IRRectConst.h
//  IRPopupMenu
//
//  Created by Phil on 2019/7/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_STATIC_INLINE CGFloat IRRectWidth(CGRect rect)
{
    return rect.size.width;
}

UIKIT_STATIC_INLINE CGFloat IRRectHeight(CGRect rect)
{
    return rect.size.height;
}

UIKIT_STATIC_INLINE CGFloat IRRectX(CGRect rect)
{
    return rect.origin.x;
}

UIKIT_STATIC_INLINE CGFloat IRRectY(CGRect rect)
{
    return rect.origin.y;
}

UIKIT_STATIC_INLINE CGFloat IRRectTop(CGRect rect)
{
    return rect.origin.y;
}

UIKIT_STATIC_INLINE CGFloat IRRectBottom(CGRect rect)
{
    return rect.origin.y + rect.size.height;
}

UIKIT_STATIC_INLINE CGFloat IRRectLeft(CGRect rect)
{
    return rect.origin.x;
}

UIKIT_STATIC_INLINE CGFloat IRRectRight(CGRect rect)
{
    return rect.origin.x + rect.size.width;
}

NS_ASSUME_NONNULL_END
