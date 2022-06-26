//
// Created by Brandon on 5/16/22.
//

#ifdef MACE_ANDROID

#include "Log.h"
#include <android/log.h>

void Log::Debug(const char* name, const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    __android_log_vprint(ANDROID_LOG_DEBUG, name, fmt, args);
    va_end(args);
}

void Log::Info(const char* name, const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    __android_log_vprint(ANDROID_LOG_INFO, name, fmt, args);
    va_end(args);
}

void Log::Warn(const char* name, const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    __android_log_vprint(ANDROID_LOG_WARN, name, fmt, args);
    va_end(args);
}

void Log::Error(const char* name, const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    __android_log_vprint(ANDROID_LOG_ERROR, name, fmt, args);
    va_end(args);
}

#endif