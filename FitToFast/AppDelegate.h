//
//  AppDelegate.h
//  FitToFast
//
//  Created by Pimpaporn Chaichompoo on 5/29/2558 BE.
//  Copyright (c) 2558 Pimpaporn Chaichompoo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DatabaseViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    DatabaseViewController *viewController;
}
@property (strong, nonatomic) UIWindow *window;


@end

