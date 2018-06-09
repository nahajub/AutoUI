//
//  GeGuUIRuleControl.m
//  AutoGeGuUITest
//
//  Created by 三金 on 2018/6/7.
//  Copyright © 2018年 三金. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeGuUIRuleControl.h"
#import <sys/sysctl.h>
#import <mach/mach.h>

#define Define_Data @{\
@1:@"one",@2:@"two",@3:@"three",@4:@"four",@5:@"five",\
@6:@"six",@7:@"seven",@8:@"eight",@9:@"nine",@10:@"ten",\
@11:@"eleven",@12:@"twelve",@13:@"thirteen",@14:@"fourteen",@15:@"fifteen",\
@16:@"sixteen",@17:@"seventeen",@18:@"eighteen",@19:@"nineteen",@20:@"twenty",\
@21:@"twenty-one",@22:@"twenty-two",@23:@"twenty-three",@24:@"twenty-four",@25:@"twenty-five",\
@26:@"twenty-six",@27:@"twenty-seven",@28:@"twenty-eight",@29:@"twenty-nine",@30:@"thirty"\
}

@interface GeGuUIRuleControl ()

@property (nonatomic, strong) NSDictionary *show_Labels;

@end

@implementation GeGuUIRuleControl

- (NSString *)getTitleStringById:(NSNumber *)title_id
{
    return [Define_Data objectForKey:title_id];
}
- (UILabel *)getValueLabelById:(NSNumber *)title_id
{
    return [[self.show_Labels objectForKey:title_id] objectForKey:@"title_value"];
}

- (UILabel *)getKeyLabelById:(NSNumber *)title_id
{
    return [[self.show_Labels objectForKey:title_id] objectForKey:@"title_key"];
}

- (UIView *)creatTheViewByRule:(NSArray *)rule Point:(CGPoint)point  Size:(CGSize)size Interval:(CGFloat)interval
{
    UIView *geguView = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, size.width, 40)];
    [geguView setBackgroundColor:[UIColor redColor]];
    NSMutableDictionary *dic = @{}.mutableCopy;
    CGFloat max_y = 0;
    for (int column = 3; column >= 0; column--) {
        NSArray *item = rule[column];
        if ([rule[column] count] > 0) {
            CGFloat colmun_Width = size.width/(column+1);
            for (int index = 0; index < [item count]; index++) {
                //先从缓存中取，没有取到才去创建。
                UILabel *title_Key = [self getKeyLabelById:item[index]];
                if (!title_Key) {
                    NSString *titleStr = [self getTitleStringById:item[index]];
                    CGSize itemSize = [titleStr sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName,nil]];
                    title_Key = [[UILabel alloc] initWithFrame:CGRectMake(interval+(colmun_Width*(index%(column+1))), 25*(index/(column+1))+max_y, itemSize.width, itemSize.height)];
                    title_Key.text = titleStr;
                    title_Key.font = [UIFont systemFontOfSize:12];
                    
                }
                UILabel *title_Value = [self getValueLabelById:item[index]];
                if (!title_Value) {
                    title_Value = [[UILabel alloc] init];
                    title_Value.font = [UIFont systemFontOfSize:12];
                    title_Value.textAlignment = NSTextAlignmentRight;
                }
                //值必须要清空
                title_Value.text = @"--";
                //无论从那里得到的，都需要重新去设置Frame
                [title_Key setFrame:CGRectMake(interval+(colmun_Width*(index%(column+1))), 25*(index/(column+1))+max_y, CGRectGetWidth(title_Key.frame), CGRectGetHeight(title_Key.frame))];
                [title_Value setFrame:CGRectMake(CGRectGetMaxX(title_Key.frame), CGRectGetMinY(title_Key.frame), colmun_Width*(index%(column+1)+1)-interval-CGRectGetMaxX(title_Key.frame), CGRectGetHeight(title_Key.frame))];
                
                [geguView addSubview:title_Key];
                [geguView addSubview:title_Value];
                //缓存下当前页面的Label
                NSDictionary *key_Value = @{@"title_key":title_Key, @"title_value":title_Value};
                [dic setObject:key_Value forKey:item[index]];
                if (index == [item count] - 1) max_y = CGRectGetMaxY(title_Value.frame) + 10;
            }
        }
    }
    self.show_Labels = dic;
    [geguView setFrame:CGRectMake(point.x, point.y, size.width, max_y)];
    return geguView;
}


@end
