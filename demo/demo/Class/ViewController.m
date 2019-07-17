//
//  ViewController.m
//  demo
//
//  Created by Phil on 2019/7/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "ViewController.h"
#import <IRPopupMenu/IRPopupMenu.h>
#import <IRCommonTools/IRCommonToolsImp.h>
#import "MenuTableViewCell.h"

@interface ViewController ()<IRPopupMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showNormalArrowOfPopupMenu:(UIButton*)sender {
    CGPoint position = sender.center;
    position.x = sender.frame.origin.x;
    position.y += sender.frame.size.height;
    CGSize imageSize = CGSizeMake(30, 30);
    UIImage *settingImage = [IRCommonTools imageWithImage:[UIImage imageNamed:@"camera"] scaledToSize:imageSize];
    UIImage *infoImage = [IRCommonTools imageWithImage:[UIImage imageNamed:@"photo"] scaledToSize:imageSize];
    [IRPopupMenu showAtPoint:position titles:@[@"Item1", @"Item2"] icons:@[settingImage, infoImage] menuWidth:250 otherSettings:^(IRPopupMenu *popupMenu) {
        popupMenu.priorityDirection = IRPopupMenuPriorityDirectionTop;
        popupMenu.arrowDirection = IRPopupMenuArrowDirectionTop;
        popupMenu.backColor = [UIColor redColor];
        popupMenu.textColor = [UIColor blueColor];
        popupMenu.dismissOnSelected = NO;
        popupMenu.isShowShadow = YES;
        popupMenu.delegate = self;
        popupMenu.offset = 0;
//        popupMenu.minSpace = 0;
        popupMenu.rectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
        popupMenu.cornerRadius = 6;
    }];
}

- (IBAction)showCustomArrowImageOfPopupMenu:(UIButton*)sender {
    CGPoint position = sender.center;
    position.x = sender.frame.origin.x;
    position.y += sender.frame.size.height;
    CGSize imageSize = CGSizeMake(30, 30);
    UIImage *settingImage = [IRCommonTools imageWithImage:[UIImage imageNamed:@"camera"] scaledToSize:imageSize];
    UIImage *infoImage = [IRCommonTools imageWithImage:[UIImage imageNamed:@"photo"] scaledToSize:imageSize];
    [IRPopupMenu showAtPoint:position titles:@[@"Item1", @"Item2"] icons:@[settingImage, infoImage] menuWidth:250 otherSettings:^(IRPopupMenu *popupMenu) {
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        closeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [popupMenu addSubview:closeButton];
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:popupMenu attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:popupMenu attribute:NSLayoutAttributeTop multiplier:1.0 constant:-14];
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
        left.active = YES;
        bottom.active = YES;
        height.active = YES;
        width.active = YES;
        closeButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        popupMenu.priorityDirection = IRPopupMenuPriorityDirectionNone;
        popupMenu.arrowDirection = IRPopupMenuArrowDirectionNone;
        popupMenu.backColor = [UIColor redColor];
        popupMenu.textColor = [UIColor blueColor];
        popupMenu.dismissOnSelected = NO;
        popupMenu.isShowShadow = YES;
        popupMenu.delegate = self;
        popupMenu.arrowHeight = 0;
        popupMenu.offset = 20;
        popupMenu.minSpace = 0;
        popupMenu.rectCorner = UIRectCornerAllCorners;
        popupMenu.cornerRadius = 10;
    }];
}

#pragma mark - IRPopupMenuDelegate
- (void)irPopupMenu:(IRPopupMenu *)irPopupMenu didSelectedAtIndex:(NSInteger)index {
    [irPopupMenu dismiss];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%ld", index+1] message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (UITableViewCell *)irPopupMenu:(IRPopupMenu *)irPopupMenu cellForRowAtIndex:(NSInteger)index
{
    MenuTableViewCell * cell = [irPopupMenu.tableView dequeueReusableCellWithIdentifier:[MenuTableViewCell identifier]];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:[MenuTableViewCell identifier] owner:self options:nil] firstObject];
    }
    
    cell.titleLabel.text = irPopupMenu.titles[index];
    cell.backgroundColor = [UIColor greenColor];
    cell.titleLabel.textColor = [UIColor blueColor];
    
    if (irPopupMenu.images.count >= index + 1) {
        if ([irPopupMenu.images[index] isKindOfClass:[NSString class]]) {
            cell.iconImageView.image = [UIImage imageNamed:irPopupMenu.images[index]];
        }else if ([irPopupMenu.images[index] isKindOfClass:[UIImage class]]){
            cell.iconImageView.image = irPopupMenu.images[index];
        }else {
            cell.iconImageView.image = nil;
        }
    }else {
        cell.iconImageView.image = nil;
    }
    
    
    return cell;
}


@end
