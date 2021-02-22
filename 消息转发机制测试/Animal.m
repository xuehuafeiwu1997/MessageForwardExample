//
//  Animal.m
//  消息转发机制测试
//
//  Created by xmy on 2021/2/22.
//

#import "Animal.h"
#import <objc/runtime.h>
#import "Dog.h"

@implementation Animal

//如果是实例方法，重写这个方法
//动态解析方法补救
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString *method = NSStringFromSelector(sel);
//    if ([method isEqualToString:@"eatTogetherWith:"]) {
//        class_addMethod(self, sel, (IMP)dynamicIMP, "v@:@");
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//void dynamicIMP(id self,SEL _cmd,id value) {
//    NSString *sel = NSStringFromSelector(_cmd);
//        NSLog(@"self = %@ _cmd = %@ value = %@", self, sel, value);
//
//}

////快速向前转发模式
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSString *method = NSStringFromSelector(aSelector);
//    if ([method isEqualToString:@"eatTogetherWith:"]) {
//        Dog *dog = [[Dog alloc] init];
//        return dog;
//    }
//    return nil;
//}

//正常向前转发模式
//先实现方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"eatTogetherWith:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];;
    }
    return [super methodSignatureForSelector:aSelector];
}

//指定消息接收者
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = [anInvocation selector];
    Dog *dog = [[Dog alloc] init];
    if ([dog respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:dog];
        return;
    }
    [super forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSString *method = NSStringFromSelector(aSelector);
    if ([method isEqualToString:@"eatTogetherWith:"]) {
        NSLog(@"Animal 无法执行 eatTogetherWith：方法，特抛出异常告知。");
    }
}

@end
