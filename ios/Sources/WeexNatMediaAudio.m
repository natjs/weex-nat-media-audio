//
//  WeexNatMediaAudio.m
//
//  Created by huangyake on 17/1/7.
//  Copyright © 2017 Instapp. All rights reserved.
//

#import "WeexNatMediaAudio.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import <NatAudio/NatAudio.h>

@implementation WeexNatMediaAudio
@synthesize weexInstance;

WX_PlUGIN_EXPORT_MODULE(nat/media/audio, WeexNatMediaAudio)
WX_EXPORT_METHOD(@selector(play::))
WX_EXPORT_METHOD(@selector(pause:))
WX_EXPORT_METHOD(@selector(stop:))

- (void)play:(NSString *)path :(WXModuleCallback)callback{
    [[NatAudio singletonManger] play:path :^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)pause:(WXModuleCallback)callback{
    [[NatAudio singletonManger] pause:^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)stop:(WXModuleCallback)callback{
    [[NatAudio singletonManger] stop:^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)dealloc{
    [self stop:nil];
}

@end
