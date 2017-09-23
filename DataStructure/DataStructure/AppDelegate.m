//
//  AppDelegate.m
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self printSolution:24];
    
    return YES;
}

-(void)printSolution: (int)num
{
    for(int i=1;i<=num;i++)
    {
        BOOL isDivisibleBy3 = i%3==0;
        BOOL isDivisibleBy5 = i%5==0;
        BOOL isDivisibleBy7 = i%7==0;
        NSString*word = @"";
        if(isDivisibleBy3)
        {
            word = @"Fizz";
        }
        if(isDivisibleBy5)
        {
            word= [word stringByAppendingString:@"Buzz"];
        }
        if(isDivisibleBy7)
        {
            word= [word stringByAppendingString:@"Woof"];
        }
        if(word.length==0)
        {
            word = [NSString stringWithFormat:@"%d",i];
        }
        
        printf("%s\n", [word UTF8String]);
        
    }
}
void findNext( NSMutableArray *A, NSMutableArray *B, int i,int j, int n, int m)
{
    if([B[i][j]  isEqual: @(-1)])
        return;
    
    B[i][j] = @(-1);
    if(i+1 < n)
        if(A[i+1][j] == A[i][j]) findNext(A, B, i+1, j, n, m);
    if(i-1 >= 0)
        if(A[i-1][j] == A[i][j]) findNext(A, B, i-1, j, n, m);
    if(j+1 < m)
        if(A[i][j+1] == A[i][j]) findNext(A, B, i, j+1, n, m);
    if(j-1 >= 0)
        if(A[i][j-1] == A[i][j]) findNext(A, B, i, j-1, n, m);
}

int solution(NSMutableArray *A) {
    if ([A count]==0)
        return 0;
    int sum = 0;
    int n = (int)[A count];
    int m = (int)[A[0] count];
    if (n ==0 || m==0)
        return 0;
    
    NSMutableArray *B = [[NSMutableArray alloc]initWithArray:A];
    for(int i=0; i<n; i++)
        for(int j = 0; j<m; j++) {
            if (B[i][j] >= 0) {
                findNext(A, B, i, j, n, m);
                sum ++;
            }
        }
    return sum;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
