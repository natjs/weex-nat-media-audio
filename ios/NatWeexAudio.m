//
//  NatWeexAudio.m
//
//  Created by huangyake on 17/1/7.
//  Copyright © 2017 Nat. All rights reserved.
//

#import "NatWeexAudio.h"
#import "NatAudio.h"

@implementation NatWeexAudio
WX_EXPORT_METHOD(@selector(play::))
WX_EXPORT_METHOD(@selector(pause:))
WX_EXPORT_METHOD(@selector(stop:))




- (void)play:(NSString *)path :(WXModuleCallback)callback{
    
    [[NatAudio singletonManger] play:path :^(id error,id result) {
        if (error) {
            if (callback) {
                callback(error);
            }
        }else{
            if (callback) {
                callback(result);
            }
        }

    }];
}

- (void)pause:(WXModuleCallback)callback{
    [[NatAudio singletonManger] pause:^(id error,id result) {
        if (error) {
            if (callback) {
                callback(error);
            }
        }else{
            if (callback) {
                callback(result);
            }
        }

    }];
}
- (void)stop:(WXModuleCallback)callback{
    [[NatAudio singletonManger] stop:^(id error,id result) {
        if (error) {
         if(callback)callback(error);
        }else{
           if(callback) callback(result);
        }
    }];
    
}

- (void)dealloc{
    [self stop:nil];
}
@end
