//
//  ViewController.m
//  KZCaptionViewDemo
//
//  Created by Kirinzer on 2018/9/26.
//  Copyright © 2018 kirinzer. All rights reserved.
//

#import "ViewController.h"
#import "KZCaptionView/KZCaptionView.h"

@interface ViewController ()

@property (nonatomic, strong)   KZCaptionView *kzView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kzView = [[KZCaptionView alloc] initWithFrame:CGRectMake(20, 180, 200, 80) text:@"welcome" roll:YES];
    [self.view addSubview:self.kzView];
    //    [self.kzView setText:@"cool" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:40]];
    //    [self.kzView start];
}

- (void)dealloc {
    [self.kzView stop];
}

@end
