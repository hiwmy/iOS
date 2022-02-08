//
//  main.m
//  MYMultiThreadLock
//
//  Created by wangmingyu on 2022/2/8.
//

#import <Foundation/Foundation.h>
#import "MYDeadLock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello");
//        [MYDeadLock gcdSyncInMainQueue];
        [MYDeadLock gcdSyncSerialQueueInsideSync];
        NSLog(@"World");
    }
    return 0;
}
