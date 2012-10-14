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
    mobile.setDefFontSize();
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
    mobile.setDefFontFamily();
    $("html").css('font-family', $.cookie('font-family'));
  }else{
    $("html").css('font-family', $.cookie('font-family'));
  }
  /**************************************/
  if ($.cookie('menubardirection') === null ){
    mobile.setDefmenubardirection();
  }
  if ($.cookie('tocdirection') === null ){
    mobile.setDeftocdirection();
  }
  /*************************************/
  if ($.cookie('popupmenubar') === null ){
    mobile.setDefpopupmenubar();
  }
  if ($.cookie('popuptoc') === null ){
    mobile.setDefpopuptoc();
  }
  if ($.cookie('prevpage') === null ){
    mobile.setDefPrevPage();
  }
  if ($.cookie('nextpage') === null ){
    mobile.setDefNextPage();
  }

});

/********************************************************************************
 * Default settings for cookies.                                               **
 * When cookie value is not set,these will be called and set there value.      **
 * Also,user can set them later                                                **.
 ********************************************************************************/
var mobile = new function(){
  // set the default expire days for cookies (in days)
  this.defExpireDays = 7;
  // set default domain/path name for access cookies
  this.defDomainPath = '/';
  // set default font-size
  this.defFontSize = '12px';
  // set default font-family
  this.defFontFamily = 'Helvetica';
  // set default menubar direction
  this.defmenubardirection ='swipeUp';
  // set default toc direction
  this.deftocdirection = 'swipeDown';
// set default popup menubar
  this.defpopupmenubar = 'showMenuBar';
// set default pop up toc
  this.defpopuptoc = 'showtoc';
// set defaulf Prev Page swipe direction
  this.defPrevPage = 'swipeRight';
// set defaulf Next Page swipe direction
  this.defNextPage = 'swipeLeft';
// remember-search-word
  this.defremembersearchword = 'remembersearchword';
  
  /**
   * For user defined settings
   */
   
  // set the expire days for cookies (in days)
  this.expireDays = 7;
  // set domain/path name for access cookies
  this.domainPath = '/';

/**
 * Default value for font-size
 */
  this.setDefFontSize = function(){
    this.setDefCookie('font-size',mobile.defFontSize);
}
/**
 * Default value for font-family
 */
  this.setDefFontFamily = function(){
    this.setDefCookie('font-family' , mobile.defFontFamily);
}
/**********************************************
 * Default value for menubardirection
 */
 this.setDefmenubardirection = function(){
  this.setDefCookie('menubardirection' , mobile.defmenubardirection);
}
/**
 * Default value for tocdirection
 */
  this.setDeftocdirection = function(){
  this.setDefCookie('tocdirection' , mobile.deftocdirection);
}
/**********************************************
 * Default value for popupmenubar
 */
  this.setDefpopupmenubar = function(){
  this.setDefCookie('popupmenubar' , mobile.defpopupmenubar);
}
/**
 * Default value for popuptoc
 */
  this.setDefpopuptoc = function(){
  this.setDefCookie('popuptoc' , mobile.defpopuptoc);
}
/***********************************************
 * Default value for Prev Page swipe direction
 */
  this.setDefPrevPage = function(){
  this.setDefCookie('prevpage' , mobile.defPrevPage);
}
/**
 * Default value for Next Page swipe direction
 */
this.setDefNextPage = function(){
  this.setDefCookie('nextpage' , mobile.defNextPage);
}
/************Advance settings ************/
/**
 * Default value for remembersearchword
 */
this.setDefremembersearchword = function(){
  this.setDefCookie('remembersearchword' , mobile.defremembersearchword);
}

/**********************************************
 * Recurring method for set default values
 **********************************************/
this.setDefCookie = function($name,$value){
  $.cookie($name , $value , {
    expires: this.defExpireDays,
    path: this.defDomainPath
  });
}

/**
 * Recurring methods for user settings (below)
 */
this.setCookie = function($name,$value){
  $.cookie( $name , $value , {
    expires: this.expireDays,
    path: this.domainPath
  });
}
}
/************************************************************************
 * Set the User defined values to the Cookies                         ***
 ***********************************************************************/

