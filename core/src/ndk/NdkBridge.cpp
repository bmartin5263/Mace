//
// Created by Brandon on 6/18/22.
//

#include "NdkBridge.h"
#include "../Engine.h"
#include "../Log.h"

NdkBridge::NdkBridge(android_app* androidApp, Engine* engine):
    androidApp(androidApp), engine(engine)
{
    LOGI("Hello, NdkBridge!");
}

void NdkBridge::initialize() {
    androidApp->userData = this;
    androidApp->onAppCmd = NdkBridge::OnAppCmd;
}

void NdkBridge::onFrame() {
    int id;
    int events;
    android_poll_source *source;

    id = ALooper_pollAll(
            hasFocus() ? 0 : -1,
            nullptr,
            &events,
            (void **) &source
    );
    while(id >= 0) {
        // 1 = Command (source != null)
        // 2 = Input Event (source != null)
        // 3 = Clock tick?

        if (id > 3) {
//            WARN("Polled: %d", id);
        }

        // Process this event.
        if (source != nullptr) {
            if (id > 3) {
//                WARN("Source Process: %d", id);
            }
            source->process(androidApp, source);
        }

        if (id == LOOPER_ID_USER) {
//            sensorManager.process();
        }

        // Check if we are exiting.
//        if (app->destroyRequested != 0) {
//            termWindow();
//            return false;
//        }
        id = ALooper_pollAll(
                hasFocus() ? 0 : -1,
                nullptr,
                &events,
                (void **) &source
        );
    }
    this->engine->update();
    this->engine->draw();
}

void NdkBridge::OnAppCmd(android_app* appState, int32_t cmd) {
    auto self = (NdkBridge*)appState->userData;
    switch (cmd) {
        /**
         * Command from main thread: the AInputQueue has changed.  Upon processing
         * this command, android_app->inputQueue will be updated to the new queue
         * (or NULL).
         */
        case APP_CMD_INPUT_CHANGED:
            LOGE("Input Changed");
            break;

            /**
             * Command from main thread: a new ANativeWindow is ready for use.  Upon
             * receiving this command, android_app->window will contain the new window
             * surface.
             */
        case APP_CMD_INIT_WINDOW:
            LOGE("Init Window");
            self->hasWindow = true;
            break;

            /**
             * Command from main thread: the existing ANativeWindow needs to be
             * terminated.  Upon receiving this command, android_app->window still
             * contains the existing window; after calling android_app_exec_cmd
             * it will be set to NULL.
             */
        case APP_CMD_TERM_WINDOW:
            LOGE("Term Window");
            self->hasWindow = false;
            break;

            /**
             * Command from main thread: the current ANativeWindow has been resized.
             * Please redraw with its new size.
             */
        case APP_CMD_WINDOW_RESIZED:
            break;

            /**
             * Command from main thread: the system needs that the current ANativeWindow
             * be redrawn.  You should redraw the window before handing this to
             * android_app_exec_cmd() in order to avoid transient drawing glitches.
             */
        case APP_CMD_WINDOW_REDRAW_NEEDED:
            break;

            /**
             * Command from main thread: the content area of the window has changed,
             * such as from the soft input window being shown or hidden.  You can
             * find the new content rect in android_app::contentRect.
             */
        case APP_CMD_CONTENT_RECT_CHANGED:
            break;

            /**
             * Command from main thread: the app's activity window has gained
             * input focus.
             */
        case APP_CMD_GAINED_FOCUS:
            LOGE("Gain Focus");
            self->setFocused(true);
            break;

            /**
             * Command from main thread: the app's activity window has lost
             * input focus.
             */
        case APP_CMD_LOST_FOCUS:
            LOGE("Lost Focus");
            self->setFocused(false);
            break;

            /**
             * Command from main thread: the current device configuration has changed.
             */
        case APP_CMD_CONFIG_CHANGED:
            break;

            /**
             * Command from main thread: the system is running low on memory.
             * Try to reduce your memory use.
             */
        case APP_CMD_LOW_MEMORY:
            break;

            /**
             * Command from main thread: the app's activity has been started.
             */
        case APP_CMD_START:
            break;

            /**
             * Command from main thread: the app's activity has been resumed.
             */
        case APP_CMD_RESUME:
            break;

            /**
             * Command from main thread: the app should generate a new saved state
             * for itself, to restore from later if needed.  If you have saved state,
             * allocate it with malloc and place it in android_app.savedState with
             * the size in android_app.savedStateSize.  The will be freed for you
             * later.
             */
        case APP_CMD_SAVE_STATE:
            break;

            /**
             * Command from main thread: the app's activity has been paused.
             */
        case APP_CMD_PAUSE:
            break;

            /**
             * Command from main thread: the app's activity has been stopped.
             */
        case APP_CMD_STOP:
            break;

            /**
             * Command from main thread: the app's activity is being destroyed,
             * and waiting for the app thread to clean up and exit before proceeding.
             */
        case APP_CMD_DESTROY:
            break;

        default:
            break;
    }
}
