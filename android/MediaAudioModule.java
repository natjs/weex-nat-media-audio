package com.nat.weex;

import com.nat.media_audio.HLAudioModule;
import com.nat.media_audio.HLModuleResultListener;
import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.bridge.JSCallback;
import com.taobao.weex.common.WXModule;

/**
 * Created by Daniel on 17/2/17.
 * Copyright (c) 2017 Nat. All rights reserved.
 */

public class MediaAudioModule extends WXModule {

    @JSMethod
    public void play(String path, final JSCallback jsCallback) {
        HLAudioModule.getInstance().play(path, new HLModuleResultListener() {
            @Override
            public void onResult(Object o) {
                jsCallback.invoke(o);
            }
        });
    }

    @JSMethod
    public void pause(final JSCallback jsCallback) {
        HLAudioModule.getInstance().pause(new HLModuleResultListener() {
            @Override
            public void onResult(Object o) {
                jsCallback.invoke(o);
            }
        });
    }

    @JSMethod
    public void stop(final JSCallback jsCallback) {
        HLAudioModule.getInstance().stop(new HLModuleResultListener() {
            @Override
            public void onResult(Object o) {
                jsCallback.invoke(o);
            }
        });
    }
}
