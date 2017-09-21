//
//  RnOcModule.m
//  AwesomeProject
//
//  Created by leeshuangai on 2017/9/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RnOcModule.h"
#import "React/RCTBridge.h"
#import "React/RCTEventDispatcher.h"
@implementation RnOcModule
@synthesize bridge = _bridge;
//为了实现RCTBridgeModule协议，你的类需要包含RCT_EXPORT_MODULE()宏。这个宏也可以添加一个参数用来指定在Javascript中访问这个模块的名字。如果你不指定，默认就会使用这个Objective-C类的名字。
RCT_EXPORT_MODULE()
//OC调用js
RCT_EXPORT_METHOD(OcCallJs) {
//  NSLog(@"KAAAAAAA'WOEIFsdlifjo代发借款分类考试的减肥");
  [self ocCallJs];
}
//js调用原生的方法
RCT_EXPORT_METHOD(JScallOc:(NSString *)first withAnoter:(RCTResponseSenderBlock)callback){
//   NSLog(@"js调用原生方法 first：%@ ，second%@",first,second);
  NSArray *events = [[NSArray alloc] initWithObjects:first,@"2", nil];
  NSNumber *num = [[NSNumber alloc] initWithInt:666];
  callback(@[num,events]);
}
- (void)changeType:(NSString *)type {
  NSLog(@"555555555555555555555555");
    [self.bridge.eventDispatcher sendAppEventWithName:@"changeType" body:@{@"type" : @"222"}];
  
}
- (void)ocCallJs{
  NSString *str = @"connection";
  [self.bridge.eventDispatcher sendAppEventWithName:@"ocCallJs" body:str];
}

@end

@implementation RCTBridge (RCTEventEmitter)

- (RCTEventEmitter *)eventEmitter
{
  return [self moduleForClass:[RCTEventEmitter class]];
}
@end

