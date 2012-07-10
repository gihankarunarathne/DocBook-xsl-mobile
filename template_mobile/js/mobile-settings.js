//<!--
/**********************************************************
*** Author : Gihan Karunarathne                         ***
*** Email : gckarunarathne@gmail.com                    ***
*** Last Modified Date : 10 July 2012                   ***
***********************************************************/

/*
	Description : 
	
	MORE DETAILS : https://github.com/carhartl/jquery-cookie/
*/

// set the expire days for cookies (in days)
var expireDays =7;
// set domain/path name for access cookies
var domainPath = '/';

$(function() {

	$("#select-menu-bar-position").bind( "change", function(event, ui) {
	try{
		if($.cookie('menubarposition') === null ){
			$.cookie('menubarposition', $("#select-menu-bar-position").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#select-menu-bar-position").val()," and now cookie is " ,$.cookie('menubarposition')));
		}else{
			$.cookie('menubarposition', $("#select-menu-bar-position").val()) ;
			//alert(String.concat("cookie is updated with ",$.cookie('menubarposition')));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
		
	});
	
	
	$("#select-toc-position").bind( "change", function(event, ui) {
	try{
		if($.cookie('tocposition') === null ){
			$.cookie('tocposition', $("#select-toc-position").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#select-toc-position").val()," and now cookie is " ,$.cookie('tocposition')));
		}else{
			$.cookie('tocposition', $("#select-toc-position").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('tocposition')));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
	});
	
	//page navigation
	
	$("#select-prev-page-direction").bind( "change", function(event, ui) {
	try{	
		if($.cookie('prevpage') === null ){
			$.cookie('prevpage', $("#select-prev-page-direction").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#select-prev-page-direction").val()," and now cookie is " ,$.cookie('prevpage')));
		}else{
			$.cookie('prevpage', $("#select-prev-page-direction").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('prevpage')));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
	});
	
	
	$("#select-next-page-direction").bind( "change", function(event, ui) {
	try{	
		if($.cookie('nextpage') === null ){
			$.cookie('nextpage', $("#select-next-page-direction").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#select-next-page-direction").val()," and now cookie is " ,$.cookie('nextpage')));
		}else{
			$.cookie('nextpage', $("#select-next-page-direction").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('nextpage')));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
	});
	
	
	//pop up menus
	$("#select-pop-up-menu-bar").bind( "change", function(event, ui) {
	try{	
		if($.cookie('popupmenubar') === null ){
			$.cookie('popupmenubar', $("#select-pop-up-menu-bar").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#select-pop-up-menu-bar").val()," and now cookie is " ,$.cookie('popupmenubar')));
		}else{
			$.cookie('popupmenubar', $("#select-pop-up-menu-bar").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('popupmenubar')));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
	});
	
	
	$("#select-pop-up-toc").bind( "change", function(event, ui) {
	try{	
		if($.cookie('popuptoc') === null ){
			$.cookie('popuptoc', $("#select-pop-up-toc").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#select-pop-up-toc").val()," and now cookie is " ,$.cookie('popuptoc')));
		}else{
			$.cookie('popuptoc', $("#select-pop-up-toc").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('popuptoc')));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
	});
	
	/*************************************************************************************
	**       Advance Settings                                                           **
	*************************************************************************************/
	
	$("#remember-page").bind( "change", function(event, ui) {
	//alert("lets rem page");
	try{	
		if($.cookie('rememberpage') === null ){
			$.cookie('rememberpage', $("#remember-page").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#remember-page").val()," and now cookie is " ,$.cookie('rememberpage')));
			document.getElementById("btest").innerHTML = $.cookie('rememberpage');
		}else{
			$.cookie('rememberpage', $("#remember-page").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('rememberpage')));
			//document.getElementById("btest").innerHTML = String.concat("update rem page : " , $.cookie('rememberpage'));
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
 	});
  		
  	$("#voice-search").bind( "change", function(event, ui) {
	//alert("lets do voice search");
	try{	
		if($.cookie('voicesearch') === null ){
			$.cookie('voicesearch', $("#voice-search").val(), { expires: expireDays, path: domainPath });
			//alert(String.concat("cookie is created with ",$("#voice-search").val()," and now cookie is " ,$.cookie('voicesearch')));
			document.getElementById("btest").innerHTML = $.cookie('voicesearch');
		}else{
			$.cookie('voicesearch', $("#voice-search").val() );
			//alert(String.concat("cookie is updated with ",$.cookie('voicesearch')));
			//document.getElementById("btest").innerHTML = $.cookie('voicesearch');
		}
		}catch(err){
  			txt="There was an error on this page.\n\n";
  			txt+="Error description: " + err.message + "\n\n";
  			txt+="Click OK to continue.\n\n";
  			alert(txt);
  		} 
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








