//
//  MYDeadLock.h
//  MYMultiThreadLock
//
//  Created by wangmingyu on 2022/2/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYDeadLock : NSObject

+ (void)gcdSyncInMainQueue;

+ (void)gcdSyncSerialQueueInsideSync;

+ (void)gcdAsyncSerialQueueInsideSync;

@end

NS_ASSUME_NONNULL_END
