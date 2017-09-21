//
//  RnOcModule.h
//  AwesomeProject
//
//  Created by leeshuangai on 2017/9/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"
//#import "RCTBridgeModule.h" wrong
@interface RnOcModule : NSObject<RCTBridgeModule>

@end
@interface RCTBridge (RCTEventEmitter)

- (RCTEventEmitter *)eventEmitter;

@end
