//
//  LNCirCellView.h
//  Cir
//
//  Created by LST_PRO on 2018/2/12.
//  Copyright © 2018年 LST_PRO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNCirCellView : UIView

@property (nonatomic ,copy) void(^clickAction)(NSInteger tag);

- (void)loadText:(NSString *)text;

@end
