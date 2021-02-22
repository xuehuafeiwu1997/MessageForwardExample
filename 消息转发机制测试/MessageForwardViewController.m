//
//  MessageForwardViewController.m
//  消息转发机制测试
//
//  Created by xmy on 2021/2/22.
//

#import "MessageForwardViewController.h"
#import "Animal.h"

@interface MessageForwardViewController ()

@end

//参考简书：https://www.jianshu.com/p/23a939a0476e
@implementation MessageForwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"消息转发机制";
    
    Animal *one = [[Animal alloc] init];
    Animal *two = [[Animal alloc] init];
    [one eatTogetherWith:two];
}

@end
