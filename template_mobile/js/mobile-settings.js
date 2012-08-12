//<!--
/**********************************************************
 *** Author : Gihan Karunarathne                         ***
 *** Email : gckarunarathne@gmail.com                    ***
 *** Last Modified Date : 11 August 2012                   ***
 ***********************************************************/
/**
*	Description :
*	MORE DETAILS : https://github.com/carhartl/jquery-cookie/
*/

/**
 * When a page is loading apply the mobile-settings
 */
$("div[data-role*='page']").live('pageinit',function(){
  //apply font-size to page
  if ($.cookie('font-size') === null) {
    //console.log($.cookie('font-size'));
    //alert("init cookie");
    setDefFontSize();
    $("html").css('font-size', $.cookie('font-size'));
    $(".ui-header .ui-title, .ui-footer .ui-title").css('font-size',$.cookie('font-size'));
    //alert(String.concat("ccccccccccc now cookie is " ,$.cookie('font-size')));
  }else{
    $("html").css('font-size', $.cookie('font-size'));
    $(".ui-header .ui-title, .ui-footer .ui-title").css('font-size',$.cookie('font-size'));
    //alert(String.concat("dddddddddddddddddddd now cookie is " ,$.cookie('font-size')));
  }
  //apply font-family to page
  if ($.cookie('font-family') === null) {
    setDefFontFamily();
    $("html").css('font-family', $.cookie('font-family'));
  }else{
    $("html").css('font-family', $.cookie('font-family'));
  }

});

/********************************************************************************
 * Default settings for cookies.                                               **
 * When cookie value is not set,these will be called and set there value.      **
 * Also,user can set them later                                                **.
 ********************************************************************************/
// set the default expire days for cookies (in days)
var defExpireDays = 7;
// set default domain/path name for access cookies
var defDomainPath = '/';
// set default font-size
var defFontSize = '12px';
// set default font-family
var defFontFamily = 'Helvetica';

/**
 * Default value for font-size
 */
function setDefFontSize(){
  setDefCookie('font-size',defFontSize);
}
/**
 * Default value for font-family
 */
function setDefFontFamily(){
  setDefCookie('font-family' , defFontFamily);
}
/**
 * Recurring method for set default values
 */
function setDefCookie($name,$value){
  $.cookie($name , $value , {
    expires: defExpireDays,
    path: defDomainPath
  });
}

/************************************************************************
 * Set the User defined values to the Cookies                         ***
 ***********************************************************************/
 
// set the expire days for cookies (in days)
var expireDays = 7;
// set domain/path name for access cookies
var domainPath = '/';

$(function () {

  $("#select-menu-bar-position").bind("change", function (event, ui) {
    try {
      setCookie('menubarposition', $("#select-menu-bar-position").val() );
        //alert(String.concat("cookie is created with ",$("#select-menu-bar-position").val()," and now cookie is " ,$.cookie('menubarposition')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }

  });


  $("#select-toc-position").bind("change", function (event, ui) {
    try {
        setCookie('tocposition', $("#select-toc-position").val());
        //alert(String.concat("cookie is created with ",$("#select-toc-position").val()," and now cookie is " ,$.cookie('tocposition')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });

  //page navigation

  $("#select-prev-page-direction").bind("change", function (event, ui) {
    try {
        setCookie('prevpage', $("#select-prev-page-direction").val());
        //alert(String.concat("cookie is created with ",$("#select-prev-page-direction").val()," and now cookie is " ,$.cookie('prevpage')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });


  $("#select-next-page-direction").bind("change", function (event, ui) {
    try {
      setCookie('nextpage', $("#select-next-page-direction").val());
      //alert(String.concat("cookie is created with ",$("#select-next-page-direction").val()," and now cookie is " ,$.cookie('nextpage')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });


  //pop up menus
  $("#select-pop-up-menu-bar").bind("change", function (event, ui) {
    try {
      setCookie('popupmenubar', $("#select-pop-up-menu-bar").val());
      //alert(String.concat("cookie is created with ",$("#select-pop-up-menu-bar").val()," and now cookie is " ,$.cookie('popupmenubar')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });


  $("#select-pop-up-toc").bind("change", function (event, ui) {
    try {
      setCookie('popuptoc', $("#select-pop-up-toc").val());
      //alert(String.concat("cookie is created with ",$("#select-pop-up-toc").val()," and now cookie is " ,$.cookie('popuptoc')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });

  /*************************************************************************************
   **       Advance Settings                                                          **
   *************************************************************************************/

  $("#remember-page").bind("change", function (event, ui) {
    //alert("lets rem page");
    try {
      setCookie('rememberpage', $("#remember-page").val());
      //alert(String.concat("cookie is created with ",$("#remember-page").val()," and now cookie is " ,$.cookie('rememberpage')));
      //document.getElementById("btest").innerHTML = $.cookie('rememberpage');
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });

  $("#voice-search").bind("change", function (event, ui) {
    //alert("lets do voice search");
    try {
      setCookie('voicesearch', $("#voice-search").val());
      //alert(String.concat("cookie is created with ",$("#voice-search").val()," and now cookie is " ,$.cookie('voicesearch')));
      //document.getElementById("btest").innerHTML = $.cookie('voicesearch');
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });
});
/**
 * Recurring methods for user settings
 */
function setCookie($name,$value){
  $.cookie( $name , $value , {
    expires: expireDays,
    path: domainPath
  });
}


// for testing purposes of cookies
/*function getcookie(){
	var nameVal = document.forms['cookieform'].cookievalue.val();
	//var nameVal = 'name';
	$("find").innerHTML=nameVal;
	$("test").innerHTML=$.cookie(nameVal);
} */

//-->