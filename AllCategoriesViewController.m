//
//  AllCategoriesViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/25.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "AllCategoriesViewController.h"
#import "Public.h"
#import "dashboardViewController.h"
#import "publishViewController.h"
#import "communicateViewController.h"
#import "publishInfoViewController.h"


@interface AllCategoriesViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    
    UICollectionView *collectionView;
    
//    right Views
    UIView *rightColumn1;
    UIView *rightColumn2;
    UIView *rightColumn3;
    UIView *rightColumn4;
    UIView *rightColumn5;
    UIView *rightColumn6;
    UIView *rightColumn7;
    UIView *rightColumn8;
    
}



@end

@implementation AllCategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    
    
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(leftBarBtnClicked)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(-10, 5, screen_width, 20)];
    [label setFont:[UIFont fontWithName:@"-apple-system" size:18]];
    [label setText:@"All Categories"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [button addSubview:label];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
    
    
    
    
//    UIImage *img = [UIImage imageNamed:@"left"];
////    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(leftBarBtnClicked)];
//    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] init];
//    leftItem.title = @"All Categories";
////    leftItem.image = img;
//    leftItem.target = self;
//    leftItem.action = @selector(leftBarBtnClicked);
//    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    
    
    
    
    [self initData];
    [self setNav];
    [self initTableView];
    
    
    // Do any additional setup after loading the view.
}


-(void)leftBarBtnClicked{
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:1];
}

-(void)initData{
    
    
}


-(void)setNav{
    
    UIView *leftColumn = [[UIView alloc]initWithFrame:CGRectMake(0, 65, 110, screen_height)];
    leftColumn.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
//    leftColumn.backgroundColor = UIColor.blueColor;
    [self.view addSubview:leftColumn];
//
//    UIButton *fashionBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 110, 40)];
//    fashionBtn.backgroundColor = UIColor.whiteColor;
//    [fashionBtn setTitle:@"Fashion" forState:UIControlStateNormal];
//    [fashionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    fashionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:fashionBtn];
//
//
//    UIButton *sportBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 50, 110, 40)];
//    sportBtn.backgroundColor = UIColor.whiteColor;
//    [sportBtn setTitle:@"Sport" forState:UIControlStateNormal];
//    [sportBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    sportBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:sportBtn];
//
//
//    UIButton *domeSerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 95, 110, 40)];
//    domeSerBtn.backgroundColor = UIColor.whiteColor;
//    [domeSerBtn setTitle:@"Domestic Service" forState:UIControlStateNormal];
//    [domeSerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    domeSerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    domeSerBtn.titleLabel.numberOfLines = 2;
//    [leftColumn addSubview:domeSerBtn];
//
//    UIButton *dlBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 140, 110, 40)];
//    dlBtn.backgroundColor = UIColor.whiteColor;
//    [dlBtn setTitle:@"Daliy Life" forState:UIControlStateNormal];
//    [dlBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    dlBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:dlBtn];
//
//    UIButton *educationBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 185, 110, 40)];
//    educationBtn.backgroundColor = UIColor.whiteColor;
//    [educationBtn setTitle:@"Education" forState:UIControlStateNormal];
//    [educationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    educationBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:educationBtn];
//
//    UIButton *consultBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 230, 110, 40)];
//    consultBtn.backgroundColor = UIColor.whiteColor;
//    [consultBtn setTitle:@"Consult" forState:UIControlStateNormal];
//    [consultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    consultBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:consultBtn];
//
//    UIButton *tourBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 275, 110, 40)];
//    tourBtn.backgroundColor = UIColor.whiteColor;
//    [tourBtn setTitle:@"Tourism" forState:UIControlStateNormal];
//    [tourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    tourBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:tourBtn];
//
//
//    UIButton *hireBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 320, 110, 40)];
//    hireBtn.backgroundColor = UIColor.whiteColor;
//    [hireBtn setTitle:@"Hire" forState:UIControlStateNormal];
//    [hireBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    hireBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [leftColumn addSubview:hireBtn];
//
//
//    if(fashionBtn.isSelected){
//
//    }
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 10, 110, screen_height) collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [collectionView setBackgroundColor:[UIColor clearColor]];
    
    [leftColumn addSubview:collectionView];
    
    
    // right display
    
