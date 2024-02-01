//
//  ViewController.m
//  MyBlock
//
//  Created by wangmingyu02 on 2024/2/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self blockInFunction];
    [self blockAsParamsInFunction:^(NSString *name, NSInteger age) {
        NSLog(@"name:%@ age:%zd", name, age);
    }];
}

/*
 block在函数内部的使用
 目的：分层
 */
- (void)blockInFunction {
    // 逻辑分层
    NSInteger (^addBlock)(NSInteger, NSInteger) = ^NSInteger (NSInteger number1, NSInteger number2) {
        return number1 + number2;
    };
    
    NSInteger result = addBlock(1,2);
    NSLog(@"%zd", result);
}

/*
 block作为方法参数
 目的：回传事件
 */
- (void)blockAsParamsInFunction:(void (^)(NSString *name, NSInteger age))callBackBlock {
    callBackBlock(@"yu", 18);
}


@end
