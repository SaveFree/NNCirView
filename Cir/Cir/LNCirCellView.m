//
//  LNCirCellView.m
//  Cir
//
//  Created by LST_PRO on 2018/2/12.
//  Copyright © 2018年 LST_PRO. All rights reserved.
//

#import "LNCirCellView.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface LNCirCellView ()

@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) UILabel *label;

@end

@implementation LNCirCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapG];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initViews];
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapG];
    }
    return self;
}
- (void)initViews
{
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"image_image"];
    [self addSubview:self.imageView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 100, 30)];
    _label.textColor = [UIColor blueColor];
    [self addSubview:_label];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.right.mas_offset(-10);
        make.left.mas_offset(10);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
    }];
}

- (void)tapAction:(UITapGestureRecognizer *)tapG
{
    if (self.clickAction) {
        self.clickAction(self.imageView.tag);
    }
}

- (void)loadText:(NSString *)text
{
    _label.text = text;
}

- (void)loadImageUrl:(NSString *)imageUrl
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end
