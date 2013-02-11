//
//  EEDetailView.h
//  Eon
//
//  Created by Ondrej Rafaj on 11/02/2013.
//  Copyright (c) 2013 Fuerte Innovations. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    FTAnimatedButtonAppearanceDirectionTop,
    FTAnimatedButtonAppearanceDirectionLeft,
    FTAnimatedButtonAppearanceDirectionRight,
    FTAnimatedButtonAppearanceDirectionBottom
} FTAnimatedButtonAppearanceDirection;


@interface FTAnimatedButton : UIButton

@property (nonatomic, readonly) FTAnimatedButtonAppearanceDirection apperanceFrom;
@property (nonatomic) NSTimeInterval delay;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic) CGFloat distanceInDirection;
@property (nonatomic) CGFloat bounceDistanceInDirection;
@property (nonatomic) CGFloat hiddenAlpha;
@property (nonatomic) BOOL enableRotation;

@property (nonatomic, readonly) BOOL canAnimate;

- (void)animateToView:(UIView *)view fromOrigin:(CGPoint)origin withDirection:(FTAnimatedButtonAppearanceDirection)direction andDelay:(NSTimeInterval)delay;
- (void)animateToView:(UIView *)view withDirection:(FTAnimatedButtonAppearanceDirection)direction andDelay:(NSTimeInterval)delay;
- (void)animateToView:(UIView *)view withDirection:(FTAnimatedButtonAppearanceDirection)direction;

- (void)hide;


@end
