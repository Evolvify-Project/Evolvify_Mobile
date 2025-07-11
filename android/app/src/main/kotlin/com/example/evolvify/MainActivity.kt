package com.example.evolvify

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build
import android.provider.Settings

class MainActivity: FlutterActivity() {
    private val CHANNEL = "flutter/platform"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "isEmulator" -> {
                    result.success(isEmulator())
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

class MainActivity: FlutterActivity()