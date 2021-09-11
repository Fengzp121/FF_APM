//
//  UIButton+FF_Track.m
//  FF_APM
//
//  Created by ffzp on 2021/9/10.
//

#import "UIButton+FF_Track.h"
#import "FFCrashTool.h"
@implementation UIButton (FF_Track)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FF_ExchangeInstanceMethod([self class], @selector(sendAction:to:forEvent:), [self class], @selector(ff_sendAction:to:forEvent:));
    });
}

-(void)ff_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    [self ff_sendAction:action to:target forEvent:event];
    NSLog(@"%@ button is touched!",NSStringFromClass([self class]));
}


@end
