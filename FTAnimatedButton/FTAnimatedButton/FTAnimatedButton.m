//
//  FTAnimatedButton.m
//  FTAnimatedButton
//
//  Created by Ondrej Rafaj on 11/02/2013.
//  Copyright (c) 2013 Fuerte Innovations. All rights reserved.
//

#import "FTAnimatedButton.h"
#import <QuartzCore/QuartzCore.h>


@interface FTAnimatedButton ()

@property (nonatomic) CGPoint originalOrigin;

@end


@implementation FTAnimatedButton


#pragma mark Animations

- (void)rotateMe:(BOOL)clockwise {
    if (_enableRotation) {
        CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        [fullRotation setFromValue:[NSNumber numberWithFloat:0]];
        CGFloat angle = ((360.0f * M_PI) / 180.0f);
        if (!clockwise) angle *= -1;
        [fullRotation setToValue:[NSNumber numberWithFloat:angle]];
        [fullRotation setDuration:_animationDuration];
        [fullRotation setRepeatCount:1];
        [fullRotation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [self.layer addAnimation:fullRotation forKey:@"360"];
    }
}

- (void)animateIn {
    if (!_canAnimate) return;
    _canAnimate = NO;
    
    [self setHidden:NO];
    __block CGRect r = self.frame;
    r.origin = _originalOrigin;
    [self setFrame:r];
    [UIView animateWithDuration:((float)_animationDuration * 0.7) animations:^{
        CGFloat distance = (_distanceInDirection + _bounceDistanceInDirection);
        switch (_apperanceFrom) {
            case FTAnimatedButtonAppearanceDirectionLeft:
                r.origin.x += distance;
                break;
                
            case FTAnimatedButtonAppearanceDirectionTop:
                r.origin.y += distance;
                break;
                
            case FTAnimatedButtonAppearanceDirectionRight:
                r.origin.x -= distance;
                break;
                
            case FTAnimatedButtonAppearanceDirectionBottom:
                r.origin.y -= distance;
                break;
                
            default:
                break;
        }
        [self setFrame:r];
        if (_hiddenAlpha != 1) [self setAlpha:1];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:((float)_animationDuration * 0.3) animations:^{
            switch (_apperanceFrom) {
                case FTAnimatedButtonAppearanceDirectionLeft:
                    r.origin.x -= _bounceDistanceInDirection;
                    break;
                    
                case FTAnimatedButtonAppearanceDirectionTop:
                    r.origin.y -= _bounceDistanceInDirection;
                    break;
                    
                case FTAnimatedButtonAppearanceDirectionRight:
                    r.origin.x += _bounceDistanceInDirection;
                    break;
                    
                case FTAnimatedButtonAppearanceDirectionBottom:
                    r.origin.y += _bounceDistanceInDirection;
                    break;
                    
                default:
                    break;
            }
            [self setFrame:r];
            if (_hiddenAlpha != 1) [self setAlpha:1];
        } completion:^(BOOL finished) {
            _canAnimate = YES;
        }];
    }];
    [self rotateMe:YES];
}

- (void)animateOut {
    if (!_canAnimate) return;
    _canAnimate = NO;
    __block CGRect r = self.frame;
    r.origin = _originalOrigin;
    [UIView animateWithDuration:_animationDuration animations:^{
        [self setFrame:r];
        if (_hiddenAlpha != 1) [self setAlpha:_hiddenAlpha];
    } completion:^(BOOL finished) {
        [self setHidden:YES];
        [self removeFromSuperview];
        _canAnimate = YES;
    }];
    [self rotateMe:NO];
}

- (void)animateToView:(UIView *)view fromOrigin:(CGPoint)origin withDirection:(FTAnimatedButtonAppearanceDirection)direction andDelay:(NSTimeInterval)delay {
    _apperanceFrom = direction;
    _delay = delay;
    _canAnimate = YES;
    _enableRotation = YES;
    
    CGRect r = self.frame;
    _originalOrigin = origin;
    r.origin = _originalOrigin;
    [self setFrame:r];
    
    if (self.superview) {
        [self removeFromSuperview];
    }
    [view addSubview:self];
    
    if (_delay == 0) {
        [self animateIn];
    }
    else {
        [NSTimer scheduledTimerWithTimeInterval:_delay target:self selector:@selector(animateIn) userInfo:nil repeats:NO];
    }
}

- (void)animateToView:(UIView *)view withDirection:(FTAnimatedButtonAppearanceDirection)direction andDelay:(NSTimeInterval)delay {
    [self animateToView:view fromOrigin:self.frame.origin withDirection:direction andDelay:delay];
}

- (void)animateToView:(UIView *)view withDirection:(FTAnimatedButtonAppearanceDirection)direction {
    [self animateToView:view withDirection:direction andDelay:0];
}

- (void)hide {
    if (_delay == 0) {
        [self animateOut];
    }
    else {
        [NSTimer scheduledTimerWithTimeInterval:_delay target:self selector:@selector(animateOut) userInfo:nil repeats:NO];
    }
}

#pragma mark Settings

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

#pragma mark Initialization

- (void)setupView {
    _animationDuration = 0.2;
    _hiddenAlpha = 1;
    _bounceDistanceInDirection = 10;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setupView];
        _distanceInDirection = 50;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        _distanceInDirection = frame.size.height * 2;
    }
    return self;
}


@end