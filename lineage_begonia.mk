# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from begonia device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := redmi
PRODUCT_DEVICE := begonia
PRODUCT_MANUFACTURER := redmi
PRODUCT_NAME := lineage_begonia
PRODUCT_MODEL := begonia

PRODUCT_GMS_CLIENTID_BASE := android-redmi
TARGET_VENDOR := redmi
TARGET_VENDOR_PRODUCT_NAME := begonia
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="begonia-userdebug 9 PPR1.180610.011 FACTORY-BEGONIA-1101 test-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Redmi/begonia/begonia:9/PPR1.180610.011/FACTORY-BEGONIA-1101:userdebug/test-keys
