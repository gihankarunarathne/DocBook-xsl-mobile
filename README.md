###	How to Use it ?

1. First you have to download the docbook xsl-1.77.1 version from http://sourceforge.net/projects/docbook/files/docbook-xsl/1.77.1/
2. Also download the Mobile package as zip from here.
3. Then add Mobile directory into docbook-xsl like docbook-xsl-1.77.1/mobile.
4. Then replace old docbook-xsl-1.77.1/extensions/webhelpIndexer.jar with the 
	https://github.com/gihankarunarathne/DocBook-xsl-mobile/blob/master/webhelpindexer.jar.
Now, you finished with settings up the package to use.

Follow the instructions in document https://github.com/gihankarunarathne/DocBook-xsl-mobile/tree/master/www.

### Support Platforms
	
  List of Available mobile platforms ::
```
  |
  |_Android             :$ant android-help *
  |__Apple iOS          :$ant iOS-help *
  |___Blackberry        :$ant blackberry-help
  |____Palm webOS
  |_____Samsung Bada
  |______Windows Phone	:$ant windows-phone-help
  ```
    key: " * " - currently implemented

### HTMLs for all platforms

To create chunked htmls which can be used in "www" folder of PhoneGap:
```
	$ ant mobile
```

### Android

To create Android .apk app with using chunked htmls :

  $ ant mobile.android
  
### iOS

To create Apple iOS app with using chunked htmls :

  $ ant mobile.iOS
  
