//
// Created by Brandon on 6/26/22.
//

#ifndef MACE_LOG_H
#define MACE_LOG_H

class Log {
public:
    static void Debug(const char* name, const char* fmt, ...);
    static void Info(const char* name, const char* fmt, ...);
    static void Warn(const char* name, const char* fmt, ...);
    static void Error(const char* name, const char* fmt, ...);
};

#define LOGD(...) Log::Debug(__FUNCTION__, __VA_ARGS__)
#define LOGI(...) Log::Info(__FUNCTION__, __VA_ARGS__)
#define LOGW(...) Log::Warn(__FUNCTION__, __VA_ARGS__)
#define LOGE(...) Log::Error(__FUNCTION__, __VA_ARGS__)

#endif //MACE_LOG_H
