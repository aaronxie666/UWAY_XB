//
//  publishViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/7.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "publishViewController.h"
#import "Public.h"
#import "AllCategoriesViewController.h"


@interface publishViewController ()

@end

@implementation publishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
//        strValueForPublish = @"normal";
        [self initData];
        [self setNav];
        [self initTableView];
    
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        UIViewController *n = [[AllCategoriesViewController alloc]init];
        //    n.view.backgroundColor = [UIColor whiteColor];
        //    n.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:n animated:YES];
        self.hidesBottomBarWhenPushed = YES;
    
    // Do any additional setup after loading the view.
}


-(void)initData{
    
}

-(void)setNav{
    
}

-(void)initTableView{
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
