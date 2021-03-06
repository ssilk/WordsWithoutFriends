//
//  AppDelegate.m
//  WordsWithoutFriends
//
//  Created by Presenter on 11/16/13.
//  Copyright (c) 2013 Tapas Software. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"WordList" withExtension:@"plist"];
    
    NSArray *wordList = [NSArray arrayWithContentsOfURL:plistURL];
    wordList = [wordList sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"word" ascending:YES]]];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    for (UINavigationController *navController in tabBarController.viewControllers) {
        UIViewController *viewController = navController.topViewController;
        [viewController setValue:[wordList copy] forKey:@"words"];
    }
    
    return YES;
}
							
@end
