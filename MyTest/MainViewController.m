//
//  MainViewController.m
//  MyTest
//
//  Created by 新城集团 on 16-9-18.
//  Copyright (c) 2016年 新城集团. All rights reserved.
//

#import "MainViewController.h"
#import "MainModel.h"
#import "MainCell.h"
#import "FooterView.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView  *tableView;
@property(nonatomic,strong) NSArray *modelArray;
@property(nonatomic,strong)FooterView * footerveiw;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSArray *)modelArray
{
    if(!_modelArray)
    {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"quan.plist" ofType:nil];
        NSArray *dataArray=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tmpArray=[NSMutableArray array];
        for (NSDictionary *dataDic in dataArray) {
            [tmpArray addObject:[MainModel modelWithDict:dataDic]];
        }
        _modelArray=[tmpArray copy];
    }
    return _modelArray;
}


-(FooterView *)footerveiw
{
    if(!_footerveiw)
    {
        _footerveiw=[FooterView footView];
        
        [self.tableView addSubview:_footerveiw];
        
        
    }
    return _footerveiw;
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat maxOffsetY = self.tableView.contentSize.height-self.tableView.frame.size.height;
    CGFloat footerViewHeight=CGRectGetHeight(self.footerveiw.frame);
    
    if(self.tableView.contentOffset.y >maxOffsetY && self.tableView.contentOffset.y<maxOffsetY+footerViewHeight)
    {
        
        [self.footerveiw setStatus:FootViewStatusDragging];
        
    }
    else if(self.tableView.contentOffset.y >=maxOffsetY +footerViewHeight && self.footerveiw.status!=FootViewStatusEndDragging)
    {
        
        [self.footerveiw setStatus:FootViewStatusReadyLoading];
        
    }
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if(self.footerveiw.status ==FootViewStatusReadyLoading)
    {
        [self.footerveiw setStatus:FootViewStatusEndDragging];
        [UIView animateWithDuration:0.2 animations:^
        {
            [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.footerveiw.bounds), 0)];
            
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^
         {
             [self.tableView setContentInset:UIEdgeInsetsZero];
             
         }];
        
    }
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self setTableView:[[UITableView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64)] ];
    
    [self.tableView setDataSource: self];
    [self.tableView  setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    [self.view addSubview:self.tableView];
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.modelArray.count;
        
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell * cell=[tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    [cell updateCellWithModel:self.modelArray[indexPath.row]];
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