$(document).bind('pageinit',function () {

  $("#select-menu-bar-direction").bind("change", function (event, ui) {
    try {
      mobile.setCookie('menubardirection', $("#select-menu-bar-direction").val() );
      if($.cookie('menubardirection')=== $.cookie('tocdirection') ){
        if( "swipeUp"===$.cookie('menubardirection') ){
          mobile.setCookie('tocdirection',"swipeDown");
        }else if( "swipeDown"===$.cookie('menubardirection') ){
          mobile.setCookie('tocdirection',"swipeUp");
        }
        // refresh page after reset values
        refreshSelectMenus();
      }
        //alert(String.concat("cookie is created with ",$("#select-menu-bar-direction").val()," and now cookie is " ,$.cookie('menubardirection')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }

  });


  $("#select-toc-direction").bind("change", function (event, ui) {
    try {
      mobile.setCookie('tocdirection', $("#select-toc-direction").val());
      if($.cookie('menubardirection')=== $.cookie('tocdirection') ){
        if( "swipeUp"===$.cookie('tocdirection') ){
          mobile.setCookie('menubardirection',"swipeDown");
        }else if( "swipeDown"===$.cookie('tocdirection') ){
          mobile.setCookie('menubardirection',"swipeUp");
        }
        // refresh page after reset values
        refreshSelectMenus();
      }  
        //alert(String.concat("cookie is created with ",$("#select-toc-direction").val()," and now cookie is " ,$.cookie('tocdirection')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }
  });
  
  /************ pop up menus **************************************/
  $("#select-pop-up-menu-bar").bind("change", function (event, ui) {
    try {
      mobile.setCookie('popupmenubar', $("#select-pop-up-menu-bar").val());
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
      mobile.setCookie('popuptoc', $("#select-pop-up-toc").val());
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

  /*************************** page navigation ******************************/

  $("#select-prev-page-direction").bind("change", function (event, ui) {
    try {
        mobile.setCookie('prevpage', $("#select-prev-page-direction").val());
        if($.cookie('nextpage')=== $.cookie('prevpage') ){
          if( "swipeRight"===$.cookie('prevpage') ){
            setCookie('nextpage',"swipeLeft");
          }else if( "swipeLeft"===$.cookie('prevpage') ){
            mobile.setCookie('nextpage',"swipeRight");
          }
          // refresh page after reset values
          refreshSelectMenus();
        }
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
      mobile.setCookie('nextpage', $("#select-next-page-direction").val());
      if($.cookie('nextpage')=== $.cookie('prevpage') ){
          if( "swipeRight"===$.cookie('nextpage') ){
            setCookie('prevpage',"swipeLeft");
          }else if( "swipeLeft"===$.cookie('nextpage') ){
            mobile.setCookie('prevpage',"swipeRight");
          }
        // refresh page after reset values
        refreshSelectMenus();
        }
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

  /*************************************************************************************
   **       Advance Settings                                                          **
   *************************************************************************************/

  $("#remember-search-word").bind("change", function (event, ui) {
    //alert("lets rem page");
    try {
      mobile.setCookie('remembersearchword', $("#remember-search-word").val());
      //alert(String.concat("cookie is created with ",$("#remember-search-word").val()," and now cookie is " ,$.cookie('remembersearchword')));
      //document.getElementById("btest").innerHTML = $.cookie('remembersearchword');
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
      mobile.setCookie('voicesearch', $("#voice-search").val());
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
  
  // reset Values to default values when click "Reset" button
  $("#reset-settings").bind("change", function (event, ui) {
    alert("reset");
    mobile.setDefFontSize();
    mobile.setDefFontFamily();
    mobile.setDefmenubardirection();
    mobile.setDeftocdirection();
    mobile.setDefpopupmenubar();
    mobile.setDefpopuptoc();
    mobile.setDefPrevPage();
    mobile.setDefNextPage();
    // refresh page after reset values
    refreshSelectMenus();
    
  });
  
});


// for testing purposes of cookies
/*function getcookie(){
	var nameVal = document.forms['cookieform'].cookievalue.val();
	//var nameVal = 'name';
	$("find").innerHTML=nameVal;
	$("test").innerHTML=$.cookie(nameVal);
} */

//-->