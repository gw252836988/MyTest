//
//  MainCell.m
//  MyTest
//
//  Created by 新城集团 on 16-9-19.
//  Copyright (c) 2016年 新城集团. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateCellWithModel:(MainModel*)model
{
    
    [self.iconButton  setTitle:model.icon forState:UIControlStateNormal];
    [self.titleLabel setText:model.title];
    
}

@end
