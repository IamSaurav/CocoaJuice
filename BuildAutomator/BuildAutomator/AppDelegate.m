//
//  AppDelegate.m
//  BuildAutomator
//
//  Created by Saurav Satpathy on 14/02/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    // Insert code here to initialize your application
//    NSView*v = [[NSView alloc]init ];
//                //WithFrame:NSMakeRect(10,10, 200, 200)];
//    [v setWantsLayer:YES];
//    v.layer.backgroundColor = [NSColor brownColor].CGColor;
//    ViewController *vc = [[ViewController alloc]init];
//    
//    self.window.contentView = vc.view;
//    [self.window.contentView addSubview:v];
    
    NSTask *task = [[NSTask alloc]init];
    task.launchPath = @"/bin/sh/xcodebuild";
    task.currentDirectoryPath = @"cd /Users/saurav/Stack/Stack";
    task.arguments = @[@"run"];
    
    [task launch];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return NO;
}

-(void)windowWillClose:(NSNotification *)notification
{
    
    
}


@end
