//
//  UITabBarController+CSTabBarBadge.m
//  Nordman
//
//  Created by Пользователь on 31.08.16.
//  Copyright © 2016 CoffeeStudio. All rights reserved.
//

#import "UITabBarController+CSTabBarBadge.h"
#import <pop/POP.h>

@implementation UITabBarController (CSTabBarBadge)

+ (void)setBageValue:(NSString *)value badgeIndex:(NSInteger)index badgeColor:(UIColor *)color inTabBarController:(UITabBarController *)tabBarController positionX:(CGFloat)x {    
    UIView *viewBadge = [[UIView alloc] initWithFrame:CGRectMake(x, 3, 18, 18)];
    [viewBadge setBackgroundColor:color];
    viewBadge.layer.cornerRadius = 9.f;
    viewBadge.tag = 10;
    
    UILabel *badge = [[UILabel alloc]init];
    badge.text = value;
    badge.tag = 11;
    badge.textAlignment = NSTextAlignmentCenter;
    badge.font = [UIFont systemFontOfSize:13];
    badge.frame = CGRectMake(0, 0, 18, 18);
    badge.textColor = [UIColor whiteColor];
    badge.backgroundColor = [UIColor clearColor];
    [viewBadge addSubview:badge];
    
    [tabBarController.tabBar addSubview:viewBadge];
}

+ (void)setBageValue:(NSString *)value withAnimation:(BOOL)animation tabBarController:(UITabBarController *)tabBarController {
    for (UIView *view in tabBarController.tabBar.subviews) {
        if ([view isKindOfClass:[UIView class]] & (view.tag == 10)) {
            if (value == nil) {
                view.hidden = TRUE;
            } else {
                view.hidden = FALSE;
                
                CGRect frame = view.frame;
                if (value.length > 1) {
                    frame.size.width = 27;
                }
                else if (value.length > 2) {
                    frame.size.width = 36;
                }
                view.frame = frame;
                
                for (UILabel *curLabel in view.subviews) {
                    if ([curLabel isKindOfClass:[UILabel class]] & (curLabel.tag == 11)) {
                        CGRect frame = curLabel.frame;
                        if (value.length > 1) {
                            frame.size.width = 27;
                        }
                        else if (value.length > 2) {
                            frame.size.width = 36;
                        }
                        curLabel.frame = frame;
                        
                        if (animation) {
                            POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
                            sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
                            sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(15, 15)];
                            sprintAnimation.springBounciness = 20.f;
                            [view pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
                            
                            curLabel.text = value;
                        } else {
                            curLabel.text = value;
                        }
                    }
                }
            }
        }
    }
}

@end
