//
//  Dog.h
//  消息转发机制测试
//
//  Created by xmy on 2021/2/22.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject

- (void)eatTogetherWith:(Animal *)animal;

@end

NS_ASSUME_NONNULL_END
