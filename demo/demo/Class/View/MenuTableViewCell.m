//
//  MenuTableViewCell.m
//  demo
//
//  Created by Phil on 2019/7/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (NSString*)identifier{
    return NSStringFromClass([self class]);
}

@end

