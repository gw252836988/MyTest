//
//  MainModel.h
//  MyTest
//
//  Created by 新城集团 on 16-9-18.
//  Copyright (c) 2016年 新城集团. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *node;
+(instancetype) modelWithDict:(NSDictionary *)dict;


@end
