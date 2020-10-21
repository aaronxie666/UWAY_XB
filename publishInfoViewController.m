//
//  publishInfoViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/9/5.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "publishInfoViewController.h"
#import "Public.h"
#import "publishViewController.h"
#import "successfulAuditViewController.h"

@interface publishInfoViewController ()<UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *tableview;
    NSArray *data;
}

@property (nonatomic, strong) NSArray *datas;
@property(retain,nonatomic) NSArray *tableData;

@end

@implementation publishInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];



    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];

    [button addTarget:self action:@selector(leftBarBtnClicked)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(-10, 5, screen_width, 20)];
    [label setFont:[UIFont fontWithName:@"-apple-system" size:18]];
    [label setText:@"Publish"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [button addSubview:label];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
    
    NSArray *selections=[[NSArray alloc] initWithObjects:@"Deposit",@"Service escription",@"Select Area", nil];
    self.tableData = selections;
    
    tableview.rowHeight = 30;
    
    [self initData];
    [self setNav];
    [self initTableView];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/






-(void)initData{
}

-(void)setNav{
    
    UITextView *itemTitle = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, screen_width, 40)];
    itemTitle.text = @"Swimming Instructor";
    itemTitle.textAlignment = NSTextAlignmentCenter;
    [itemTitle setFont:[UIFont systemFontOfSize:18]];
    CALayer *titleLayer = [[CALayer alloc]init];
    titleLayer.frame = CGRectMake(0, 0, screen_width+5, itemTitle.frame.size.height);
    titleLayer.borderColor = [UIColor grayColor].CGColor;
    titleLayer.borderWidth = 0.5;
    [itemTitle.layer addSublayer:titleLayer];
    [self.view addSubview:itemTitle];
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 110, screen_width, 200)];
    contentView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:contentView];
    
    UITextView *textInfo = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, screen_width-20, 100)];
    textInfo.text = @"I have a good diet plan, improved my eating habits, and improved my quality of life. If you have a problem with that, come to her.";
    textInfo.textAlignment = NSTextAlignmentLeft;
    textInfo.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:textInfo];
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(14, 104, 78, 73)];
    [image1 setImage:[UIImage imageNamed:@"profile.jpg"]];
    [contentView addSubview:image1];
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(98, 104, 78, 73)];
    [image2 setImage:[UIImage imageNamed:@"profile.jpg"]];
    [contentView addSubview:image2];
    
    UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake(182, 104, 78, 73)];
    [image3 setImage:[UIImage imageNamed:@"addPic"]];
    [contentView addSubview:image3];
    
    
    
    UIButton *confirmRelease = [[UIButton alloc]initWithFrame:CGRectMake(6, screen_height-83, 363, 49)];
    confirmRelease.backgroundColor = [UIColor colorWithRed:1 green:0.74 blue:0.36 alpha:1];
    confirmRelease.layer.borderWidth = 0.5;
    confirmRelease.layer.cornerRadius = 20;
    confirmRelease.layer.borderColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1].CGColor;
    [confirmRelease setTitle:@"Confirmation Release" forState:UIControlStateNormal];
    confirmRelease.titleLabel.textColor = UIColor.whiteColor;
    confirmRelease.titleLabel.textAlignment = NSTextAlignmentCenter;
    confirmRelease.titleLabel.font = [UIFont systemFontOfSize:14];
    [confirmRelease addTarget:self action:@selector(confirmReleaseBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmRelease];
}

-(void)confirmReleaseBtnClicked{

    successfulAuditViewController *successfulAuditViewC = [[successfulAuditViewController alloc]init];
    [self.navigationController pushViewController:successfulAuditViewC animated:YES];
    
}

-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 323, screen_width, screen_height-49-423) style:UITableViewStyleGrouped];
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = UIColor.whiteColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
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


-(void)leftBarBtnClicked{
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
