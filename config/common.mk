PRODUCT_BRAND ?= omni

# use specific resolution for bootanimation
ifneq ($(TARGET_BOOTANIMATION_SIZE),)
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bootanimation/res/$(TARGET_BOOTANIMATION_SIZE).zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1 \
    persist.sys.disable_rescue=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES  += ro.adb.secure=1
endif

# Enforce privapp-permissions whitelist
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=enforce

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/omni/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/omni/prebuilt/bin/blacklist:system/addon.d/blacklist \
    vendor/omni/prebuilt/bin/clean_cache.sh:system/bin/clean_cache.sh

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/sysconfig/backup.xml:system/etc/sysconfig/backup.xml

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.local.rc:root/init.omni.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

#permissions
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/permissions/privapp-permissions-omni.xml:system/etc/permissions/privapp-permissions-omni.xml \
    vendor/omni/prebuilt/etc/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml

# custom omni sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=omni_ringtone1.ogg \
    ro.config.notification_sound=omni_notification1.ogg \
    ro.config.alarm_alert=omni_alarm1.ogg

# Omni Sounds
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/omni/omni_ringtone1.ogg:system/media/audio/ringtones/omni_ringtone1.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_ringtone2.ogg:system/media/audio/ringtones/omni_ringtone2.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_ringtone3.ogg:system/media/audio/ringtones/omni_ringtone3.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_alarm1.ogg:system/media/audio/alarms/omni_alarm1.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_alarm2.ogg:system/media/audio/alarms/omni_alarm2.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_notification1.ogg:system/media/audio/notifications/omni_notification1.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_lowbattery1.ogg:system/media/audio/ui/omni_lowbattery1.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_lock_phone.ogg:system/media/audio/ui/omni_lock_phone.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_unlock_phone.ogg:system/media/audio/ui/omni_unlock_phone.ogg \
    vendor/omni/prebuilt/sounds/omni/omni_charge_start.ogg:system/media/audio/ui/omni_charge_start.ogg

# Pixel2 Alarm Sounds
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/google/alarms/A_real_hoot.ogg:system/media/audio/alarms/A_real_hoot.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Bright_morning.ogg:system/media/audio/alarms/Bright_morning.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Cuckoo_clock.ogg:system/media/audio/alarms/Cuckoo_clock.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Early_twilight.ogg:system/media/audio/alarms/Early_twilight.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Full_of_wonder.ogg:system/media/audio/alarms/Full_of_wonder.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Gentle_breeze.ogg:system/media/audio/alarms/Gentle_breeze.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Icicles.ogg:system/media/audio/alarms/Icicles.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Jump_start.ogg:system/media/audio/alarms/Jump_start.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Loose_change.ogg:system/media/audio/alarms/Loose_change.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Rolling_fog.ogg:system/media/audio/alarms/Rolling_fog.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Spokes.ogg:system/media/audio/alarms/Spokes.ogg \
    vendor/omni/prebuilt/sounds/google/alarms/Sunshower.ogg:system/media/audio/alarms/Sunshower.ogg

# Pixel2 Notification Sounds
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/google/notifications/Beginning.ogg:system/media/audio/notifications/Beginning.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Coconuts.ogg:system/media/audio/notifications/Coconuts.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Duet.ogg:system/media/audio/notifications/Duet.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/End_note.ogg:system/media/audio/notifications/End_note.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Gentle_gong.ogg:system/media/audio/notifications/Gentle_gong.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Mallet.ogg:system/media/audio/notifications/Mallet.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Orders_up.ogg:system/media/audio/notifications/Orders_up.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Ping.ogg:system/media/audio/notifications/Ping.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Pipes.ogg:system/media/audio/notifications/Pipes.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Popcorn.ogg:system/media/audio/notifications/Popcorn.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Shopkeeper.ogg:system/media/audio/notifications/Shopkeeper.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Sticks_and_stones.ogg:system/media/audio/notifications/Sticks_and_stones.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Tuneup.ogg:system/media/audio/notifications/Tuneup.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Tweeter.ogg:system/media/audio/notifications/Tweeter.ogg \
    vendor/omni/prebuilt/sounds/google/notifications/Twinkle.ogg:system/media/audio/notifications/Twinkle.ogg

