//
//  registerViewController.m
//  UWAY_XB
//
//  Created by Chang on 2019/9/4.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "registerViewController.h"
#import "Public.h"
#import "loginViewController.h"
#import <AFNetworking.h>

@interface registerViewController ()

@end

@implementation registerViewController{
    UITextField *userName;
    UITextField *email;
    UITextField *password;
    UITextField *confirmPassword;
    NSString *userNameString;
    NSString *emailString;
    NSString *passwordString;
    NSString *confirmPasswordField;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
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
    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(136, 158, 100, 100)];
    profileImageView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    profileImageView.image = [UIImage imageNamed:@"user_login.png"];
    profileImageView.layer.borderWidth = 0.5;
    profileImageView.layer.borderColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1].CGColor;
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2;
    profileImageView.layer.masksToBounds = YES;
    [self.view addSubview:profileImageView];
    
//    inputView
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, screen_width, 250)];
    [self.view addSubview:inputView];
    
    userName = [[UITextField alloc] initWithFrame:CGRectMake(30, 10, screen_width-60, 30)];
    userName.textAlignment = NSTextAlignmentCenter;
    userName.textColor = [UIColor blackColor];
    userName.backgroundColor = [UIColor whiteColor];
    CALayer *borderUserName = [CALayer layer];
    CGFloat borderWidthUserName = 1;
    borderUserName.borderColor = [UIColor darkGrayColor].CGColor;
    borderUserName.frame = CGRectMake(0, userName.frame.size.height-1, screen_width-60, 30);
    borderUserName.borderWidth = borderWidthUserName;
    [userName.layer addSublayer:borderUserName];
    userName.layer.masksToBounds = YES;
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    userName.returnKeyType = UIReturnKeyDone;
    userName.autocorrectionType = UITextAutocorrectionTypeNo;
    
    if ([userName respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        
        //        email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans-Semibold" size:16.0]}];
        userName.placeholder = [NSString stringWithFormat:@"Username"];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
    }
    userName.keyboardType = UIKeyboardAppearanceDark;
    userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    userName.clipsToBounds = YES;
    userName.returnKeyType = UIReturnKeyDone;
    userName.keyboardType = UIKeyboardTypeEmailAddress;
    userName.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];
    [inputView addSubview:userName];
    
    
    email = [[UITextField alloc] initWithFrame:CGRectMake(30, 70, screen_width-60, 30)];
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
    
    
    password = [ [UITextField alloc ] initWithFrame:CGRectMake(30, 130, screen_width-60, 30)];
    
    password.textAlignment = NSTextAlignmentCenter;
    password.textColor = [UIColor blackColor];
    password.backgroundColor = [UIColor whiteColor];
    CALayer *borderPassword = [CALayer layer];
    CGFloat borderWidthPassword = 1;
    borderPassword.borderColor = [UIColor darkGrayColor].CGColor;
    borderPassword.frame = CGRectMake(0, password.frame.size.height - borderWidthPassword, password.frame.size.width, password.frame.size.height);
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
    
    confirmPassword = [ [UITextField alloc ] initWithFrame:CGRectMake(30, 190, screen_width-60, 30)];

    confirmPassword.textAlignment = NSTextAlignmentCenter;
    confirmPassword.textColor = [UIColor blackColor];
    confirmPassword.backgroundColor = [UIColor whiteColor];
    CALayer *borderConfirmPassword = [CALayer layer];
    CGFloat borderWidthConfirmPassword = 1;
    borderConfirmPassword.borderColor = [UIColor darkGrayColor].CGColor;
    borderConfirmPassword.frame = CGRectMake(0, confirmPassword.frame.size.height-borderWidthConfirmPassword, confirmPassword.frame.size.width, confirmPassword.frame.size.height);
    borderConfirmPassword.borderWidth = borderWidthConfirmPassword;
    [confirmPassword.layer addSublayer:borderConfirmPassword];
    confirmPassword.layer.masksToBounds = YES;
    confirmPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    confirmPassword.returnKeyType = UIReturnKeyDone;
    if ([confirmPassword respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        //        password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Password", nil) attributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans-Semibold" size:16.0]}];
        confirmPassword.placeholder = [NSString stringWithFormat:@"Confirm Password"];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
    }
    confirmPassword.keyboardType = UIKeyboardAppearanceDark;
    confirmPassword.clipsToBounds = YES;
    confirmPassword.secureTextEntry = YES;
    confirmPassword.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16.0];

    [inputView addSubview:confirmPassword];
    
    
    
    UIImageView *userNmaeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(65, 10, 25, 26)];
    [userNmaeIcon setImage:[UIImage imageNamed:@"username"]];
    [inputView addSubview:userNmaeIcon];
    
    UIImageView *emailIcon = [[UIImageView alloc]initWithFrame:CGRectMake(65, 70, 25, 26)];
    [emailIcon setImage:[UIImage imageNamed:@"email"]];
    [inputView addSubview:emailIcon];
    
    UIImageView *passwordIcon = [[UIImageView alloc]initWithFrame:CGRectMake(65, 130, 24, 24)];
    [passwordIcon setImage:[UIImage imageNamed:@"password"]];
    [inputView addSubview:passwordIcon];
    
    UIImageView *confirmPasswordIcon = [[UIImageView alloc]initWithFrame:CGRectMake(65, 190, 24, 24)];
    [confirmPasswordIcon setImage:[UIImage imageNamed:@"confirmPassword"]];
    [inputView addSubview:confirmPasswordIcon];
    
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(43, 553, 288, 44)];
    registerBtn.backgroundColor = [UIColor colorWithRed:1 green:0.74 blue:0.36 alpha:1];
    registerBtn.layer.borderWidth = 0.5;
    registerBtn.layer.cornerRadius = 20;
    registerBtn.layer.borderColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1].CGColor;
    [registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    registerBtn.titleLabel.textColor = UIColor.whiteColor;
    registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    
    
    
    UIButton *loginText = [[UIButton alloc]initWithFrame:CGRectMake(77, screen_height-30, 213, 20)];
    [loginText setTitle:@"Accounts available ! Login" forState:UIControlStateNormal];
    [loginText setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    loginText.titleLabel.font = [UIFont systemFontOfSize:14];
    loginText.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginText addTarget:self action:@selector(loginTextClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginText];
    
    
    
}

-(void)initTableView{
    
}



-(void)registerBtnClicked{
    
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
                
                if(![password.text isEqualToString:confirmPassword.text]){
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please confirm password !" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action) {}];
                    [alert addAction:defaultAction];
                    [self presentViewController:alert animated:YES completion:nil];
                }else{
                    emailString = email.text;
                    passwordString = password.text;
                    userNameString = userName.text;
                    emailString = [emailString lowercaseString];
                    
                    [self checkDetails];
                }
                
                
            }
        }
    }
    
    
    
    
    
}


-(void) checkDetails{
    
    NSString *domainStr = @"http://uway.xibainet.com/console/tool/timestamp";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", nil];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    
    [parametersDic setObject:@"email" forKey:emailString];
    [parametersDic setObject:@"name" forKey:userNameString];
    [parametersDic setObject:@"password" forKey:passwordString];
    
    NSLog(@"一半1");
        [manager POST:domainStr parameters:parametersDic progress:^(NSProgress * _Nonnull uploadProgress) {
            
            NSLog(@"一半2");
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            
            NSLog(@"登录成功！");
            // 成功则返回登录界面
            [self.navigationController popViewControllerAnimated:YES];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"失败");
        }];
    
}


-(BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[edu]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; //  return 0;
    return [emailTest evaluateWithObject:candidate];
}


-(void)loginTextClicked{
//    loginViewController *login = [[loginViewController alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
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
