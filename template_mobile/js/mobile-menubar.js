//<!--
/*******************************************************
 * Author : Gihan Karunarathne                         *
 * Email : gckarunarathne@gmail.com                    *
 * Last Modified Date : 10 July 2012                   *
 *******************************************************/
/**
 * Description :
 *
 */

$(function () {

  $("#select-menu-bar-position").bind("change", function (event, ui) {
    try {
      if ($.cookie('menubarposition') === null) {
        $.cookie('menubarposition', $("#select-menu-bar-position").val(), {
          expires: expireDays,
          path: domainPath
        });mo
        //alert(String.concat("cookie is created with ",$("#select-menu-bar-position").val()," and now cookie is " ,$.cookie('menubarposition')));
      } else {
        $.cookie('menubarposition', $("#select-menu-bar-position").val());
        //alert(String.concat("cookie is updated with ",$.cookie('menubarposition')));
      }
    } catch (err) {
      txt = "There was an error on this page.\n\n";
      txt += "Error description: " + err.message + "\n\n";
      txt += "Click OK to continue.\n\n";
      alert(txt);
    }

  });

});