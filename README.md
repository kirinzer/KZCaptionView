# KZCaptionView
一行代码添加滚动字幕
字幕会在视图内部匀速滚动
可以设置字幕颜色，字体，步长

#####1.快速初始化添加滚动字幕
```
//  ViewController.m
KZCaptionView *kzView = [[KZCaptionView alloc] initWithFrame:CGRectMake(20, 180, 200, 80) text:@"welcome" roll:YES];
[self.view addSubview:kzView];
```

#####2.自定义颜色字体

```
//  ViewController.m
KZCaptionView *kzView = [[KZCaptionView alloc] initWithFrame:CGRectMake(20, 180, 200, 80)];
[self.view addSubview:kzView];
[kzView setText:@"cool" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:40]];
[kzView start];
```

#####2.自定义步长 ( 每秒移动的 point )

```
//  ViewController.m
KZCaptionView *kzView = [[KZCaptionView alloc] initWithFrame:CGRectMake(20, 180, 200, 80)];
[self.view addSubview:kzView];
[kzView setText:@"cool" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:40]];
kzView.step = 20;	//默认为80
[kzView start];
```

有任何问题，和改进意见可以提 issue 给我，或者通过邮件联系，谢谢