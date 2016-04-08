//
//  CustomScrollerView.h
//  XHCustomScrollerView
//
//  Created by 张锐 on 16/4/7.
//  Copyright © 2016年 张锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScrollerView : UIView<UIScrollViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)imageArr;
//图片数组
@property (nonatomic,strong)NSArray *imageArray;
@property   (nonatomic,strong)UIPageControl *paControl;
@property (nonatomic,strong)UIScrollView *scrView;
//定时器设定秒数
@property (nonatomic,assign)NSInteger stopTime;

@end
