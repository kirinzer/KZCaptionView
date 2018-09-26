//
//  KZCaptionView.h
//  KZCaptionView
//
//  Created by Kirinzer on 2018/9/26.
//  Copyright © 2018 kirinzer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KZCaptionView : UIView
//初始化并添加内容，设置是否开始滚动
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text roll:(BOOL)startRoll;
//开始滚动
- (void)start;
//停止滚动
- (void)stop;
//设置字幕内容
- (void)setText:(NSString *)text;
- (void)setText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font;
//每秒移动的距离 (pt/s)
@property (nonatomic)   CGFloat step;

@end

NS_ASSUME_NONNULL_END