# Pixel2 Ringtone Sounds
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/google/ringtones/Copycat.ogg:system/media/audio/ringtones/Copycat.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Crackle.ogg:system/media/audio/ringtones/Crackle.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Flutterby.ogg:system/media/audio/ringtones/Flutterby.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Hotline.ogg:system/media/audio/ringtones/Hotline.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Leaps_and_bounds.ogg:system/media/audio/ringtones/Leaps_and_bounds.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Lollipop.ogg:system/media/audio/ringtones/Lollipop.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Lost_and_found.ogg:system/media/audio/ringtones/Lost_and_found.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Mash_up.ogg:system/media/audio/ringtones/Mash_up.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Monkey_around.ogg:system/media/audio/ringtones/Monkey_around.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Schools_out.ogg:system/media/audio/ringtones/Schools_out.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/The_big_adventure.ogg:system/media/audio/ringtones/The_big_adventure.ogg \
    vendor/omni/prebuilt/sounds/google/ringtones/Zen_too.ogg:system/media/audio/ringtones/Zen_too.ogg

# Pixel2 UI Sounds
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/google/ui/audio_end.ogg:system/media/audio/ui/audio_end.ogg \
    vendor/omni/prebuilt/sounds/google/ui/audio_initiate.ogg:system/media/audio/ui/audio_initiate.ogg \
    vendor/omni/prebuilt/sounds/google/ui/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
    vendor/omni/prebuilt/sounds/google/ui/camera_focus.ogg:system/media/audio/ui/camera_focus.ogg \
    vendor/omni/prebuilt/sounds/google/ui/Dock.ogg:system/media/audio/ui/Dock.ogg \
    vendor/omni/prebuilt/sounds/google/ui/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
    vendor/omni/prebuilt/sounds/google/ui/KeypressDelete.ogg:system/media/audio/ui/KeypressDelete.ogg \
    vendor/omni/prebuilt/sounds/google/ui/KeypressInvalid.ogg:system/media/audio/ui/KeypressInvalid.ogg \
    vendor/omni/prebuilt/sounds/google/ui/KeypressReturn.ogg:system/media/audio/ui/KeypressReturn.ogg \
    vendor/omni/prebuilt/sounds/google/ui/KeypressSpacebar.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
    vendor/omni/prebuilt/sounds/google/ui/KeypressStandard.ogg:system/media/audio/ui/KeypressStandard.ogg \
    vendor/omni/prebuilt/sounds/google/ui/LowBattery.ogg:system/media/audio/ui/LowBattery.ogg \
    vendor/omni/prebuilt/sounds/google/ui/NFCFailure.ogg:system/media/audio/ui/NFCFailure.ogg \
    vendor/omni/prebuilt/sounds/google/ui/NFCInitiated.ogg:system/media/audio/ui/NFCInitiated.ogg \
    vendor/omni/prebuilt/sounds/google/ui/NFCSuccess.ogg:system/media/audio/ui/NFCSuccess.ogg \
    vendor/omni/prebuilt/sounds/google/ui/NFCTransferComplete.ogg:system/media/audio/ui/NFCTransferComplete.ogg \
    vendor/omni/prebuilt/sounds/google/ui/NFCTransferInitiated.ogg:system/media/audio/ui/NFCTransferInitiated.ogg \
    vendor/omni/prebuilt/sounds/google/ui/Trusted.ogg:system/media/audio/ui/Trusted.ogg \
    vendor/omni/prebuilt/sounds/google/ui/Undock.ogg:system/media/audio/ui/Undock.ogg \
    vendor/omni/prebuilt/sounds/google/ui/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
    vendor/omni/prebuilt/sounds/google/ui/VideoStop.ogg:system/media/audio/ui/VideoStop.ogg \
    vendor/omni/prebuilt/sounds/google/ui/WirelessChargingStarted.ogg:system/media/audio/ui/WirelessChargingStarted.ogg 
#    vendor/omni/prebuilt/sounds/google/ui/Unlock.ogg:system/media/audio/ui/Unlock.ogg \
#    vendor/omni/prebuilt/sounds/google/ui/Lock.ogg:system/media/audio/ui/Lock.ogg \

