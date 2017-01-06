//
//  MainModel.m
//  MyTest
//
//  Created by 新城集团 on 16-9-18.
//  Copyright (c) 2016年 新城集团. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
   
+(instancetype) modelWithDict:(NSDictionary *)dict
{
    MainModel * model=[[self alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    return model;
    
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
    
}
@end
