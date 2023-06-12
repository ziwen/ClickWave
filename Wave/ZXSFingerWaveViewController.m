//
//  ZXSFingerWaveViewController.m
//  WaveDemo
//
//  Created by Zhao Xueshu on 2021/5/11.
//

#import "ZXSFingerWaveViewController.h"
#import "ZXSFingerWaveView.h"
@interface ZXSFingerWaveViewController ()

@end

@implementation ZXSFingerWaveViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = NO;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat maxSize = screenSize.width > screenSize.height ? screenSize.width : screenSize.height;
    maxSize = maxSize * 2;
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake((screenSize.width-maxSize)*0.5,
                                                                (screenSize.height-maxSize)*0.5,
                                                                maxSize,
                                                                maxSize)];
    maskView.userInteractionEnabled = NO;
    maskView.backgroundColor = UIColor.clearColor;// [UIColor colorWithWhite:0 alpha:0.5];
    [self.view addSubview:maskView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
