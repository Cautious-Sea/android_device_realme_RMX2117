/*
 * Copyright 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "android.hardware.light@2.0-service.RMX2117"

#include <android-base/logging.h>
#include <hidl/HidlTransportSupport.h>

#include "Light.h"

using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;

using android::hardware::light::V2_0::ILight;
using android::hardware::light::V2_0::implementation::Light;

using android::OK;
using android::status_t;

// Android 16 Clang libc++ emits references to __libcpp_verbose_abort.
// Provide a local weak definition to satisfy the symbol when running
// against VNDK v31 libc++.so on user builds.
extern "C" __attribute__((weak)) void _ZNSt3__122__libcpp_verbose_abortEPKcz(const char* /*format*/, ...) {
    abort();
}

int main() {
    android::sp<ILight> service = new Light();

    configureRpcThreadpool(1, true);

    status_t status = service->registerAsService();
    if (status != OK) {
        LOG(ERROR) << "Cannot register Light HAL service.";
        return 1;
    }

    LOG(INFO) << "Light HAL service ready.";

    joinRpcThreadpool();

    LOG(ERROR) << "Light HAL service failed to join thread pool.";
    return 1;
}
