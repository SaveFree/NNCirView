//
//  LNCirView.m
//  Cir
//
//  Created by LST_PRO on 2018/2/11.
//  Copyright © 2018年 LST_PRO. All rights reserved.
//

#import "LNCirView.h"
#import "LNCirCellView.h"
#import <Masonry/Masonry.h>

#define FULL_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_SCALE  (FULL_WIDTH/375)
#define CELL_HEIGHT  (131*SCREEN_SCALE)
#define SCROLLVIEW_WIDTH  (FULL_WIDTH - 32)

@interface LNCirView ()<UIScrollViewDelegate>

@property(nonatomic ,strong) UIScrollView *scrollView;
@property(nonatomic ,assign) NSInteger    count;

@end

@implementation LNCirView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _count = 3;
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(16, 0, SCROLLVIEW_WIDTH, CELL_HEIGHT)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.clipsToBounds = NO;
    [self addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake(SCROLLVIEW_WIDTH , CELL_HEIGHT);
    _scrollView.contentInset = UIEdgeInsetsMake(0, SCROLLVIEW_WIDTH, 0, SCROLLVIEW_WIDTH);
    
    for (NSInteger i = 0; i < _count; i++)
    {
        LNCirCellView *imageCell = [[LNCirCellView alloc] initWithFrame:CGRectMake(SCROLLVIEW_WIDTH * (i-1), 0, _scrollView.frame.size.width , _scrollView.frame.size.height)];
        imageCell.tag = i + 1;
        [imageCell loadText:[NSString stringWithFormat:@"%ld",i + 1]];
        [_scrollView addSubview:imageCell];
    }
}
#pragma -mark delegate
#pragma mark -scrollView Delegate-
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentInset.left + scrollView.contentOffset.x < 40)
    {
        UIEdgeInsets insets = _scrollView.contentInset;
        scrollView.contentInset = UIEdgeInsetsMake(0, insets.left + SCROLLVIEW_WIDTH, 0, insets.right - SCROLLVIEW_WIDTH);
        LNCirCellView * lastCellView = [scrollView viewWithTag:3];
        [lastCellView setFrame:CGRectMake(-scrollView.contentInset.left, 0, SCROLLVIEW_WIDTH, CELL_HEIGHT)];
        for (NSInteger i = _count; i > 0; i --) {
            
            LNCirCellView * view = [scrollView viewWithTag:i];
            if( i < _count ) {
                view.tag = i + 1;
            }
        }
        lastCellView.tag = 1;
        
    }else if(scrollView.contentInset.left + scrollView.contentOffset.x > SCROLLVIEW_WIDTH * (_count - 1) - 100)
    {
        UIEdgeInsets insets = scrollView.contentInset;
        scrollView.contentInset = UIEdgeInsetsMake(0, insets.left - SCROLLVIEW_WIDTH, 0, insets.right + SCROLLVIEW_WIDTH);
        
        LNCirCellView * topView = [scrollView viewWithTag:1];
        [topView setFrame:CGRectMake(scrollView.contentInset.right, 0, SCROLLVIEW_WIDTH, CELL_HEIGHT)];
        for (NSInteger i = 2; i < _count + 1; i ++ ) {
            
            LNCirCellView * view = [scrollView viewWithTag:i];
            view.tag = i - 1;
        }
        topView.tag = _count;
    }
    
    NSLog(@"--%f",scrollView.contentInset.left + _scrollView.contentOffset.x );
    NSLog(@"-----%f",scrollView.contentInset.left );
    NSLog(@"----------%f" ,_scrollView.contentOffset.x );
}

@end
