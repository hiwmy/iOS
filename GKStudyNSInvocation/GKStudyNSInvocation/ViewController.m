//
//  ViewController.m
//  GKStudyNSInvocation
//
//  Created by wangmingyu02 on 2022/9/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 方法签名类
    /*
     方法签名中保存了方法的名称/参数/返回值，协同NSInvocation来进行消息的转发
     方法签名一般是用来设置参数和获取返回值的, 和方法的调用没有太大的关系
     */
    // 获取某个类的实例方法的方法签名有两种方式
    NSMethodSignature *signature = [ViewController instanceMethodSignatureForSelector:@selector(run:)];
    NSMethodSignature *signature1 = [self methodSignatureForSelector:@selector(run:)];
    // 获取某个类的类方法的方法签名有一种方式
    NSMethodSignature *signature2 = [ViewController methodSignatureForSelector:@selector(run:)];
    
    NSLog(@"\nsignature is %@\nsignature1 is %@\nsignature2 is %@\n", signature, signature1, signature2);
    
    /*
     只要返回值和参数类型都相同，那么不论方法名是否相同，都会返回同一个方法签名对象。
     例如 - (void)run:(NSString *)method 与 + (void)run:(NSString *)method地址是相同的
    */
    
    NSMethodSignature *signature3 = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    
    
    // NSInvocation中保存了方法所属的对象/方法名称/参数/返回值
    //其实NSInvocation就是将一个方法变成一个对象
    //2、创建NSInvocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature2];
    //设置方法调用者
    invocation.target = self;
//    invocation.target = ViewController.class;
    //注意：这里的方法名一定要与方法签名类中的方法一致
    invocation.selector = @selector(run:);
    NSString *way = @"byCar";
    //这里的Index要从2开始，因为0跟1已经被占据了，分别是self（target）,selector(_cmd)
    [invocation setArgument:&way atIndex:2];
    
    //3、调用invoke方法 会在运行时通过目标对象去寻找对应的方法，从而确保唯一性
    [invocation invoke];
}


//实现run:方法
- (void)run:(NSString *)method{
    NSLog(@"- method is %@", method);
}

+ (void)run:(NSString *)method{
    NSLog(@"+ method is %@", method);
}



/*
 参考文章：
 https://www.jianshu.com/p/70a8b3f62107
 https://blog.csdn.net/wzc10101415/article/details/80305840
 */

@end
