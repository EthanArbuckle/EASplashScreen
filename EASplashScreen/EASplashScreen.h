//
//  EASplashScreen.h
//  splashscreenWrapper
//
//  Created by Ethan Arbuckle on 7/7/13.
//  Copyright (c) 2013 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EASplashScreen;

@protocol EASplashScreenDelegate <NSObject>

-(void)splashScreenDidFinishTransisioning:(EASplashScreen *)splashController;

@end

@interface EASplashScreen : UIViewController

- (EASplashScreen *)initWithSplashScreenImage:(UIImage*)splashImage amountOfSlides:(int)slidesAmount;
@property (nonatomic, weak) id<EASplashScreenDelegate> delegate;

@end
