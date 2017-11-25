//
//  AppDelegate.m
//  AESEnDeCode
//
//  Created by 陈帆 on 2017/11/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak, nonatomic) NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.window = [NSApplication sharedApplication].mainWindow;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    return true;
}


@end
