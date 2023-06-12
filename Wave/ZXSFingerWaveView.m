//
//  ZXSFingerWaveView.m
//  WaveDemo
//
//  Created by Zhao Xueshu on 2021/5/11.
//

#import "ZXSFingerWaveView.h"

@interface ZXSFingerWaveView () <CAAnimationDelegate>
{
    CGSize waveSize;
    NSTimeInterval duration;
}

@property (nonatomic, assign) NSInteger count;//水波纹次数
@end

@implementation ZXSFingerWaveView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        waveSize = CGSizeMake(40, 40);
        duration = 0.4;
    }
    return self;
}

+ (instancetype)showInView:(UIView *)view center:(CGPoint)center {
    ZXSFingerWaveView *waveView = [ZXSFingerWaveView new];
    [waveView setframeWithCenter:center];
    [view addSubview:waveView];
    return waveView;
}

- (void)didMoveToSuperview {
    [self addWaveLayer];
}

- (void)addWaveLayer {
    CAShapeLayer *waveLayer = [CAShapeLayer new];
    waveLayer.backgroundColor = [UIColor clearColor].CGColor;
    waveLayer.opacity = 0.6 * MAX(0.5, 0.1 * (10 - self.count));
    waveLayer.zPosition = 100;
    if(self.count % 2 == 0) {
        waveLayer.fillColor = [UIColor lightGrayColor].CGColor;
    } else {
        waveLayer.fillColor = [UIColor whiteColor].CGColor;
    }
    
    [self.layer addSublayer:waveLayer];
    [self startAnimationInLayer:waveLayer];
    self.count++;
    
    if(self.count < 10) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration / 10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addWaveLayer];
        });
    }
}


- (void)startAnimationInLayer:(CALayer *)layer{
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithArcCenter:[self pathCenter]
                                                             radius:[self animationBeginRadius]
                                                         startAngle:0
                                                           endAngle:M_PI*2
                                                          clockwise:YES];
    
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:[self pathCenter]
                                                           radius:[self animationEndRadius]
                                                       startAngle:0
                                                         endAngle:M_PI*2
                                                        clockwise:YES];
    
    CABasicAnimation *rippleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rippleAnimation.delegate = self;
    rippleAnimation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    rippleAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    rippleAnimation.duration = duration;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.delegate = self;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.6 * MAX(0.5, 0.1 * (10 - self.count))];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = duration;
    
    [layer addAnimation:rippleAnimation forKey:@"opacityAnimation_"];
    [layer addAnimation:opacityAnimation forKey:@"rippleAnimation_"];
}

- (void)setframeWithCenter:(CGPoint)center{
    CGRect frame = CGRectMake(center.x-waveSize.width*0.5, center.y-waveSize.height*0.5, waveSize.width, waveSize.height);
    self.frame = frame;
}

- (CGFloat)animationBeginRadius{
    return waveSize.width*0.05;
}

- (CGFloat)animationEndRadius{
    return waveSize.width*0.6;
}

- (CGPoint)pathCenter{
    return CGPointMake(waveSize.width*0.5, waveSize.height*0.5);
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [self removeFromSuperview];
    }
}




@end
