//
//  communicateViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/7.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "communicateViewController.h"
#import "Public.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "TYCyclePagerViewCell.h"

@interface communicateViewController ()

@end

@implementation communicateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    [self initData];
    [self setNav];
    [self initTableView];
    // Do any additional setup after loading the view.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)initData {
    
}

-(void)setNav{
//    set view area
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 100)];
    backView.backgroundColor = navigationBarColor;
    backView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    [self.view addSubview:backView];
    
//    set search bar
    UISearchBar *myBar = [[UISearchBar alloc] init];
    myBar.frame = CGRectMake(13, 52, 295, 28);
    [backView addSubview:myBar];

    //    myBar.showsCancelButton = YES;
//    myBar.layer.borderWidth = 1.0;
//    myBar.layer.borderColor = UIColor.grayColor.CGColor;
    myBar.layer.cornerRadius = 30;
    myBar.layer.shadowColor = UIColor.blackColor.CGColor;
    myBar.layer.shadowOffset = CGSizeMake(2, 2);
    myBar.layer.shadowOpacity = 0.5;
    myBar.layer.shadowRadius = 1;
    [[[[myBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
    [myBar setBackgroundColor:[UIColor clearColor]];
    
    UIButton *cancelButton = [[UIButton alloc] init];
    cancelButton.frame = CGRectMake(315, 52, 53, 25);
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithRed:1 green:0.83 blue:0.57 alpha:1] forState:UIControlStateNormal];
    [backView addSubview:cancelButton];
    

//        NavigationBar
    
    UIView *navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 110, screen_width, 22)];
    //        navigationBar.layer.borderWidth = 1;
    //        navigationBar.layer.borderColor = UIColor.grayColor.CGColor;
    
    for(int i = 0; i<4; i++){
        UITextView *navigationBarTextView = [[UITextView alloc] initWithFrame:CGRectMake(10+100*i, 0, 100, 22)];
        if(i == 0){
            navigationBarTextView.text = @"Recommend";
        }else if(i == 1){
            navigationBarTextView.text = @"Fashion";
        }else if(i == 2){
            navigationBarTextView.text = @"Sport";
        }else{
            navigationBarTextView.text = @"Service";
        }
        
        [navigationBar addSubview:navigationBarTextView];
        
    }
    [self.view addSubview:navigationBar];
}

-(void)initTableView{
    
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
