//
//  userViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/7.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "userViewController.h"
#import "Public.h"





@interface userViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *tableview;
    NSArray *data;//every element in the array represents a row in the table
    
}

@property(retain,nonatomic) NSArray *tableData;

@end

@implementation userViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *provinces=[[NSArray alloc] initWithObjects:@"Feedback",@"Contact us",@"About us", nil];
    self.tableData = provinces;
    
    tableview.rowHeight = 30;
    
    // Do any additional setup after loading the view.
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


-(void)initData {
    //    set profile view area
    UIView *profileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 270)];
    profileView.backgroundColor = [UIColor colorWithRed:1 green:0.74 blue:0.36 alpha:1];
    [self.view addSubview:profileView];
    
//    contact button
    UIButton *contactBtn = [[UIButton alloc] initWithFrame:CGRectMake(339, 48, 24, 24)];
//    contactBtn.imageView.frame = contactBtn.bounds;
//    contactBtn.imageView.hidden= NO;
    [contactBtn setImage:[UIImage imageNamed:@"setting.png"] forState:UIControlStateNormal];
    [profileView addSubview:contactBtn];
    
//    setting button
    UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(304, 48, 24, 24)];
    [settingBtn setImage:[UIImage imageNamed:@"contact.png"] forState:UIControlStateNormal];
    [profileView addSubview:settingBtn];
    
//    profile image view
    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(136, 60, 102, 104)];
    profileImageView.backgroundColor = UIColor.blackColor;
    profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    [profileView addSubview:profileImageView];
    
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2;
    profileImageView.layer.masksToBounds = YES;
    
    
//    profile name
    UITextView *profileName = [[UITextView alloc] initWithFrame:CGRectMake(143, 163, 103, 35)];
    profileName.text = @"NickName";
    [profileName setFont:[UIFont fontWithName:@"PingFangSC-regular" size:18]];
    profileName.backgroundColor = UIColor.clearColor;
    profileName.textAlignment = NSTextAlignmentCenter;
    [profileView addSubview:profileName];
    
//    sell view
    UIButton *sellBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 221, 24, 24)];
    [sellBtn setImage:[UIImage imageNamed:@"sell.png"] forState:UIControlStateNormal];
    [profileView addSubview:sellBtn];
    
    UITextView *sellText_1 = [[UITextView alloc] initWithFrame:CGRectMake(58, 240, 40, 30)];
    sellText_1.text = @"sell ";
    [sellText_1 setFont:[UIFont fontWithName:@"PingFangSC-regular" size:14]];
    sellText_1.backgroundColor = UIColor.clearColor;
    sellText_1.textAlignment = NSTextAlignmentCenter;
    [profileView addSubview:sellText_1];
    
    UITextView *sellText_2 = [[UITextView alloc] initWithFrame:CGRectMake(78, 240, 44, 30)];
    sellText_2.text = @"78";
    [sellText_2 setFont:[UIFont fontWithName:@"PingFangSC-regular" size:14]];
    sellText_2.backgroundColor = UIColor.clearColor;
    sellText_2.textAlignment = NSTextAlignmentCenter;
    [profileView addSubview:sellText_2];
    
//    order view
    UIButton *orderBtn = [[UIButton alloc] initWithFrame:CGRectMake(278, 221, 24, 24)];
    [orderBtn setImage:[UIImage imageNamed:@"orders.png"] forState:UIControlStateNormal];
    [profileView addSubview:orderBtn];
    
    UITextView *orderText_1 = [[UITextView alloc] initWithFrame:CGRectMake(257, 240, 50, 30)];
    orderText_1.text = @"order ";
    [orderText_1 setFont:[UIFont fontWithName:@"PingFangSC-regular" size:14]];
    orderText_1.backgroundColor = UIColor.clearColor;
    orderText_1.textAlignment = NSTextAlignmentCenter;
    [profileView addSubview:orderText_1];
    
    UITextView *orderText_2 = [[UITextView alloc] initWithFrame:CGRectMake(292, 240, 44, 30)];
    orderText_2.text = @"23";
    [orderText_2 setFont:[UIFont fontWithName:@"PingFangSC-regular" size:14]];
    orderText_2.backgroundColor = UIColor.clearColor;
    orderText_2.textAlignment = NSTextAlignmentCenter;
    [profileView addSubview:orderText_2];
    
    
    
//    navigation view
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(5, 280, screen_width-10, 80)];
    navView.layer.borderWidth = 0.5;
    navView.layer.borderColor = UIColor.grayColor.CGColor;
    navView.layer.cornerRadius = 20;
    [self.view addSubview:navView];
    
    
//
    UIButton *collectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(31, 10, 41, 31)];
    [collectionBtn setImage:[UIImage imageNamed:@"collection"] forState:UIControlStateNormal];
    [navView addSubview:collectionBtn];
    
    UITextView *collectionText = [[UITextView alloc] initWithFrame:CGRectMake(5, 41, 100, 30)];
    collectionText.text = @"My collection";
    [collectionText setFont:[UIFont fontWithName:@"PingFangSC-regular" size:13]];
    collectionText.backgroundColor = UIColor.clearColor;
    collectionText.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:collectionText];
    
//
    UIButton *publishBtn = [[UIButton alloc] initWithFrame:CGRectMake(121, 10, 41, 31)];
    [publishBtn setImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
    [navView addSubview:publishBtn];
    
    UITextView *publishtext = [[UITextView alloc] initWithFrame:CGRectMake(95, 41, 100, 30)];
    publishtext.text = @"Published";
    [publishtext setFont:[UIFont fontWithName:@"PingFangSC-regular" size:13]];
    publishtext.backgroundColor = UIColor.clearColor;
    publishtext.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:publishtext];
    
    
//
    UIButton *couponBtn = [[UIButton alloc] initWithFrame:CGRectMake(211, 10, 36, 27)];
    [couponBtn setImage:[UIImage imageNamed:@"coupon"] forState:UIControlStateNormal];
    [navView addSubview:couponBtn];
    
    UITextView *coupontext = [[UITextView alloc] initWithFrame:CGRectMake(185, 41, 100, 30)];
    coupontext.text = @"My coupon";
    [coupontext setFont:[UIFont fontWithName:@"PingFangSC-regular" size:13]];
    coupontext.backgroundColor = UIColor.clearColor;
    coupontext.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:coupontext];
    
//
    UIButton *activityBtn = [[UIButton alloc] initWithFrame:CGRectMake(301, 10, 36, 30)];
    [activityBtn setImage:[UIImage imageNamed:@"activity"] forState:UIControlStateNormal];
    [navView addSubview:activityBtn];
    
    UITextView *activityText = [[UITextView alloc] initWithFrame:CGRectMake(275, 41, 100, 30)];
    activityText.text = @"My activities";
    [activityText setFont:[UIFont fontWithName:@"PingFangSC-regular" size:13]];
    activityText.backgroundColor = UIColor.clearColor;
    activityText.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:activityText];
    
    
    
//    
    
    
}

-(void)setNav{
    
}

-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 360, screen_width, screen_height-500) style:UITableViewStyleGrouped];
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = UIColor.whiteColor;
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
    cell.detailTextLabel.text = @">";
    
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"title of cell %@", [_tableData objectAtIndex:indexPath.row]);
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
