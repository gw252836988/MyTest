//
//  MainCell.h
//  MyTest
//
//  Created by 新城集团 on 16-9-19.
//  Copyright (c) 2016年 新城集团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"

@interface MainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)updateCellWithModel:(MainModel*)model;

@end
