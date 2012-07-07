Author: Gihan Karunarathne
Last Modified Date: 02 July 2012

1.1.Creating an Android Project
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

1.2.Updating a Project
	(ref : http://developer.android.com/tools/projects/projects-cmdline.html#UpdatingAProject )

If you're upgrading a project from an older version of the Android SDK or want to create a new project from existing code, use the android update project command to update the project to the new development environment.

	$ android update project --name <project_name> --target <target_ID> --path <path_to_your_project>

Example : 
	$ android update project --name newDocBookMobileApp --target 6 --path ./AndroidDocBookApp

2.0. SetUp with PhoneGap
	(ref : http://docs.phonegap.com/en/1.9.0/guide_getting-started_index.md.html )
To integrate PhoneGap with android, here we follow "Getting Started with Android". (ref: http://docs.phonegap.com/en/1.9.0/guide_getting-started_android_index.md.html#Getting%20Started%20with%20Android )

1.1.Setting Up for Android


