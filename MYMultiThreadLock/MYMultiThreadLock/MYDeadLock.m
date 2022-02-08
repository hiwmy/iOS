//
//  MYDeadLock.m
//  MYMultiThreadLock
//
//  Created by wangmingyu on 2022/2/8.
//

#import "MYDeadLock.h"

@implementation MYDeadLock

+ (void)gcdSyncInMainQueue {
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"dead lock");
    });
}

+ (void)gcdSyncSerialQueueInsideSync {
    dispatch_queue_t serialQueue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_sync(serialQueue, ^{
        NSLog(@"2");
        dispatch_sync(serialQueue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    //Hello 1 2
}

+ (void)gcdAsyncSerialQueueInsideSync {
    dispatch_queue_t serialQueue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_async(serialQueue, ^{
        NSLog(@"2");
        dispatch_sync(serialQueue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    //Hello 1 2 5 World
}

@end
