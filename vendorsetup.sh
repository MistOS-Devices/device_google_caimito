# Pin BUILD_NUMBER so ro.build.version.incremental matches the Google factory
# image being impersonated (komodo/caiman/tokay fingerprints all end in
# .../CP2A.260805.005/15828068:user/release-keys).
#
# Soong reads BUILD_NUMBER from the environment (build/soong/ui/build/config.go)
# and emits it verbatim as ro.build.version.incremental (build/make/core/sysprop.mk).
# Left unset, it defaults to a build timestamp (e.g. 1785896563), which disagrees
# with the spoofed fingerprint's incremental — a coherence anomaly flagged by
# anti-detection scanners. Combined with BUILD_ID=CP2A.260705.006
# (build/make/core/build_id.mk), this makes ro.build.id, ro.build.display.id,
# ro.build.version.incremental and the fingerprint fully self-consistent.
#
# This is auto-sourced by build/make/envsetup.sh (source_vendorsetup) when you
# run `source build/envsetup.sh`. Only affects this caimito tree.
export BUILD_NUMBER=15828068
