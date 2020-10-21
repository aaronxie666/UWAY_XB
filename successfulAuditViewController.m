//
//  successfulAuditViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/9/16.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "successfulAuditViewController.h"
#import "Public.h"

@interface successfulAuditViewController ()

@end

@implementation successfulAuditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    
    
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(leftBarBtnClicked)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(-10, 5, screen_width, 20)];
    [label setFont:[UIFont fontWithName:@"-apple-system" size:18]];
    [label setText:@"Successful"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [button addSubview:label];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
    
    [self initData];
    [self setNav];
    [self initTableView];
    
}



-(void) initData{
    
}


-(void) setNav{
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 190, screen_width, 400)];
    contentView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    [self.view addSubview:contentView];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(128, 10, 121, 121)];
    [image setImage:[UIImage imageNamed:@"successfulAudit"]];
    [contentView addSubview:image];
    
    UITextView *Title = [[UITextView alloc]initWithFrame:CGRectMake(0, 140, screen_width, 40)];
    Title.backgroundColor =[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    Title.text = @"Successful Audit";
    Title.textAlignment = NSTextAlignmentCenter;
    [Title setFont:[UIFont systemFontOfSize:18]];
    [contentView addSubview:Title];
    
    UITextView *textInfo = [[UITextView alloc]initWithFrame:CGRectMake(38,200 ,screen_width-76, 100)];
    textInfo.backgroundColor =[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    textInfo.text = @"Your services will be reviewd within 24 hours. Please be patient.";
    textInfo.textColor = UIColor.grayColor;
    textInfo.textAlignment = NSTextAlignmentCenter;
    textInfo.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:textInfo];
    
    
}

-(void) initTableView{
    
}


-(void)leftBarBtnClicked{
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:1];
    
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
