//
//  ViewController.m
//  WaveDemo
//
//  Created by 赵学书 on 2023/6/12.
//

#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    view.backgroundColor = UIColor.blueColor;
    view.frame = CGRectMake(100, 100, 100, 100);
}


@end
