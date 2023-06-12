//
//  AppDelegate.m
//  WaveDemo
//
//  Created by 赵学书 on 2023/6/12.
//

#import "AppDelegate.h"
#import "ZXSFingerWaveWindow.h"
@interface AppDelegate ()
@property (nonatomic, strong) ZXSFingerWaveWindow *fingerWaveWindow;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    _fingerWaveWindow = [[ZXSFingerWaveWindow alloc] init];
    _fingerWaveWindow.backgroundColor = [UIColor clearColor];
    [_fingerWaveWindow makeKeyAndVisible];
    _fingerWaveWindow.windowLevel = 3000;

    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
