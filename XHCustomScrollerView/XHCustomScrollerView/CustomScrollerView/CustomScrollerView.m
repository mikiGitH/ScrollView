//
//  CustomScrollerView.m
//  XHCustomScrollerView
//
//  Created by 张锐 on 16/4/7.
//  Copyright © 2016年 张锐. All rights reserved.
//

#import "CustomScrollerView.h"


@implementation CustomScrollerView


- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)imageArr
{
    if (self = [super initWithFrame:frame]) {
        self.imageArray = imageArr;
        [self initScrollview];
    }
    return self;
}

- (void)initScrollview
{
    CGFloat frameH = self.frame.size.height;
    CGFloat frameW =self.frame.size.width;
    NSInteger count = _imageArray.count;
    
    _scrView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrView.contentSize = CGSizeMake(frameW*_imageArray.count, frameH);
    _scrView.delegate = self;
    _scrView.pagingEnabled = YES;
    [self addSubview:_scrView];
    
    for (int i=0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frameW*i, 0, frameW, frameH)];
        imageView.image = [UIImage imageNamed:_imageArray[i]];
        [_scrView addSubview:imageView];
    }
    
    _paControl = [[UIPageControl alloc]initWithFrame:CGRectMake(frameW/2, frameH, frameW/2, 0)];
    _paControl.numberOfPages = count;
    [self addSubview:_paControl];
    
    [NSTimer scheduledTimerWithTimeInterval:_stopTime target:self selector:@selector(myTime:) userInfo:nil repeats:YES];
    
}
//第一个定时器方法，实现轮播，并且在最后一张显示时停止
- (void)myTime:(NSTimer *)time
{
    _paControl.currentPage++;
    _scrView.contentOffset = CGPointMake(_paControl.currentPage*self.frame.size.width, 0);
    if (_paControl.currentPage == self.imageArray.count-1) {
        [time invalidate];
        time = nil;
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(myTime2) userInfo:nil repeats:NO];
    }
    
}
//第二个定时器，在显示最后一张时跳转回第一张，同时再实现一次第一个定时器，重新轮播
- (void)myTime2
{
    _paControl.currentPage = 0;
    _scrView.contentOffset = CGPointMake(0, 0);
    [NSTimer scheduledTimerWithTimeInterval:_stopTime target:self selector:@selector(myTime:) userInfo:nil repeats:YES];

}
//改变scrollView的contentoffset
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _paControl.currentPage = scrollView.contentOffset.x/self.frame.size.width;
    

}



@end
