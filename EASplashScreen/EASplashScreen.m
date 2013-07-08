//
//  EASplashScreen.m
//  splashscreenWrapper
//
//  Created by Ethan Arbuckle on 7/7/13.
//  Copyright (c) 2013 Ethan Arbuckle. All rights reserved.
//

#import "EASplashScreen.h"
#import <QuartzCore/QuartzCore.h>

@interface UIImage (CWStretchable)
-(UIImage*)subimageWithRect:(CGRect)rect;
@end

@implementation UIImage (CWStretchable)
-(UIImage*)subimageWithRect:(CGRect)rect;
{
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    [self drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGContextRelease(UIGraphicsGetCurrentContext());
    return image;
}
@end

@interface EASplashScreen ()

@property (nonatomic, strong) NSArray *splashScreenImageView;
@property (nonatomic, strong) UIImageView *shadowImageView;
@property int slideCount;

@end

@implementation EASplashScreen

- (EASplashScreen *)initWithSplashScreenImage:(UIImage*)splashImage amountOfSlides:(int)slidesAmount {
    [super viewDidLoad];
    self.slideCount = slidesAmount;
    NSMutableArray *imageViewArray = [[NSMutableArray alloc] initWithCapacity:slidesAmount];
    CGFloat height = lrint(CGRectGetHeight(self.view.bounds) / slidesAmount);
    for (NSInteger i = 0; i < slidesAmount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:
                                  [splashImage subimageWithRect:CGRectMake(0, ((splashImage.size.height/slidesAmount)*i),
                                                                           splashImage.size.width,
                                                                           splashImage.size.height/slidesAmount)]];
        
        CGFloat y = lrint((CGRectGetHeight(self.view.bounds) / slidesAmount) * (i + 0));
        imageView.frame = CGRectMake(0, y, CGRectGetWidth(self.view.bounds), height);
        [self.view addSubview:imageView];
        [imageViewArray addObject:imageView];
    }
    _splashScreenImageView = imageViewArray;
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [self removeImageViews];
    });
    return self;
}

-(void)removeImageViews {
    for (NSInteger i = 0; i < self.splashScreenImageView.count; i++) {
        UIImageView *imageView = self.splashScreenImageView[i];
        [UIView animateWithDuration:0.8f animations:^{
            [UIView animateWithDuration:0.2f animations:^{
                self.shadowImageView.alpha = 0.0f;
            }];
        }];
        
        [UIView animateWithDuration:0.4f delay:(i * 0.1f) options:UIViewAnimationOptionCurveEaseIn animations:^{
            imageView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(imageView.frame), 0);
        } completion:^(BOOL finished) {
            if (i == _slideCount) {
                [self.delegate splashScreenDidFinishTransisioning:self];
            }
        }];
    }
}

@end


