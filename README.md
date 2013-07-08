EASplashScreen
==============

Add an awesome sliding splash screen to your app with 3 lines of code!

# About
EASplashScreen allows you to have an Upcoming style splashscreen in your app. All you have to do is supply the image you want to use, and the amount of slides

# Usage
'''objective-c
EASplashScreen *splashScreen = [[EASplashScreen alloc] initWithSplashScreenImage:[UIImage imageNamed:@"IMAGE.png"] amountOfSlides:7];
splashScreen.delegate = self;
splashScreen.view.frame = self.view.bounds;
[self.view addSubview:splashScreen.view];
'''
