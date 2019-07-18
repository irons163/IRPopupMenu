# IRPopupMenu
##### This project is copy and change from YBPopupMenu. Implemet custom arrow icon.
 * Custom popupMenu 

# 效果图
![(演示效果)](./demo/ScreenShots/demo1.png)
![(演示效果)](./demo/ScreenShots/demo2.png)

# cocoapods支持
  * 只需在`Podfile`中加入`pod 'IRPopupMenu', '~> 1.0.0'`后`pod install`即可

# 最近更新
  * 开放部分私有属性，如`titles`，`images`,`tableView`,`minSpace`等等
  * 点击回调方法有更新（旧的还可以用）
  * 增加可自定义Cell的回调，遇到奇葩需求可以自定义设置（具体使用方法可参考demo）

  
# 上次更新
  * 代码全部重构，不过完全兼容原先的API接口
  * 增加了`IRPopupMenuPriorityDirection`属性，可以设置箭头的第一优先级方向，当将要超过屏幕时会自动反转方向
  * 增加了`rectCorner`属性，可以自定义圆角（当反转时会自动镜像的反转圆角）
  * 可以设置边框颜色，边框粗细等
  * 支持传入`NSAttributedString`
  
# 注意
  1. 当箭头优先级是`IRPopupMenuPriorityDirectionLeft`/`IRPopupMenuPriorityDirectionRight`/`IRPopupMenuPriorityDirectionNone`时需手动设置`arrowPosition`来设置箭头在该行的位置
  2. 边框宽度不宜过粗，影响美观
  3. 推荐使用新的实例化接口

# 使用方法
  * `#import "IRPopupMenu.h"`
  * 方法一 （旧）
  
  ```
  IRPopupMenu * popupMenu = [IRPopupMenu showRelyOnView:sender titles:TITLES icons:ICONS menuWidth:120 delegate:self];
  popupMenu.dismissOnSelected = NO;
  popupMenu.isShowShadow = YES;
  popupMenu...;
  ```
  * 方法二 （推荐）
  
  ```
  [IRPopupMenu showAtPoint:p titles:TITLES icons:nil menuWidth:110 otherSettings:^(IRPopupMenu *popupMenu) {
        popupMenu.dismissOnSelected = NO;
        popupMenu.isShowShadow = YES;
        popupMenu.delegate = self;
        popupMenu.offset = 10;
        popupMenu.type = IRPopupMenuTypeDark;
        popupMenu.rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        popupMenu...;
    }];
  ``` 
  

# 版本支持
  * `xcode7.0+`

