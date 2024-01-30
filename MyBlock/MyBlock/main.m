//
//  main.m
//  MyBlock
//
//  Created by wangmingyu02 on 2024/1/30.
//

#import <Foundation/Foundation.h>

void initBlock(void) {
    /*
     声明语法格式：returnType (^blockName)(parameterTypes) = ^returnType (parameters) {...};
     */
    void (^printBlock)(void) = ^void (void) {
        NSLog(@"hello world");
    };
    
    // 调用
    printBlock();
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        initBlock();
    }
    return 0;
}


