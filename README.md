		* === List of Available mobile platforms ===
      	|
      	|_Android             :$ant android-help *
      	|__Apple iOS          :$ant iOS-help
      	|___Blackberry        :$ant blackberry-help
      	|____Palm webOS
      	|_____Samsung Bada
      	|______Windows Phone	:$ant windows-phone-help
    
    key: " * " - currently implemented

=== HTMLs for all platforms ===================================

To create chunked htmls which can be used in "www" folder of PhoneGap:

	$ ant mobile


=== Android  ==================================================

Go and Edit  xsl/mobile/android/android.config with your data.

Then execute to create a .apk which is signed by debug key :

	$ ant mobile_android_debug_apk

( debug .apk can use to debug the application ) The output will be build in "xsl/mobile/android/$output-dir/bin/Activitynam-debug.apk".

How to test output ? ----------------------------------------------------


Execute following command and make an Emulator :

	$ android avd

NOTE: When You are creating an Emulator, make sure the its platform version is compatible with your application.

After create an Emulator, then run it.
To install created Android app, go to the output directory of app and then also for 'bin' directory inside it.

	$ android install path/to/.apk

Ex: If you are in xsl/mobile directory,

	$ android install andriod/output/bin/DocBookMobileAppActivity-debug.apk

If you already installed current app that you want to install, then you can reinstall it by:

	$ android install [-r] path/to/.apk

Ex: If you are in xsl/mobile directory,

	$ android install -r andriod/output/bin/DocBookMobileAppActivity-debug.apk

