//
//  ZXSFingerWaveWindow.m
//  WaveDemo
//
//  Created by Zhao Xueshu on 2021/5/11.
//

#import "ZXSFingerWaveWindow.h"
#import "ZXSFingerWaveView.h"
#import "ZXSFingerWaveViewController.h"
@implementation ZXSFingerWaveWindow

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setFrame:CGRectZero];
        [self afterinit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self afterinit];
    }
    return self;
}

//need set CGRectZero
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (void)afterinit {
    self.windowLevel = UIWindowLevelNormal + 1;
    self.layer.masksToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    //设置rootVC
    ZXSFingerWaveViewController *vc = [[ZXSFingerWaveViewController alloc] init];
    self.rootViewController = vc;
}

- (BOOL)isKeyWindow {
    return NO; //永远不是keyWindow
}

- (void)becomeKeyWindow {
    [[UIApplication sharedApplication].delegate.window makeKeyWindow];//当前window不接收事件， 成为主window
}

//handle tap event
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    [ZXSFingerWaveView showInView:self center:point];
    return NO;
}

@end