//    1.
    rightColumn1 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 160)];
    rightColumn1.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:rightColumn1];
    
    UIButton *makeUp = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    makeUp.backgroundColor = [UIColor whiteColor];
    [makeUp setTitle:@"Makeup" forState:UIControlStateNormal];
    [makeUp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    makeUp.titleLabel.font = [UIFont systemFontOfSize:14];
    makeUp.layer.borderWidth = 1;
    makeUp.layer.borderColor = UIColor.grayColor.CGColor;
    makeUp.layer.cornerRadius = 5;
    [makeUp addTarget:self action:@selector(makeUpClicked) forControlEvents:UIControlEventTouchUpInside];
    [rightColumn1 addSubview:makeUp];
    
    
    UIButton *hair = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    hair.backgroundColor = [UIColor whiteColor];
    [hair setTitle:@"Hair" forState:UIControlStateNormal];
    [hair setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    hair.titleLabel.font = [UIFont systemFontOfSize:14];
    hair.layer.borderWidth = 1;
    hair.layer.borderColor = UIColor.grayColor.CGColor;
    hair.layer.cornerRadius = 5;
    [rightColumn1 addSubview:hair];
    
    UIButton *manicure = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    manicure.backgroundColor = [UIColor whiteColor];
    [manicure setTitle:@"Manicure" forState:UIControlStateNormal];
    [manicure setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    manicure.titleLabel.font = [UIFont systemFontOfSize:14];
    manicure.layer.borderWidth = 1;
    manicure.layer.borderColor = UIColor.grayColor.CGColor;
    manicure.layer.cornerRadius = 5;
    [rightColumn1 addSubview:manicure];
    
    
    UIButton *Film = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    Film.backgroundColor = [UIColor whiteColor];
    [Film setTitle:@"Film" forState:UIControlStateNormal];
    [Film setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Film.titleLabel.font = [UIFont systemFontOfSize:14];
    Film.layer.borderWidth = 1;
    Film.layer.borderColor = UIColor.grayColor.CGColor;
    Film.layer.cornerRadius = 5;
    [rightColumn1 addSubview:Film];
    
    
    UIButton *takeAPic = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 99, 26)];
    takeAPic.backgroundColor = [UIColor whiteColor];
    [takeAPic setTitle:@"Take a picture" forState:UIControlStateNormal];
    [takeAPic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    takeAPic.titleLabel.font = [UIFont systemFontOfSize:14];
    takeAPic.layer.borderWidth = 1;
    takeAPic.layer.borderColor = UIColor.grayColor.CGColor;
    takeAPic.layer.cornerRadius = 5;
    [rightColumn1 addSubview:takeAPic];
    
    
    UIButton *slimDown = [[UIButton alloc]initWithFrame:CGRectMake(141, 85, 99, 26)];
    slimDown.backgroundColor = [UIColor whiteColor];
    [slimDown setTitle:@"Slim Down" forState:UIControlStateNormal];
    [slimDown setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    slimDown.titleLabel.font = [UIFont systemFontOfSize:14];
    slimDown.layer.borderWidth = 1;
    slimDown.layer.borderColor = UIColor.grayColor.CGColor;
    slimDown.layer.cornerRadius = 5;
    [rightColumn1 addSubview:slimDown];
    
    
    UIButton *modelling = [[UIButton alloc]initWithFrame:CGRectMake(17, 124, 99, 26)];
    modelling.backgroundColor = [UIColor whiteColor];
    [modelling setTitle:@"Modelling" forState:UIControlStateNormal];
    [modelling setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    modelling.titleLabel.font = [UIFont systemFontOfSize:14];
    modelling.layer.borderWidth = 1;
    modelling.layer.borderColor = UIColor.grayColor.CGColor;
    modelling.layer.cornerRadius = 5;
    [rightColumn1 addSubview:modelling];
    
    
    UIButton *skinCare = [[UIButton alloc]initWithFrame:CGRectMake(141, 124, 99, 26)];
    skinCare.backgroundColor = [UIColor whiteColor];
    [skinCare setTitle:@"Skin Care" forState:UIControlStateNormal];
    [skinCare setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    skinCare.titleLabel.font = [UIFont systemFontOfSize:14];
    skinCare.layer.borderWidth = 1;
    skinCare.layer.borderColor = UIColor.grayColor.CGColor;
    skinCare.layer.cornerRadius = 5;
    [rightColumn1 addSubview:skinCare];
    
    
    
    //    2.
    rightColumn2 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 160)];
    rightColumn2.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rightColumn2];
    
    UIButton *swim = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    swim.backgroundColor = [UIColor whiteColor];
    [swim setTitle:@"Swim" forState:UIControlStateNormal];
    [swim setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    swim.titleLabel.font = [UIFont systemFontOfSize:14];
    swim.layer.borderWidth = 1;
    swim.layer.borderColor = UIColor.grayColor.CGColor;
    swim.layer.cornerRadius = 5;
    [rightColumn2 addSubview:swim];
    
    
    UIButton *run = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    run.backgroundColor = [UIColor whiteColor];
    [run setTitle:@"Run" forState:UIControlStateNormal];
    [run setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    run.titleLabel.font = [UIFont systemFontOfSize:14];
    run.layer.borderWidth = 1;
    run.layer.borderColor = UIColor.grayColor.CGColor;
    run.layer.cornerRadius = 5;
    [rightColumn2 addSubview:run];
    
    UIButton *basketball = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    basketball.backgroundColor = [UIColor whiteColor];
    [basketball setTitle:@"Basketball" forState:UIControlStateNormal];
    [basketball setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    basketball.titleLabel.font = [UIFont systemFontOfSize:14];
    basketball.layer.borderWidth = 1;
    basketball.layer.borderColor = UIColor.grayColor.CGColor;
    basketball.layer.cornerRadius = 5;
    [rightColumn2 addSubview:basketball];
    
    
    UIButton *footBall = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    footBall.backgroundColor = [UIColor whiteColor];
    [footBall setTitle:@"Football" forState:UIControlStateNormal];
    [footBall setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    footBall.titleLabel.font = [UIFont systemFontOfSize:14];
    footBall.layer.borderWidth = 1;
    footBall.layer.borderColor = UIColor.grayColor.CGColor;
    footBall.layer.cornerRadius = 5;
    [rightColumn2 addSubview:footBall];
    
    
    UIButton *badminton = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 99, 26)];
    badminton.backgroundColor = [UIColor whiteColor];
    [badminton setTitle:@"Badminton" forState:UIControlStateNormal];
    [badminton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    badminton.titleLabel.font = [UIFont systemFontOfSize:14];
    badminton.layer.borderWidth = 1;
    badminton.layer.borderColor = UIColor.grayColor.CGColor;
    badminton.layer.cornerRadius = 5;
    [rightColumn2 addSubview:badminton];
    
    
    UIButton *yoga = [[UIButton alloc]initWithFrame:CGRectMake(141, 85, 99, 26)];
    yoga.backgroundColor = [UIColor whiteColor];
    [yoga setTitle:@"Yoga" forState:UIControlStateNormal];
    [yoga setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    yoga.titleLabel.font = [UIFont systemFontOfSize:14];
    yoga.layer.borderWidth = 1;
    yoga.layer.borderColor = UIColor.grayColor.CGColor;
    yoga.layer.cornerRadius = 5;
    [rightColumn2 addSubview:yoga];
    
    
    UIButton *boxing = [[UIButton alloc]initWithFrame:CGRectMake(17, 124, 99, 26)];
    boxing.backgroundColor = [UIColor whiteColor];
    [boxing setTitle:@"Boxing" forState:UIControlStateNormal];
    [boxing setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    boxing.titleLabel.font = [UIFont systemFontOfSize:14];
    boxing.layer.borderWidth = 1;
    boxing.layer.borderColor = UIColor.grayColor.CGColor;
    boxing.layer.cornerRadius = 5;
    [rightColumn2 addSubview:boxing];
    
    
    UIButton *other = [[UIButton alloc]initWithFrame:CGRectMake(141, 124, 99, 26)];
    other.backgroundColor = [UIColor whiteColor];
    [other setTitle:@"Other" forState:UIControlStateNormal];
    [other setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    other.titleLabel.font = [UIFont systemFontOfSize:14];
    other.layer.borderWidth = 1;
    other.layer.borderColor = UIColor.grayColor.CGColor;
    other.layer.cornerRadius = 5;
    [rightColumn2 addSubview:other];
    
    
    
    
//    3.
    rightColumn3 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 122)];
    rightColumn3.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:rightColumn3];
    
    UIButton *ElectricM = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 221, 26)];
    ElectricM.backgroundColor = [UIColor whiteColor];
    [ElectricM setTitle:@"Electrical maintenance" forState:UIControlStateNormal];
    [ElectricM setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ElectricM.titleLabel.font = [UIFont systemFontOfSize:14];
    ElectricM.layer.borderWidth = 1;
    ElectricM.layer.borderColor = UIColor.grayColor.CGColor;
    ElectricM.layer.cornerRadius = 5;
    [rightColumn3 addSubview:ElectricM];
    
    UIButton *clean = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    clean.backgroundColor = [UIColor whiteColor];
    [clean setTitle:@"Clean" forState:UIControlStateNormal];
    [clean setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clean.titleLabel.font = [UIFont systemFontOfSize:14];
    clean.layer.borderWidth = 1;
    clean.layer.borderColor = UIColor.grayColor.CGColor;
    clean.layer.cornerRadius = 5;
    [rightColumn3 addSubview:clean];
    
    
    UIButton *move = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    move.backgroundColor = [UIColor whiteColor];
    [move setTitle:@"Move" forState:UIControlStateNormal];
    [move setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    move.titleLabel.font = [UIFont systemFontOfSize:14];
    move.layer.borderWidth = 1;
    move.layer.borderColor = UIColor.grayColor.CGColor;
    move.layer.cornerRadius = 5;
    [rightColumn3 addSubview:move];
    
    
    UIButton *itemStorage = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 99, 26)];
    itemStorage.backgroundColor = [UIColor whiteColor];
    [itemStorage setTitle:@"Item storage" forState:UIControlStateNormal];
    [itemStorage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    itemStorage.titleLabel.font = [UIFont systemFontOfSize:14];
    itemStorage.layer.borderWidth = 1;
    itemStorage.layer.borderColor = UIColor.grayColor.CGColor;
    itemStorage.layer.cornerRadius = 5;
    [rightColumn3 addSubview:itemStorage];
    
    
    UIButton *other_3 = [[UIButton alloc]initWithFrame:CGRectMake(141, 85, 99, 26)];
    other_3.backgroundColor = [UIColor whiteColor];
    [other_3 setTitle:@"Other" forState:UIControlStateNormal];
    [other_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    other_3.titleLabel.font = [UIFont systemFontOfSize:14];
    other_3.layer.borderWidth = 1;
    other_3.layer.borderColor = UIColor.grayColor.CGColor;
    other_3.layer.cornerRadius = 5;
    [rightColumn3 addSubview:other_3];
    
//    4.
    rightColumn4 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 122)];
    rightColumn4.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rightColumn1];
    
    UIButton *tickets = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    tickets.backgroundColor = [UIColor whiteColor];
    [tickets setTitle:@"Tickets" forState:UIControlStateNormal];
    [tickets setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tickets.titleLabel.font = [UIFont systemFontOfSize:14];
    tickets.layer.borderWidth = 1;
    tickets.layer.borderColor = UIColor.grayColor.CGColor;
    tickets.layer.cornerRadius = 5;
    [rightColumn4 addSubview:tickets];
    
    
    UIButton *NutritionM = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    NutritionM.backgroundColor = [UIColor whiteColor];
    [NutritionM setTitle:@"Nutrition mix" forState:UIControlStateNormal];
    [NutritionM setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    NutritionM.titleLabel.font = [UIFont systemFontOfSize:14];
    NutritionM.layer.borderWidth = 1;
    NutritionM.layer.borderColor = UIColor.grayColor.CGColor;
    NutritionM.layer.cornerRadius = 5;
    [rightColumn4 addSubview:NutritionM];
    
    UIButton *seating = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    seating.backgroundColor = [UIColor whiteColor];
    [seating setTitle:@"Seating" forState:UIControlStateNormal];
    [seating setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    seating.titleLabel.font = [UIFont systemFontOfSize:14];
    seating.layer.borderWidth = 1;
    seating.layer.borderColor = UIColor.grayColor.CGColor;
    seating.layer.cornerRadius = 5;
    [rightColumn4 addSubview:seating];
    
    
    UIButton *queue = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    queue.backgroundColor = [UIColor whiteColor];
    [queue setTitle:@"Queue" forState:UIControlStateNormal];
    [queue setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    queue.titleLabel.font = [UIFont systemFontOfSize:14];
    queue.layer.borderWidth = 1;
    queue.layer.borderColor = UIColor.grayColor.CGColor;
    queue.layer.cornerRadius = 5;
    [rightColumn4 addSubview:queue];
    
    
    UIButton *runningRrr = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 222, 26)];
    runningRrr.backgroundColor = [UIColor whiteColor];
    [runningRrr setTitle:@"Running errands" forState:UIControlStateNormal];
    [runningRrr setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    runningRrr.titleLabel.font = [UIFont systemFontOfSize:14];
    runningRrr.layer.borderWidth = 1;
    runningRrr.layer.borderColor = UIColor.grayColor.CGColor;
    runningRrr.layer.cornerRadius = 5;
    [rightColumn4 addSubview:runningRrr];
    
    
//    5
    rightColumn5 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 160)];
    rightColumn5.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rightColumn1];
    
    UIButton *music = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    music.backgroundColor = [UIColor whiteColor];
    [music setTitle:@"Music" forState:UIControlStateNormal];
    [music setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    music.titleLabel.font = [UIFont systemFontOfSize:14];
    music.layer.borderWidth = 1;
    music.layer.borderColor = UIColor.grayColor.CGColor;
    music.layer.cornerRadius = 5;
    [rightColumn5 addSubview:music];
    
    
    UIButton *dance = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    dance.backgroundColor = [UIColor whiteColor];
    [dance setTitle:@"Dance" forState:UIControlStateNormal];
    [dance setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    dance.titleLabel.font = [UIFont systemFontOfSize:14];
    dance.layer.borderWidth = 1;
    dance.layer.borderColor = UIColor.grayColor.CGColor;
    dance.layer.cornerRadius = 5;
    [rightColumn5 addSubview:dance];
    
    UIButton *art = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    art.backgroundColor = [UIColor whiteColor];
    [art setTitle:@"Art" forState:UIControlStateNormal];
    [art setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    art.titleLabel.font = [UIFont systemFontOfSize:14];
    art.layer.borderWidth = 1;
    art.layer.borderColor = UIColor.grayColor.CGColor;
    art.layer.cornerRadius = 5;
    [rightColumn5 addSubview:art];
    
    
    UIButton *language = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    language.backgroundColor = [UIColor whiteColor];
    [language setTitle:@"Language" forState:UIControlStateNormal];
    [language setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    language.titleLabel.font = [UIFont systemFontOfSize:14];
    language.layer.borderWidth = 1;
    language.layer.borderColor = UIColor.grayColor.CGColor;
    language.layer.cornerRadius = 5;
    [rightColumn5 addSubview:language];
    
    
    UIButton *studyAbroad = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 99, 26)];
    studyAbroad.backgroundColor = [UIColor whiteColor];
    [studyAbroad setTitle:@"Study abroad" forState:UIControlStateNormal];
    [studyAbroad setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    studyAbroad.titleLabel.font = [UIFont systemFontOfSize:14];
    studyAbroad.layer.borderWidth = 1;
    studyAbroad.layer.borderColor = UIColor.grayColor.CGColor;
    studyAbroad.layer.cornerRadius = 5;
    [rightColumn5 addSubview:studyAbroad];
    
    
    UIButton *training = [[UIButton alloc]initWithFrame:CGRectMake(141, 85, 99, 26)];
    training.backgroundColor = [UIColor whiteColor];
    [training setTitle:@"Training" forState:UIControlStateNormal];
    [training setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    training.titleLabel.font = [UIFont systemFontOfSize:14];
    training.layer.borderWidth = 1;
    training.layer.borderColor = UIColor.grayColor.CGColor;
    training.layer.cornerRadius = 5;
    [rightColumn5 addSubview:training];
    
    
    UIButton *homeTutor = [[UIButton alloc]initWithFrame:CGRectMake(17, 124, 99, 26)];
    homeTutor.backgroundColor = [UIColor whiteColor];
    [homeTutor setTitle:@"Home tutoring" forState:UIControlStateNormal];
    [homeTutor setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    homeTutor.titleLabel.font = [UIFont systemFontOfSize:14];
    homeTutor.layer.borderWidth = 1;
    homeTutor.layer.borderColor = UIColor.grayColor.CGColor;
    homeTutor.layer.cornerRadius = 5;
    [rightColumn5 addSubview:homeTutor];
    
    
    UIButton *other_5 = [[UIButton alloc]initWithFrame:CGRectMake(141, 124, 99, 26)];
    other_5.backgroundColor = [UIColor whiteColor];
    [other_5 setTitle:@"Skin Care" forState:UIControlStateNormal];
    [other_5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    other_5.titleLabel.font = [UIFont systemFontOfSize:14];
    other_5.layer.borderWidth = 1;
    other_5.layer.borderColor = UIColor.grayColor.CGColor;
    other_5.layer.cornerRadius = 5;
    [rightColumn5 addSubview:other_5];
    
    
    
//    6
    rightColumn6 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 160)];
    rightColumn6.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rightColumn1];
    
    UIButton *insurance = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    insurance.backgroundColor = [UIColor whiteColor];
    [insurance setTitle:@"Insurance" forState:UIControlStateNormal];
    [insurance setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    insurance.titleLabel.font = [UIFont systemFontOfSize:14];
    insurance.layer.borderWidth = 1;
    insurance.layer.borderColor = UIColor.grayColor.CGColor;
    insurance.layer.cornerRadius = 5;
    [rightColumn6 addSubview:insurance];
    
    
    UIButton *psychology = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    psychology.backgroundColor = [UIColor whiteColor];
    [psychology setTitle:@"Psychology" forState:UIControlStateNormal];
    [psychology setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    psychology.titleLabel.font = [UIFont systemFontOfSize:14];
    psychology.layer.borderWidth = 1;
    psychology.layer.borderColor = UIColor.grayColor.CGColor;
    psychology.layer.cornerRadius = 5;
    [rightColumn6 addSubview:psychology];
    
    UIButton *work = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    work.backgroundColor = [UIColor whiteColor];
    [work setTitle:@"Work" forState:UIControlStateNormal];
    [work setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    work.titleLabel.font = [UIFont systemFontOfSize:14];
    work.layer.borderWidth = 1;
    work.layer.borderColor = UIColor.grayColor.CGColor;
    work.layer.cornerRadius = 5;
    [rightColumn6 addSubview:work];
    
    
    UIButton *law = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    law.backgroundColor = [UIColor whiteColor];
    [law setTitle:@"Law" forState:UIControlStateNormal];
    [law setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    law.titleLabel.font = [UIFont systemFontOfSize:14];
    law.layer.borderWidth = 1;
    law.layer.borderColor = UIColor.grayColor.CGColor;
    law.layer.cornerRadius = 5;
    [rightColumn6 addSubview:law];
    
    
    UIButton *translation = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 99, 26)];
    translation.backgroundColor = [UIColor whiteColor];
    [translation setTitle:@"Translation" forState:UIControlStateNormal];
    [translation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    translation.titleLabel.font = [UIFont systemFontOfSize:14];
    translation.layer.borderWidth = 1;
    translation.layer.borderColor = UIColor.grayColor.CGColor;
    translation.layer.cornerRadius = 5;
    [rightColumn6 addSubview:translation];
    
    
    UIButton *technology = [[UIButton alloc]initWithFrame:CGRectMake(141, 85, 99, 26)];
    technology.backgroundColor = [UIColor whiteColor];
    [technology setTitle:@"Technology" forState:UIControlStateNormal];
    [technology setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    technology.titleLabel.font = [UIFont systemFontOfSize:14];
    technology.layer.borderWidth = 1;
    technology.layer.borderColor = UIColor.grayColor.CGColor;
    technology.layer.cornerRadius = 5;
    [rightColumn6 addSubview:technology];
    
    
    UIButton *other_6 = [[UIButton alloc]initWithFrame:CGRectMake(17, 124, 99, 26)];
    other_6.backgroundColor = [UIColor whiteColor];
    [other_6 setTitle:@"Other" forState:UIControlStateNormal];
    [other_6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    other_6.titleLabel.font = [UIFont systemFontOfSize:14];
    other_6.layer.borderWidth = 1;
    other_6.layer.borderColor = UIColor.grayColor.CGColor;
    other_6.layer.cornerRadius = 5;
    [rightColumn6 addSubview:other_6];
    
    
//    7
    rightColumn7 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 160)];
    rightColumn7.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rightColumn1];
    
    UIButton *guide = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    guide.backgroundColor = [UIColor whiteColor];
    [guide setTitle:@"Guide" forState:UIControlStateNormal];
    [guide setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    guide.titleLabel.font = [UIFont systemFontOfSize:14];
    guide.layer.borderWidth = 1;
    guide.layer.borderColor = UIColor.grayColor.CGColor;
    guide.layer.cornerRadius = 5;
    [rightColumn7 addSubview:guide];
    
    
    UIButton *domestic = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    domestic.backgroundColor = [UIColor whiteColor];
    [domestic setTitle:@"Domestic" forState:UIControlStateNormal];
    [domestic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    domestic.titleLabel.font = [UIFont systemFontOfSize:14];
    domestic.layer.borderWidth = 1;
    domestic.layer.borderColor = UIColor.grayColor.CGColor;
    domestic.layer.cornerRadius = 5;
    [rightColumn7 addSubview:domestic];
    
    UIButton *foreign = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 99, 26)];
    foreign.backgroundColor = [UIColor whiteColor];
    [foreign setTitle:@"Foreign" forState:UIControlStateNormal];
    [foreign setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    foreign.titleLabel.font = [UIFont systemFontOfSize:14];
    foreign.layer.borderWidth = 1;
    foreign.layer.borderColor = UIColor.grayColor.CGColor;
    foreign.layer.cornerRadius = 5;
    [rightColumn7 addSubview:foreign];
    
    
    UIButton *consult = [[UIButton alloc]initWithFrame:CGRectMake(141, 46, 99, 26)];
    consult.backgroundColor = [UIColor whiteColor];
    [consult setTitle:@"Consult" forState:UIControlStateNormal];
    [consult setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    consult.titleLabel.font = [UIFont systemFontOfSize:14];
    consult.layer.borderWidth = 1;
    consult.layer.borderColor = UIColor.grayColor.CGColor;
    consult.layer.cornerRadius = 5;
    [rightColumn7 addSubview:consult];
    
    
    UIButton *other_7 = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 99, 26)];
    other_7.backgroundColor = [UIColor whiteColor];
    [other_7 setTitle:@"Other" forState:UIControlStateNormal];
    [other_7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    other_7.titleLabel.font = [UIFont systemFontOfSize:14];
    other_7.layer.borderWidth = 1;
    other_7.layer.borderColor = UIColor.grayColor.CGColor;
    other_7.layer.cornerRadius = 5;
    [rightColumn7 addSubview:other_7];
    
    
//    8
    rightColumn8 = [[UIView alloc]initWithFrame:CGRectMake(116, 65, 254, 160)];
    rightColumn8.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:rightColumn1];
    
    UIButton *rentCars = [[UIButton alloc]initWithFrame:CGRectMake(17, 13, 99, 26)];
    rentCars.backgroundColor = [UIColor whiteColor];
    [rentCars setTitle:@"Rent cars" forState:UIControlStateNormal];
    [rentCars setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rentCars.titleLabel.font = [UIFont systemFontOfSize:14];
    rentCars.layer.borderWidth = 1;
    rentCars.layer.borderColor = UIColor.grayColor.CGColor;
    rentCars.layer.cornerRadius = 5;
    [rightColumn8 addSubview:rentCars];
    
    
    UIButton *rentClothes = [[UIButton alloc]initWithFrame:CGRectMake(141, 13, 99, 26)];
    rentClothes.backgroundColor = [UIColor whiteColor];
    [rentClothes setTitle:@"Rent clothes" forState:UIControlStateNormal];
    [rentClothes setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rentClothes.titleLabel.font = [UIFont systemFontOfSize:14];
    rentClothes.layer.borderWidth = 1;
    rentClothes.layer.borderColor = UIColor.grayColor.CGColor;
    rentClothes.layer.cornerRadius = 5;
    [rightColumn8 addSubview:rentClothes];
    
    UIButton *RentalOfPre = [[UIButton alloc]initWithFrame:CGRectMake(17, 46, 223, 26)];
    RentalOfPre.backgroundColor = [UIColor whiteColor];
    [RentalOfPre setTitle:@"Rental of premises" forState:UIControlStateNormal];
    [RentalOfPre setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    RentalOfPre.titleLabel.font = [UIFont systemFontOfSize:14];
    RentalOfPre.layer.borderWidth = 1;
    RentalOfPre.layer.borderColor = UIColor.grayColor.CGColor;
    RentalOfPre.layer.cornerRadius = 5;
    [rightColumn8 addSubview:RentalOfPre];
    
    
    UIButton *rentalElecPro = [[UIButton alloc]initWithFrame:CGRectMake(17, 85, 223, 26)];
    rentalElecPro.backgroundColor = [UIColor whiteColor];
    [rentalElecPro setTitle:@"Rental Electronic Products" forState:UIControlStateNormal];
    [rentalElecPro setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rentalElecPro.titleLabel.font = [UIFont systemFontOfSize:14];
    rentalElecPro.layer.borderWidth = 1;
    rentalElecPro.layer.borderColor = UIColor.grayColor.CGColor;
    rentalElecPro.layer.cornerRadius = 5;
    [rightColumn8 addSubview:rentalElecPro];
    
    
    UIButton *other_8 = [[UIButton alloc]initWithFrame:CGRectMake(17, 124, 99, 26)];
    other_8.backgroundColor = [UIColor whiteColor];
    [other_8 setTitle:@"Other" forState:UIControlStateNormal];
    [other_8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    other_8.titleLabel.font = [UIFont systemFontOfSize:14];
    other_8.layer.borderWidth = 1;
    other_8.layer.borderColor = UIColor.grayColor.CGColor;
    other_8.layer.cornerRadius = 5;
    [rightColumn8 addSubview:other_8];
    
    // right display
    
    
}




//Collection View
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor whiteColor];
    
    NSArray *leftColumnName = [[NSArray alloc] initWithObjects:@"Fashion", @"Sport", @"Domestic Service", @"Daily Life", @"Education", @"Consult", @"Tourism", @"Hire", nil];
    
    UILabel *cellLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 50)];
    cellLable.textAlignment = NSTextAlignmentCenter;
    cellLable.numberOfLines = 2;
    [cellLable setText:[NSString stringWithFormat:@"%@", [leftColumnName objectAtIndex:indexPath.row]]];
    [cell.contentView addSubview:cellLable];
    
//    preSelect
    NSIndexPath *indexPathForFirstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [self->collectionView selectItemAtIndexPath:indexPathForFirstRow animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    [self collectionView:self->collectionView didSelectItemAtIndexPath:indexPathForFirstRow];
//    if(indexPath.row == 0){
//        cell.backgroundColor = [UIColor colorWithRed:1 green:0.75 blue:0.38 alpha:1];
//    }
    
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(110, 50);
}

//Select Item
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did SelectItem %ld-%ld",(long)indexPath.section,(long)indexPath.row);
    
    UICollectionViewCell *cell = [self->collectionView cellForItemAtIndexPath:indexPath];
    
//    cell.layer.borderColor = [UIColor blueColor].CGColor;
//    cell.layer.borderWidth = 3.0f;
    cell.backgroundColor = [UIColor colorWithRed:1 green:0.75 blue:0.38 alpha:1];
    
    //    change right views:
    [rightColumn1 removeFromSuperview];
    [rightColumn2 removeFromSuperview];
    [rightColumn3 removeFromSuperview];
    [rightColumn4 removeFromSuperview];
    [rightColumn5 removeFromSuperview];
    [rightColumn6 removeFromSuperview];
    [rightColumn7 removeFromSuperview];
    [rightColumn8 removeFromSuperview];
    if(indexPath.row == 0){
        
        [self.view addSubview:rightColumn1];
        
    }else if(indexPath.row == 1){
        [self.view addSubview:rightColumn2];
    }else if(indexPath.row == 2){
        [self.view addSubview:rightColumn3];
    }else if(indexPath.row == 3){
        [self.view addSubview:rightColumn4];
    }else if(indexPath.row == 4){
        [self.view addSubview:rightColumn5];
    }else if(indexPath.row == 5){
        [self.view addSubview:rightColumn6];
    }else if(indexPath.row == 6){
        [self.view addSubview:rightColumn7];
    }else if(indexPath.row == 7){
        [self.view addSubview:rightColumn8];
    }
    
}

// De Select Item...
- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did De selectItem %ld-%ld",(long)indexPath.section,(long)indexPath.row);
    
    UICollectionViewCell *cell = [self->collectionView cellForItemAtIndexPath:indexPath];
    
//    cell.layer.borderColor = nil;
//    cell.layer.borderWidth = 0.0f;
    cell.backgroundColor = [UIColor whiteColor];
}


-(void)makeUpClicked{
    publishInfoViewController *publishInfo = [[publishInfoViewController alloc]init];
    [self.navigationController pushViewController:publishInfo animated:YES];
}





//Collection View


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
