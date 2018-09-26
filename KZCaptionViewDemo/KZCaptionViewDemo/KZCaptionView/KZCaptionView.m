//
//  KZCaptionView.m
//  KZCaptionView
//
//  Created by Kirinzer on 2018/9/26.
//  Copyright © 2018 kirinzer. All rights reserved.
//

#import "KZCaptionView.h"
@interface KZCaptionView()

@property (strong, nonatomic)   UILabel *scrollCaptionLabel;
@property (assign, nonatomic)   BOOL startRoll;

@end

@implementation KZCaptionView

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text roll:(BOOL)startRoll {
    KZCaptionView *view = [self initWithFrame:frame];
    view.startRoll = startRoll;
    [view setText:text];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    self.scrollCaptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 100, self.frame.size.height)];
    self.scrollCaptionLabel.font = [UIFont systemFontOfSize:16];
    self.scrollCaptionLabel.textColor = [UIColor blackColor];
    self.scrollCaptionLabel.numberOfLines = 1;
    [self addSubview:self.scrollCaptionLabel];
    if (self.step==0) self.step = 80;
    if (self.startRoll) [self start];
}

- (void)start {
    CFTimeInterval scrollDuration = (self.scrollCaptionLabel.frame.size.width+self.frame.size.width)/self.step;
    CGRect rect = self.scrollCaptionLabel.bounds;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPosition = CGPointMake(self.frame.size.width+rect.size.width/2, self.scrollCaptionLabel.layer.position.y);
    CGPoint toPosition = CGPointMake(-rect.size.width/2, self.scrollCaptionLabel.layer.position.y);
    animation.fromValue = [NSValue valueWithCGPoint:fromPosition];
    animation.toValue = [NSValue valueWithCGPoint:toPosition];
    animation.removedOnCompletion = NO;
    animation.duration = scrollDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = HUGE_VAL;
    [self.scrollCaptionLabel.layer addAnimation:animation forKey:@"captionAnimation"];
}

- (void)stop {
    [self.scrollCaptionLabel.layer removeAnimationForKey:@"captionAnimation"];
}

- (void)setText:(NSString *)text {
    self.scrollCaptionLabel.text = text;
    CGSize sizeNew = [self.scrollCaptionLabel.attributedText size];
    self.scrollCaptionLabel.frame = CGRectMake(self.scrollCaptionLabel.frame.origin.x, self.scrollCaptionLabel.frame.origin.y, sizeNew.width, self.scrollCaptionLabel.frame.size.height);
}

- (void)setText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font {
    self.scrollCaptionLabel.textColor = color;
    self.scrollCaptionLabel.font = font;
    [self setText:text];
}

@end
