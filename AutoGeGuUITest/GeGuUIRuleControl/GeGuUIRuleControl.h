//
//  GeGuUIRuleControl.h
//  AutoGeGuUITest
//
//  Created by 三金 on 2018/6/7.
//  Copyright © 2018年 三金. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XinSanBan_Shu_LWTS @[\
@[@28,@29],@[@30,@27],\
@[@10,@11,@12,@13],@[@14,@15,@21],@[@22,@23,@24],@[@25,@26],\
@[@5,@6,@7,@8,@9],\
@[@1,@2,@3,@4]\
]

#define XinSanBan_Shu_JHJJ @[\
@[@28,@29,@30,@27],\
@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@21,@22,@23,@24,@26],\
@[],\
@[]\
]

#define XinSanBan_Shu_ZSZR @[\
@[@28,@29,@30,@27],\
@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@21,@22,@23,@25,@26],\
@[],\
@[]\
]

@interface GeGuUIRuleControl : NSObject

- (UILabel *)getValueLabelById:(NSNumber *)title_id;
- (UIView *)creatTheViewByRule:(NSArray *)rule Point:(CGPoint)point  Size:(CGSize)size Interval:(CGFloat)interval;

@end
