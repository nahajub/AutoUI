//
//  ViewController.m
//  AutoGeGuUITest
//
//  Created by 三金 on 2018/6/7.
//  Copyright © 2018年 三金. All rights reserved.
//

#import "ViewController.h"
#import "GeGuUIRuleControl.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) GeGuUIRuleControl *ruleControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ruleControl = [[GeGuUIRuleControl alloc] init];
}

- (IBAction)lwtsShow:(UIButton *)sender {
    [_showView removeFromSuperview];
    _showView = [_ruleControl creatTheViewByRule:XinSanBan_Shu_LWTS
                                    Point:CGPointMake(30, 50)
                                     Size:CGSizeMake(300, 300)
                                 Interval:10];
    [self.view addSubview:_showView];
}

- (IBAction)jhjjShow:(UIButton *)sender {
    [_showView removeFromSuperview];
    _showView = [_ruleControl creatTheViewByRule:XinSanBan_Shu_JHJJ
                                    Point:CGPointMake(30, 50)
                                     Size:CGSizeMake(300, 300)
                                 Interval:10];
    [[_ruleControl getValueLabelById:@1] setText:@"1"];
    
    [self.view addSubview:_showView];
}

- (IBAction)zszrShow:(UIButton *)sender {
    [_showView removeFromSuperview];
    _showView = [_ruleControl creatTheViewByRule:XinSanBan_Shu_ZSZR
                                    Point:CGPointMake(30, 50)
                                     Size:CGSizeMake(300, 300)
                                 Interval:10];
    [self.view addSubview:_showView];
}


@end
