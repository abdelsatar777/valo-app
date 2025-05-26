# Keep javax.annotation classes
-keep class javax.annotation.** { *; }

# Keep all classes used by okhttp3 and okio
-dontwarn okhttp3.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }

-dontwarn okio.**
-keep class okio.** { *; }

# Avoid warnings from deprecated or unsafe code
-dontwarn javax.annotation.**
