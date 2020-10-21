//
//  loginViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/30.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "loginViewController.h"
#import "Public.h"
#import "AppDelegate.h"
#import "dashboardViewController.h"
#import "registerViewController.h"
#import <AFNetworking.h>

@interface loginViewController ()

@end

@implementation loginViewController{
    UITextField *email;
    UITextField *password;
    NSString *emailString;
    NSString *passwordString;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    
    
    
    [self initData];
    [self setNav];
    [self initTableView];
    [self mangeNet];
    // Do any additional setup after loading the view.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initData{
    
}


-(void)setNav{
    
    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(136, 158, 100, 100)];
    profileImageView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    profileImageView.image = [UIImage imageNamed:@"user_login.png"];
    profileImageView.layer.borderWidth = 0.5;
    profileImageView.layer.borderColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1].CGColor;
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2;
    profileImageView.layer.masksToBounds = YES;
    [self.view addSubview:profileImageView];
    
//    email + password
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, screen_width, 150)];
    [self.view addSubview:inputView];
    
    email = [[UITextField alloc] initWithFrame:CGRectMake(30, 10, screen_width-60, 30)];
    email.textAlignment = NSTextAlignmentCenter;
    email.textColor = [UIColor blackColor];
    email.backgroundColor = [UIColor whiteColor];
    CALayer *borderEmail = [CALayer layer];
    CGFloat borderWidthEmail = 1;
    borderEmail.borderColor = [UIColor darkGrayColor].CGColor;
    borderEmail.frame = CGRectMake(0, email.frame.size.height - borderWidthEmail, email.frame.size.width, email.frame.size.height);
    borderEmail.borderWidth = borderWidthEmail;
    [email.layer addSublayer:borderEmail];
    email.layer.masksToBounds = YES;
    email.clearButtonMode = UITextFieldViewModeWhileEditing;
    email.returnKeyType = UIReturnKeyDone;
    email.autocorrectionType = UITextAutocorrectionTypeNo;
    
    if ([email respondsToSelector:@selector(setAttributedPlaceholder:)]) {
    
//        email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans-Semibold" size:16.0]}];
        email.placeholder = [NSString stringWithFormat:@"Email"];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
    }
    email.keyboardType = UIKeyboardAppearanceDark;
    email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    email.clipsToBounds = YES;
    email.returnKeyType = UIReturnKeyDone;
    email.keyboardType = UIKeyboardTypeEmailAddress;
    email.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
    [inputView addSubview:email];
    
    
    password = [ [UITextField alloc ] initWithFrame:CGRectMake(30, 70, screen_width-60, 30)];
    
    password.textAlignment = NSTextAlignmentCenter;
    password.textColor = [UIColor blackColor];
    password.backgroundColor = [UIColor whiteColor];
    CALayer *borderPassword = [CALayer layer];
    CGFloat borderWidthPassword = 1;
    borderPassword.borderColor = [UIColor darkGrayColor].CGColor;
    borderPassword.frame = CGRectMake(0, email.frame.size.height - borderWidthPassword, email.frame.size.width, email.frame.size.height);
    borderPassword.borderWidth = borderWidthPassword;
    [password.layer addSublayer:borderPassword];
    password.layer.masksToBounds = YES;
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    password.returnKeyType = UIReturnKeyDone;
    if ([password respondsToSelector:@selector(setAttributedPlaceholder:)]) {
//        password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Password", nil) attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans-Semibold" size:16.0]}];
        password.placeholder = [NSString stringWithFormat:@"Password"];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
    }
    password.keyboardType = UIKeyboardAppearanceDark;
    password.clipsToBounds = YES;
    password.secureTextEntry = YES;
    password.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
    
    [inputView addSubview:password];
    
    UIImageView *emailIcon = [[UIImageView alloc]initWithFrame:CGRectMake(65, 10, 25, 26)];
    [emailIcon setImage:[UIImage imageNamed:@"email"]];
    [inputView addSubview:emailIcon];
    
    UIImageView *passwordIcon = [[UIImageView alloc]initWithFrame:CGRectMake(65, 70, 24, 24)];
    [passwordIcon setImage:[UIImage imageNamed:@"password"]];
    [inputView addSubview:passwordIcon];
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(43, 455, 288, 44)];
    loginBtn.backgroundColor = [UIColor colorWithRed:1 green:0.74 blue:0.36 alpha:1];
    loginBtn.layer.borderWidth = 0.5;
    loginBtn.layer.cornerRadius = 20;
    loginBtn.layer.borderColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1].CGColor;
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    loginBtn.titleLabel.textColor = UIColor.whiteColor;
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [loginBtn addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    UITextField *forgotPassword = [[UITextField alloc]initWithFrame:CGRectMake(128, 521, 118, 20)];
    [forgotPassword setText:@"Forgot password?"];
    forgotPassword.textColor = [UIColor grayColor];
    forgotPassword.font = [UIFont systemFontOfSize:14];
    forgotPassword.textAlignment = NSTextAlignmentCenter;
    forgotPassword.userInteractionEnabled = NO;
    [self.view addSubview:forgotPassword];
    
    
    UIButton *registerText = [[UIButton alloc]initWithFrame:CGRectMake(77, screen_height-30, 213, 20)];
    [registerText setTitle:@"Don't have an account? Register" forState:UIControlStateNormal];
    [registerText setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    registerText.titleLabel.font = [UIFont systemFontOfSize:14];
    registerText.titleLabel.textAlignment = NSTextAlignmentCenter;
    [registerText addTarget:self action:@selector(registerTextClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerText];
    
    
    
    
    
    
    
    
    
    
}

-(void)loginBtnClicked{
    
    if([email.text isEqualToString:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Email should not be empty !" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
                                    
    }else{
        if(![self validateEmail:email.text]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Wrong email format!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            if([password.text isEqualToString:@""]){
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"wrong password !" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }else{
                emailString = email.text;
                passwordString = password.text;
                
                emailString = [emailString lowercaseString];
                
                [self checkDetails];
                
                
            }
        }
    }
    
    
    
    
}


-(BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[edu]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; //  return 0;
    return [emailTest evaluateWithObject:candidate];
}

//-(void) checkDetails{
//    check with the Database
//    if(![emailString isEqualToString:@"uway@harvard.edu"]){
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"No user account Exist!" preferredStyle:UIAlertControllerStyleAlert];
//
//        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action) {}];
//        [alert addAction:defaultAction];
//        [self presentViewController:alert animated:YES completion:nil];
//    }else{
//        if(![passwordString isEqualToString:@"uway123456"]){
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Input WRONG password!" preferredStyle:UIAlertControllerStyleAlert];
//
//            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action) {}];
//            [alert addAction:defaultAction];
//            [self presentViewController:alert animated:YES completion:nil];
//        }else{
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            [defaults setObject:emailString forKey:@"userEmail"];
//            [defaults setObject:passwordString forKey:@"userPassword"];
//            [defaults setBool:true forKey:@"LoginStatus"];
//
//
//
//            [self.navigationController popToRootViewControllerAnimated:YES];
    
            
//            AppDelegate *delegate = [[AppDelegate alloc]init];
//            delegate.self.window.rootViewController = delegate.self.rootTabbarCtr;
//
//
//            self.navigationController.navigationBar.alpha = 1;
//            self.navigationController.navigationBar.hidden = NO;
//            self.tabBarController.tabBar.hidden = NO;
//            dashboardViewController *dashboard = [[dashboardViewController alloc] init];
//            dashboard.hidesBottomBarWhenPushed = NO;
//            [self.navigationController pushViewController:dashboard animated:YES];
//            [self.navigationController setHidesBottomBarWhenPushed:NO];
            
//            UIApplication.sharedApplication.delegate.window.rootViewController = UITabBarController.new;
        
            
            
            
            
            
//        }
//    }
    
//    NSString *domainStr = @"http://uway.xibainet.com/console/tool/timestamp";
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", nil];
//
//    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
//
//    [parametersDic setObject:@"email" forKey:emailString];
//    [parametersDic setObject:@"password" forKey:passwordString];
//
//    NSLog(@"一半1");
//
//    [manager POST:domainStr parameters:parametersDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSLog(@"一半成功");
//        NSDictionary * res = responseObject;
//        if (
//
//            [[res allKeys] containsObject: @"code"] &&
//            [[res allKeys] containsObject: @"msg"] &&
//            [[res allKeys] containsObject: @"count"] &&
//            [[res allKeys] containsObject: @"data"]
//            ) {
//            NSInteger code = [(NSString*)res[@"code"] integerValue];
//            if ( code == 200 ) {
////                success(res);
//            } else {
//                NSLog(@"一半3");
////                if (failure) failure(res);
////                else [SVProgressHUD showErrorWithStatus:(NSString*)res[@"msg"]];
//            }
//        } else {
////            NSLog(@"%@ error", url);
////            if (failure) failure(res);
////            else [SVProgressHUD showErrorWithStatus:@"接口异常错误 一半4"];
//        }
//
////        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
////
////
////        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
////        [defaults setObject:self->emailString forKey:@"userEmail"];
////        [defaults setObject:self->passwordString forKey:@"userPassword"];
////        [defaults setBool:true forKey:@"LoginStatus"];
////        [self.navigationController popToRootViewControllerAnimated:YES];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"失败");
//    }];
    
    
//}


-(void)checkDetails{
    
    NSString *url = @"http://uway.xibainet.com/console/tool/timestamp";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", nil];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@ success", url);
        NSDictionary * res = responseObject;
        if (
            [[res allKeys] containsObject: @"code"] &&
            [[res allKeys] containsObject: @"msg"] &&
            [[res allKeys] containsObject: @"count"] &&
            [[res allKeys] containsObject: @"data"]
            ) {
            NSInteger code = [(NSString*)res[@"code"] integerValue];
            if ( code == 200 ) {
                [self successLogin: res];
            } else {
                NSLog(@"%@ error", url);
//                if (failure) failure(res);
//                else [SVProgressHUD showErrorWithStatus:(NSString*)res[@"msg"]];
            }
        } else {
            NSLog(@"%@ error", url);
//            if (failure) failure(res);
//            else [SVProgressHUD showErrorWithStatus:@"接口异常错误"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
//        [SVProgressHUD showErrorWithStatus:@"网络异常错误"];
        NSLog(@"失败%@", err);
    }];
}

-(void)registerTextClicked{
    registerViewController *registerV = [[registerViewController alloc] init];
    [self.navigationController pushViewController:registerV animated:YES];

}

-(void)initTableView{
    
}

-(void)mangeNet{
    // 1.获取网络管理者
    AFNetworkReachabilityManager *netManger=[AFNetworkReachabilityManager sharedManager];
    // 2.网络状态发生变化后调用
    [netManger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                // 检测到网络状态前为此状态
                NSLog(@"网络未知");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"连接不到网络");
                // 提示用户，跳到系统设置页设置网络
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"流量");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"wifi");
            }
                break;
        }
    }];
    // 3.监测网络变化
    [netManger startMonitoring];
}



-(void) successLogin:(NSDictionary *)res{
    
    NSLog(@"登录成功！");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self->emailString forKey:@"userEmail"];
    [defaults setObject:self->passwordString forKey:@"userPassword"];
    [defaults setBool:true forKey:@"LoginStatus"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
