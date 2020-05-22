package com.mupper.famezapp

import android.app.Activity
import androidx.annotation.CallSuper
import androidx.multidex.MultiDexApplication
import io.flutter.view.FlutterMain

class FamezApp : MultiDexApplication() {

    var mCurrentActivity: Activity? = null

    @CallSuper
    override fun onCreate() {
        super.onCreate();
        FlutterMain.startInitialization(this)
    }
}

