//
//  ViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/7.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "dashboardViewController.h"
#import "Public.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "TYCyclePagerViewCell.h"
#import "loginViewController.h"

@interface dashboardViewController () <UITableViewDataSource, UITableViewDelegate, TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>{
    
    IBOutlet UITableView *tableview;
    NSArray *data;//every element in the array represents a row in the table
    
}
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *datas;
@property(retain,nonatomic) NSArray *tableData;

@property (weak, nonatomic) IBOutlet UISwitch *horCenterSwitch;

@end

@implementation dashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"LoginStatus"]){
        loginViewController *loginV = [[loginViewController alloc]init];
        loginV.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:loginV animated:YES];
        
    }
    
    
    
//    self.tabBarController.tabBar.hidden = NO;
//---
    NSArray *provinces=[[NSArray alloc] initWithObjects:@"Tom",@"William",@"Tom",@"William",@"Tom",@"William",@"Tom",@"William",@"Tom",@"William",@"Tom",@"William",@"Tom",@"William",@"Tom", nil];
    self.tableData = provinces;
    
    tableview.rowHeight = 30;
//---
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    [self initData];
    [self setNav];
    [self initTableView];
    
    
    
    
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initData{
    
}

-(void)setNav{
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = navigationBarColor;
    [self.view addSubview:backView];
//city
    UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cityBtn.frame = CGRectMake(9, 56, 64, 20);
    cityBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [cityBtn setTitle:@"New York" forState:UIControlStateNormal];
    [cityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backView addSubview:cityBtn];
    
//
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cityBtn.frame), 59, 17, 17)];
    [arrowImage setImage:[UIImage imageNamed:@"downArrow_icon"]];
    [backView addSubview:arrowImage];
    
//search view
    
    UISearchBar *myBar = [[UISearchBar alloc] init];
    myBar.frame = CGRectMake(100, 50, 180, 29);
    [backView addSubview:myBar];
//    myBar.showsCancelButton = YES;
//    myBar.layer.borderWidth = 1.0;
    myBar.layer.cornerRadius = 30;
    myBar.layer.shadowColor = UIColor.blackColor.CGColor;
    myBar.layer.shadowOffset = CGSizeMake(2, 2);
    myBar.layer.shadowOpacity = 0.5;
    myBar.layer.shadowRadius = 1;
    [[[[myBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
    [myBar setBackgroundColor:[UIColor clearColor]];
    
    UIButton *cancelButton = [[UIButton alloc] init];
    cancelButton.frame = CGRectMake(300, 52, 53, 25);
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:cancelColor forState:UIControlStateNormal];
    [backView addSubview:cancelButton];
    
    
//cycleViewPage
    
    [self addPagerView];
    [self addPageControl];
    [self loadData];
    
//    menuSection
    UIView *menuSectionView = [[UIView alloc] initWithFrame:CGRectMake(14, 213, 345, 172)];
    menuSectionView.backgroundColor = UIColor.whiteColor;
    menuSectionView.layer.borderWidth = 1;
    menuSectionView.layer.borderColor = UIColor.grayColor.CGColor;
    menuSectionView.layer.cornerRadius = 20;
    
    [self.view addSubview:menuSectionView];
    
    for(int i =0; i<8; i++){
        int x, y;
        if(i<4){
            x = i;
            y = 0;
        }else{
            x = i-4;
            y = 84;
        }
        
        UIView *menuSectionItemView = [[UIView alloc] initWithFrame:CGRectMake(35+80*x, 17+y, 48, 70)];
//        menuSectionItemView.layer.borderWidth = 2;
//        menuSectionItemView.layer.borderColor = UIColor.grayColor.CGColor;
        [menuSectionView addSubview:menuSectionItemView];
        
        
        UIImageView *menuSectionItemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 2, 35, 37)];
        menuSectionItemImageView.backgroundColor = UIColor.whiteColor;
        if(i == 0){
            menuSectionItemImageView.image = [UIImage imageNamed:@"consult_icon"];
        }else if(i == 1){
            menuSectionItemImageView.image = [UIImage imageNamed:@"fashion_icon"];
            
        }else if(i == 2){
            menuSectionItemImageView.image = [UIImage imageNamed:@"consult_icon2"];
            
        }else if(i == 3){
            menuSectionItemImageView.image = [UIImage imageNamed:@"education_icon"];
            
        }else if(i == 4){
            menuSectionItemImageView.image = [UIImage imageNamed:@"home_icon"];
            
        }else if(i == 5){
            menuSectionItemImageView.image = [UIImage imageNamed:@"hire_icon"];
            
        }else if(i == 6){
            menuSectionItemImageView.image = [UIImage imageNamed:@"sports_icon"];
            
        }else{
            menuSectionItemImageView.image = [UIImage imageNamed:@"more_icon"];
        }
        
        
        
        [menuSectionItemView addSubview:menuSectionItemImageView];
        
        
        UITextView *menuSectionItemTextView = [[UITextView alloc] initWithFrame:CGRectMake(-3, 38, 55, 20)];
        if(i == 0){
            menuSectionItemTextView.text = @"Consult";
        }else if(i == 1){
            menuSectionItemTextView.text = @"Fashion";
            
        }else if(i == 2){
            menuSectionItemTextView.text = @"Consult";
            
        }else if(i == 3){
            menuSectionItemTextView.text = @"Education";
            
        }else if(i == 4){
            menuSectionItemTextView.text = @"Daily Life";
            
        }else if(i == 5){
            menuSectionItemTextView.text = @"Hire";
            
        }else if(i == 6){
            menuSectionItemTextView.text = @"Sports";
            
        }else{
            menuSectionItemTextView.text = @"more";
        }
        menuSectionItemTextView.textAlignment = NSTextAlignmentCenter;
        [menuSectionItemView addSubview:menuSectionItemTextView];
        
//        NavigationBar
        
        UIView *navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 395, screen_width, 22)];
