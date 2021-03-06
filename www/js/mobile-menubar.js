//<!--
/*******************************************************
 * Author : Gihan Karunarathne                         *
 * Email : gckarunarathne@gmail.com                    *
 * Last Modified Date : 10 July 2012                   *
 *******************************************************/
/**
*	Resources :
*	MORE DETAILS : https://github.com/carhartl/jquery-cookie/
* Description:
* Basic settings for menubar.html
*/
var mobileMenu = new function(){
  // set the expire days for cookies (in days)
  this.expireDaysMenu = 7;
  // set domain/path name for access cookies
  this.domainPathMenu = '/';
}

$(document).bind('pageinit',function () {

  $("#font-size").bind("change", function (event, ui) {
  //alert("yy");
    try {
      $.cookie('font-size', $("#font-size").val(), {
        expires: mobileMenu.expireDaysMenu,
        path: mobileMenu.domainPathMenu
      });
      $("html").css('font-size', $.cookie('font-size'));
      //alert(String.concat("cookie is created with ",$("#font-size").val()," and now cookie is " ,$.cookie('font-size')));
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      //alert(txt);
      $('#warningMSG').html(txt);
      $('#showDialog').click();
    }

  });

  $("#font-family").bind("change", function (event, ui) {
    try {
        $.cookie('font-family', $("#font-family").val(), {
          expires: mobileMenu.expireDaysMenu,
          path: mobileMenu.domainPathMenu
        });
        //alert(String.concat("cookie is created with ",$("#font-family").val()," and now cookie is " ,$.cookie('font-family')));
        $('div').css('font-family', $.cookie('font-family'));
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
//-->