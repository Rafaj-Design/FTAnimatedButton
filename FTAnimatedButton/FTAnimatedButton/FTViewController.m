//
//  FTViewController.m
//  FTAnimatedButton
//
//  Created by Ondrej Rafaj on 11/02/2013.
//  Copyright (c) 2013 Fuerte Innovations. All rights reserved.
//

#import "FTViewController.h"
#import "FTAnimatedButton.h"


@interface FTViewController ()

@property (nonatomic, strong) FTAnimatedButton *button1;
@property (nonatomic, strong) FTAnimatedButton *button2;
@property (nonatomic, strong) FTAnimatedButton *button3;
@property (nonatomic, strong) FTAnimatedButton *button4;

@end

@implementation FTViewController


#pragma mark Layout

// iPhone 5 detection
- (BOOL)isBigPhone {
    return ([[UIScreen mainScreen] bounds].size.height == 568);
}

#pragma mark Presenting buttons

- (void)showButtons {
    [_button1 animateToView:self.view fromOrigin:CGPointMake(-30, 180) withDirection:FTAnimatedButtonAppearanceDirectionLeft andDelay:0];
    [_button2 animateToView:self.view fromOrigin:CGPointMake(150, -30) withDirection:FTAnimatedButtonAppearanceDirectionTop andDelay:0.1];
    [_button3 animateToView:self.view fromOrigin:CGPointMake(320, 180) withDirection:FTAnimatedButtonAppearanceDirectionRight andDelay:0.2];
    [_button4 animateToView:self.view withDirection:FTAnimatedButtonAppearanceDirectionBottom andDelay:0.3];
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(hideButtons) userInfo:nil repeats:NO];
}

- (void)hideButtons {
    [_button1 hide];
    [_button2 hide];
    [_button3 hide];
    [_button4 hide];
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(showButtons) userInfo:nil repeats:NO];
}

#pragma mark Creating elements

- (void)createAllElements {
    [self.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    
    CGFloat bottom = [self isBigPhone] ? 548 : 460;
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:background];
    
    _button1 = [[FTAnimatedButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [_button1 setImage:[UIImage imageNamed:@"facebook_dark"] forState:UIControlStateNormal];
    [_button1 setImage:[UIImage imageNamed:@"facebook_active"] forState:UIControlStateHighlighted];
    
    _button2 = [[FTAnimatedButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [_button2 setImage:[UIImage imageNamed:@"dribbble_dark"] forState:UIControlStateNormal];
    [_button2 setImage:[UIImage imageNamed:@"dribbble_active"] forState:UIControlStateHighlighted];
    
    _button3 = [[FTAnimatedButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [_button3 setImage:[UIImage imageNamed:@"twitter_dark"] forState:UIControlStateNormal];
    [_button3 setImage:[UIImage imageNamed:@"twitter_active"] forState:UIControlStateHighlighted];
    [_button3 setEnableRotation:NO];
    
    _button4 = [[FTAnimatedButton alloc] initWithFrame:CGRectMake(150, bottom, 32, 32)];
    [_button4 setImage:[UIImage imageNamed:@"deviantart_dark"] forState:UIControlStateNormal];
    [_button4 setImage:[UIImage imageNamed:@"deviantart_active"] forState:UIControlStateHighlighted];
    [_button4 setAnimationDuration:0.8];
    [_button4 setDistanceInDirection:120];
    [_button4 setBounceDistanceInDirection:20];
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fuerte-logo"]];
    CGRect r = logo.frame;
    r.origin.x = 60;
    r.origin.y = 100;
    [logo setFrame:r];
    [self.view addSubview:logo];
    
    [self showButtons];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createAllElements];
}



@end
