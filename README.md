FTAnimatedButton
================

Animated button that rolls on a screen with a bounce + loads of settings

Please see the enclosed project for details.

This button simulates the nice "slide on while rotate" functionality used in lots of projects like Path, etc …

Only thing you need to do is to import FTAnimatedButton class to your project and you'r pretty much sorted …

1) Import QuartzCore framework

2) Create your button:
```Objective-C

_button1 = [[FTAnimatedButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
[_button1 setImage:[UIImage imageNamed:@"facebook_dark"] forState:UIControlStateNormal];
[_button1 setImage:[UIImage imageNamed:@"facebook_active"] forState:UIControlStateHighlighted];

```

3)Animate button into your view:
```Objective-C

[_button1 animateToView:self.view fromOrigin:CGPointMake(320, 180) withDirection:FTAnimatedButtonAppearanceDirectionRight andDelay:0.2];

```

4) Animate button out:
```Objective-C

[_button1 hide];

```

5) Set custom properties:
```Objective-C

@property (nonatomic) NSTimeInterval delay; // Delay the animation, good for animating multiple buttons
@property (nonatomic) NSTimeInterval animationDuration; // I don't think I have to explain this one :)
@property (nonatomic) CGFloat distanceInDirection; // This defines the distance that the button will animate in desired direction
@property (nonatomic) CGFloat bounceDistanceInDirection; // If you want to disable the bounce (10px default) set this to 0
@property (nonatomic) CGFloat hiddenAlpha; // If you want to fade the button out, not just roll it out, set the min alpha here
@property (nonatomic) BOOL enableRotation; // Enabled by default, enables the 360 degrees rotating effect when sliding on/off the screen

```

Any questions or problems, use issues and other GitHub.com facilities and we'll be in touch!

Fuerte Team!

http://www.fuerteint.com