//
//  AppDelegate.h
//  UWAY_XB
//
//  Created by Chang on 2019/8/7.
//  Copyright © 2019 Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@property(nonatomic, strong) UIImageView *advImage;
@property(nonatomic, strong) UITabBarController *rootTabbarCtr;


@end

