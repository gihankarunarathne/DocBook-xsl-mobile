Author: Gihan Karunarathne
Last Modified Date: 12 July 2012

This  is the documentation to publish "DocBook" in "Android" app.

Table of Content :
	*
	|_ User Guide
	|___ Developer Guide

=============== User Guide ================================================================================

1.1.0. Build and Testing Android App ======================================================================

1.1.1. Build using Ant script ----------------------------------------------------------------------------

Before going to Build using Ant, you must setup "xsl/mobile/android/android.config" file.
	IMPORTANT :
		This means the platform number of Android target vertion which is given under
		$ android list targets
		Please refer for more details : http://developer.android.com/tools/devices/managing-avds-cmdline.html
	 Also check the "Type: Platform", but not "Type: Add-on".

Go to the directory where "build.xml" is took place for Android ( xsl/mobile/andriod). Then run following command from Terminal :

	$ ant android_debug.apk

Or go to the directory where "build.xml" (main ant scripts for mobile-help) is took place for Android ( xsl/mobile/ ). 

NOTE: This will created an android app which is signed by debug 'keystore'. You can not distribute it for end-users. But can be use for debuging purpose.

1.1.2. Testing Android app -------------------------------------------------------------------------------

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


============== Developer Guide ===========================================================================

2.1.0. Creating an Android Project -----------------------------------------------------------------------
	(ref : http://developer.android.com/tools/projects/projects-cmdline.html#CreatingAProject )

To create a new Android project, open a command-line, navigate to the tools/ directory of your SDK and run:

	$ android create project \
	--target <target_ID> \
	--name <your_project_name> \
	--path path/to/your/project \
	--activity <your_activity_name> \
	--package <your_package_namespace>

As an Example :
	$ android create project \
	--target 5 \
	--name DocBookMobileApp \
	--path ./AndroidDocBookApp \
	--activity DocBookMobileAppActivity \
	--package docbook.xsl.mobile

2.1.2. Updating a Project ------------------------------------------------------------------------------
	(ref : http://developer.android.com/tools/projects/projects-cmdline.html#UpdatingAProject )

	If you're upgrading a project from an older version of the Android SDK or want to create a new project from existing code, use the android update project command to update the project to the new development environment.

	$ android update project --name <project_name> --target <target_ID> --path <path_to_your_project>

Example : 
	$ android update project --name newDocBookMobileApp --target 6 --path ./AndroidDocBookApp

2.2.0. SetUp with PhoneGap
	(ref : http://docs.phonegap.com/en/1.9.0/guide_getting-started_index.md.html )
	To integrate PhoneGap with android, here we follow "Getting Started with Android". (ref: http://docs.phonegap.com/en/1.9.0/guide_getting-started_android_index.md.html#Getting%20Started%20with%20Android )

2.2.1.Setting Up for Android -------------------------------------------------------------------------


