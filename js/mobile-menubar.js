//<!--
/*******************************************************
 * Author : Gihan Karunarathne                         *
 * Email : gckarunarathne@gmail.com                    *
 * Last Modified Date : 23 March 2013                  *
 *******************************************************/
var mobileMenu=new function(){this.expireDaysMenu=7;this.domainPathMenu="/"};
$(document).bind("pageinit",function(){$("#font-size").bind("change",function(){try{mobile.setMobileValue("font-size",$("#font-size").val(),{expires:mobileMenu.expireDaysMenu,path:mobileMenu.domainPathMenu}),$("html").css("font-size",mobile.getMobileValue("font-size"))}catch(a){txt="There was an error on this page.\n\n",txt+="Error description: "+a.message+"\n\n",txt+="Click OK to continue.\n\n",$("#warningMSG").html(txt),$("#showDialog").click()}});$("#font-family").bind("change",function(){try{mobile.setMobileValue("font-family",
$("#font-family").val(),{expires:mobileMenu.expireDaysMenu,path:mobileMenu.domainPathMenu}),$("div").css("font-family",mobile.getMobileValue("font-family"))}catch(a){txt="There was an error on this page.\n\n",txt+="Error description: "+a.message+"\n\n",txt+="Click OK to continue.\n\n",$("#warningMSG").html(txt),$("#showDialog").click()}})});
//-->