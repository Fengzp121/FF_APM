//
//  UIViewController+FF_Track.m
//  FF_APM
//
//  Created by ffzp on 2021/9/10.
//

#import "UIViewController+FF_Track.h"
#import "FFCrashTool.h"

@implementation UIViewController (FF_Track)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"UIViewController");
        FF_ExchangeInstanceMethod(cls, @selector(viewDidLoad), cls, @selector(ff_viewDidLoad));
    });
}

-(void)ff_viewDidLoad{
    [self ff_viewDidLoad];
    //需要controller命名规范，不对UIKit中的基础类作入侵
    if(![NSStringFromClass([self class]) hasPrefix:@"UI"]){
        //记录页面的出现
        NSLog(@"ff_viewDidLoad has been tracked! controller is : %@",NSStringFromClass([self class]));
    }
    
}

@end