# Razer UI Sounds
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/razer/ui/Lock.ogg:system/media/audio/ui/Lock.ogg \
    vendor/omni/prebuilt/sounds/razer/ui/Unlock.ogg:system/media/audio/ui/Unlock.ogg

# Extra Alarms
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/extra/alarms/AAAAAAAAAAAAAAAGH!!!!.ogg:system/media/audio/alarms/AAAAAAAAAAAAAAAGH!!!!.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/ArmyWakeUp.ogg:system/media/audio/alarms/ArmyWakeUp.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/CyanAlarm.ogg:system/media/audio/alarms/CyanAlarm.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/DawnChorus.ogg:system/media/audio/alarms/DawnChorus.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Daybreak.ogg:system/media/audio/alarms/Daybreak.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/DrAlarm.ogg:system/media/audio/alarms/DrAlarm.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Feverfew.flac:system/media/audio/alarms/Feverfew.flac \
    vendor/omni/prebuilt/sounds/extra/alarms/Foxglove.flac:system/media/audio/alarms/Foxglove.flac \
    vendor/omni/prebuilt/sounds/extra/alarms/KHAlarm.ogg:system/media/audio/alarms/KHAlarm.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/MAKEITSTAHP.ogg:system/media/audio/alarms/MAKEITSTAHP.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/MusicBox.ogg:system/media/audio/alarms/MusicBox.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/NewDay.ogg:system/media/audio/alarms/NewDay.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/NuclearLaunch.ogg:system/media/audio/alarms/NuclearLaunch.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/ResidentAlarm.ogg:system/media/audio/alarms/ResidentAlarm.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/ResidentEvil.ogg:system/media/audio/alarms/ResidentEvil.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Scream.ogg:system/media/audio/alarms/Scream.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Serenity.ogg:system/media/audio/alarms/Serenity.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Surreal.ogg:system/media/audio/alarms/Surreal.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/The_secret_forest.ogg:system/media/audio/alarms/The_secret_forest.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Timer.ogg:system/media/audio/alarms/Timer.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Valkyries.ogg:system/media/audio/alarms/Valkyries.ogg \
    vendor/omni/prebuilt/sounds/extra/alarms/Wisteria.flac:system/media/audio/alarms/Wisteria.flac

# Extra Notifications
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/sounds/extra/notifications/1up.ogg:system/media/audio/notifications/1up.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/3dsms.ogg:system/media/audio/notifications/3dsms.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/004.ogg:system/media/audio/notifications/004.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/006.ogg:system/media/audio/notifications/006.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/008.ogg:system/media/audio/notifications/008.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/MarioDie.ogg:system/media/audio/notifications/MarioDie.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/MarioJump.ogg:system/media/audio/notifications/MarioJump.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/MarioPowerUp.ogg:system/media/audio/notifications/MarioPowerUp.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/meow1.ogg:system/media/audio/notifications/meow1.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/meow2.ogg:system/media/audio/notifications/meow2.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/meow3.ogg:system/media/audio/notifications/meow3.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/meow4.ogg:system/media/audio/notifications/meow4.ogg \
    vendor/omni/prebuilt/sounds/extra/notifications/ZeldaKey.ogg:system/media/audio/notifications/ZeldaKey.ogg

# mkshrc
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/mkshrc:system/etc/mkshrc

# whitelist packages for location providers not in system
PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Additional packages
-include vendor/omni/config/packages.mk

# Versioning
-include vendor/omni/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/common

# Enable dexpreopt for all nightlies
ifeq ($(ROM_BUILDTYPE),NIGHTLY)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
        WITH_DEXPREOPT_PIC := true
    endif
endif
# and weeklies
ifeq ($(ROM_BUILDTYPE),WEEKLY)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
        WITH_DEXPREOPT_PIC := true
    endif
endif
# and security releases
ifeq ($(ROM_BUILDTYPE),SECURITY_RELEASE)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
        WITH_DEXPREOPT_PIC := true
    endif
endif
# but not homemades
ifeq ($(ROM_BUILDTYPE),HOMEMADE)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
endif

# Include SDCLANG definitions if it is requested and available
ifeq ($(HOST_OS),linux)
    ifneq ($(wildcard vendor/qcom/sdclang/),)
        include vendor/omni/sdclang/sdclang.mk
    endif
endif
