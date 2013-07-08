//
//  ViewController.m
//  EASplashScreen
//
//  Created by Ethan Arbuckle on 7/8/13.
//  Copyright (c) 2013 Ethan Arbuckle. All rights reserved.
//

#import "Demo.h"
#import "EASplashScreen.h"

@interface Demo ()

@end

@implementation Demo

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor redColor];
    EASplashScreen *splashScreen = [[EASplashScreen alloc] initWithSplashScreenImage:[UIImage imageNamed:@"splashScreenImage.jpg"] amountOfSlides:7];
    splashScreen.delegate = self;
    splashScreen.view.frame = self.view.bounds;
    [self.view addSubview:splashScreen.view];
}

- (void)splashScreenDidFinishTransisioning:(EASplashScreen *)splashController {
    NSLog(@"Splash screen is off the screen!");
}
@end
