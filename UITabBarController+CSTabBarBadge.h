//
//  UITabBarController+CSTabBarBadge.h
//
//  Created by Пользователь on 31.08.16.
//  Copyright © 2016 Kvyatkovskys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (CSTabBarBadge)

+ (void)setBageValue:(NSString *)value badgeIndex:(NSInteger)index badgeColor:(UIColor *)color inTabBarController:(UITabBarController *)tabBarController positionX:(CGFloat)x;
+ (void)setBageValue:(NSString *)value withAnimation:(BOOL)animation tabBarController:(UITabBarController *)tabBarController;

@end