//        navigationBar.layer.borderWidth = 1;
//        navigationBar.layer.borderColor = UIColor.grayColor.CGColor;
        
        for(int i = 0; i<5; i++){
            UITextView *navigationBarTextView = [[UITextView alloc] initWithFrame:CGRectMake(5+80*i, 0, 83, 22)];
            if(i == 0){
                navigationBarTextView.text = @"Recommend";
            }else if(i == 1){
                navigationBarTextView.text = @"School";
            }else if(i == 2){
                navigationBarTextView.text = @"Nearby";
            }else if(i == 3){
                navigationBarTextView.text = @"Now";
            }else{
                navigationBarTextView.text = @"Hot";
            }
        
            [navigationBar addSubview:navigationBarTextView];
            
        }
        [self.view addSubview:navigationBar];
    }
    
    

    
}

- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]initWithFrame:CGRectMake(14, 99, 342, 104)];
    
    pagerView.layer.borderWidth = 5;
    pagerView.layer.cornerRadius = 20;
    pagerView.layer.masksToBounds = YES;
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    pagerView.layer.borderColor = UIColor.whiteColor.CGColor;
    // registerClass or registerNib
    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:pagerView];
    _pagerView = pagerView;
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]initWithFrame:CGRectMake(156, 80, 39, 5)];
    //pageControl.numberOfPages = _datas.count;
    pageControl.currentPageIndicatorSize = CGSizeMake(8, 8);
    //    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
    //    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
    //    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [_pagerView addSubview:pageControl];
    _pageControl = pageControl;
}
- (void)loadData {
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 3; ++i) {
        if (i == 0) {
            [datas addObject:[UIColor redColor]];
            continue;
        }
        [datas addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0]];
    }
    _datas = [datas copy];
    _pageControl.numberOfPages = _datas.count;
    [_pagerView reloadData];
    //[_pagerView scrollToItemAtIndex:3 animate:YES];
}



#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    cell.backgroundColor = _datas[index];
    cell.label.text = [NSString stringWithFormat:@"index->%ld",index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame)*1, CGRectGetHeight(pageView.frame)*1);
    layout.itemSpacing = 15;
    //layout.minimumAlpha = 0.3;
    layout.itemHorizontalCenter = _horCenterSwitch.isOn;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

#pragma mark - action

//- (IBAction)switchValueChangeAction:(UISwitch *)sender {
//    if (sender.tag == 0) {
//        _pagerView.isInfiniteLoop = sender.isOn;
//        [_pagerView updateData];
//    }else if (sender.tag == 1) {
//        _pagerView.autoScrollInterval = sender.isOn ? 3.0:0;
//    }else if (sender.tag == 2) {
//        _pagerView.layout.itemHorizontalCenter = sender.isOn;
//        [UIView animateWithDuration:0.3 animations:^{
//            [_pagerView setNeedUpdateLayout];
//        }];
//    }
//}

//- (IBAction)sliderValueChangeAction:(UISlider *)sender {
//    if (sender.tag == 0) {
//        _pagerView.layout.itemSize = CGSizeMake(CGRectGetWidth(_pagerView.frame)*sender.value, CGRectGetHeight(_pagerView.frame)*sender.value);
//        [_pagerView setNeedUpdateLayout];
//    }else if (sender.tag == 1) {
//        _pagerView.layout.itemSpacing = 30*sender.value;
//        [_pagerView setNeedUpdateLayout];
//    }else if (sender.tag == 2) {
//        _pageControl.pageIndicatorSize = CGSizeMake(6*(1+sender.value), 6*(1+sender.value));
//        _pageControl.currentPageIndicatorSize = CGSizeMake(8*(1+sender.value), 8*(1+sender.value));
//        _pageControl.pageIndicatorSpaing = (1+sender.value)*10;
//    }
//}

//- (IBAction)buttonAction:(UIButton *)sender {
//    _pagerView.layout.layoutType = sender.tag;
//    [_pagerView setNeedUpdateLayout];
//}

//- (void)pageControlValueChangeAction:(TYPageControl *)sender {
//    NSLog(@"pageControlValueChangeAction: %ld",sender.currentPage);
//}



-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 423, screen_width, screen_height-49-423) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

//    [self setUpTableView];
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellTableIndentifier = @"CellTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellTableIndentifier];
        
    }
    
    UIImage *img = [UIImage imageNamed:@"tachi.png"];
    cell.imageView.image = img;
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"Details";
    
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"title of cell %@", [_tableData objectAtIndex:indexPath.row]);
}







@end
