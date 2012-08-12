<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" xmlns:exsl="http://exslt.org/common"
  xmlns:set="http://exslt.org/sets" xmlns:ng="http://docbook.org/docbook-ng"
  xmlns:db="http://docbook.org/ns/docbook" version="1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="exsl ng db doc set">

  <xsl:import href="../../xhtml/chunk.xsl"/>

  <xsl:param name="chunker.output.method">
    <xsl:choose>
      <xsl:when test="contains(system-property('xsl:vendor'), 'SAXON 6')">saxon:xhtml</xsl:when>
      <xsl:otherwise>html</xsl:otherwise>
    </xsl:choose>
  </xsl:param>

  <xsl:param name="doc.title">
    <xsl:call-template name="get.doc.title"/>
  </xsl:param>

  <!-- =========================================================== -->
  <!-- =	some configurations for mobile xsl sheets	             = -->
  <!-- =========================================================== -->
  <xsl:param name="mobile.start.filename">index.html</xsl:param>
  <xsl:param name="mobile.toc.filename">toc.html</xsl:param>
  <xsl:param name="mobile.setting.filename">settings.html</xsl:param>
  <xsl:param name="mobile.menubar.filename">menubar.html</xsl:param>
  <xsl:param name="mobile.base.dir">www</xsl:param>
  <xsl:param name="mobile.indexer.language">en</xsl:param>
  <xsl:param name="mobile.default.topic"/>
  <xsl:param name="mobile.autolabel">0</xsl:param>
  <xsl:param name="mobile.device.platform">none</xsl:param>

  <!-- ============================================================ -->
  <!-- =	default configuration for build mobile out put	        = -->
  <!-- ============================================================ -->
  <xsl:param name="chunker.output.indent">no</xsl:param>
  <xsl:param name="navig.showtitles">0</xsl:param>
  <xsl:param name="manifest.in.base.dir" select="0"/>
  <xsl:param name="base.dir" select="concat($mobile.base.dir,'/content/')"/>
  <xsl:param name="suppress.navigation">0</xsl:param>
  <xsl:param name="generate.index" select="1"/>
  <xsl:param name="inherit.keywords" select="'0'"/>
  <xsl:param name="local.l10n.xml" select="document('')"/>
  <xsl:param name="para.propagates.style" select="1"/>
  <xsl:param name="phrase.propagates.style" select="1"/>
  <xsl:param name="chunk.first.sections" select="1"/>
  <xsl:param name="chunk.section.depth" select="5"/>
  <xsl:param name="branding">not set</xsl:param>
  <xsl:param name="brandname"> </xsl:param>
  
  <xsl:param name="chapter.autolabel" select="0"/>
  <xsl:param name="section.autolabel" select="0"/>

  <i18n xmlns="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="en">
      <l:gentext key="Search" text="Search"/>
      <l:gentext key="Enter_a_term_and_click" text="Enter a term and click "/>
      <l:gentext key="Go" text="Go"/>
      <l:gentext key="to_perform_a_search" text=" to perform a search."/>
      <l:gentext key="txt_filesfound" text="Results"/>
      <l:gentext key="txt_enter_at_least_1_char" text="You must enter at least one character."/>
      <l:gentext key="txt_browser_not_supported"
        text="Your browser is not supported. Use of Mozilla Firefox is recommended."/>
      <l:gentext key="txt_please_wait" text="Please wait. Search in progress..."/>
      <l:gentext key="txt_results_for" text="Results for: "/>
      <l:gentext key="TableofContents" text="Contents"/>
      <l:gentext key="HighlightButton" text="Toggle search result highlighting"/>
    </l10n>
    <!-- The fallback mechansim doesn't seem to work for local l10n stuff -->
    <l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="ja">
      <l:gentext key="Search" text="Search"/>
      <l:gentext key="Enter_a_term_and_click" text="Enter a term and click "/>
      <l:gentext key="Go" text="Go"/>
      <l:gentext key="to_perform_a_search" text=" to perform a search."/>
      <l:gentext key="txt_filesfound" text="Results"/>
      <l:gentext key="txt_enter_at_least_1_char" text="You must enter at least one character."/>
      <l:gentext key="txt_browser_not_supported"
        text="Your browser is not supported. Use of Mozilla Firefox is recommended."/>
      <l:gentext key="txt_please_wait" text="Please wait. Search in progress..."/>
      <l:gentext key="txt_results_for" text="Results for: "/>
      <l:gentext key="HighlightButton" text="Toggle search result highlighting"/>
    </l10n>
    <l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="de">
      <l:gentext key="Search" text="Search"/>
      <l:gentext key="Enter_a_term_and_click" text="Enter a term and click "/>
      <l:gentext key="Go" text="Go"/>
      <l:gentext key="to_perform_a_search" text=" to perform a search."/>
      <l:gentext key="txt_filesfound" text="Results"/>
      <l:gentext key="txt_enter_at_least_1_char" text="You must enter at least one character."/>
      <l:gentext key="txt_browser_not_supported"
        text="Your browser is not supported. Use of Mozilla Firefox is recommended."/>
      <l:gentext key="txt_please_wait" text="Please wait. Search in progress..."/>
      <l:gentext key="txt_results_for" text="Results for: "/>
      <l:gentext key="HighlightButton" text="Toggle search result highlighting"/>
    </l10n>
    <l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="fr">
      <l:gentext key="Search" text="Search"/>
      <l:gentext key="Enter_a_term_and_click" text="Enter a term and click "/>
      <l:gentext key="Go" text="Go"/>
      <l:gentext key="to_perform_a_search" text=" to perform a search."/>
      <l:gentext key="txt_filesfound" text="Results"/>
      <l:gentext key="txt_enter_at_least_1_char" text="You must enter at least one character."/>
      <l:gentext key="txt_browser_not_supported"
        text="Your browser is not supported. Use of Mozilla Firefox is recommended."/>
      <l:gentext key="txt_please_wait" text="Please wait. Search in progress..."/>
      <l:gentext key="txt_results_for" text="Results for: "/>
      <l:gentext key="HighlightButton" text="Toggle search result highlighting"/>
    </l10n>
    <l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="zh">
      <l:gentext key="Search" text="Search"/>
      <l:gentext key="Enter_a_term_and_click" text="Enter a term and click "/>
      <l:gentext key="Go" text="Go"/>
      <l:gentext key="to_perform_a_search" text=" to perform a search."/>
      <l:gentext key="txt_filesfound" text="Results"/>
      <l:gentext key="txt_enter_at_least_1_char" text="You must enter at least one character."/>
      <l:gentext key="txt_browser_not_supported"
        text="Your browser is not supported. Use of Mozilla Firefox is recommended."/>
      <l:gentext key="txt_please_wait" text="Please wait. Search in progress..."/>
      <l:gentext key="txt_results_for" text="Results for: "/>
      <l:gentext key="HighlightButton" text="Toggle search result highlighting"/>
    </l10n>

  </i18n>

  <!-- ============================================================ -->
  <!-- = system.head.content					    							          = -->
  <!-- ============================================================ -->
  <xsl:template name="system.head.content">
    <xsl:param name="node" select="."/>
    <xsl:text>
	</xsl:text>

    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <xsl:text>
	</xsl:text>
  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	"user.head.content" called from "chunk-element-content  = -->
  <!-- ============================================================ -->
  <xsl:template name="user.head.content">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" type="text/css" href="../css/themes/default/jquery.mobile-1.1.0.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/mobile.positioning.css"/>

    <xsl:choose>
      <xsl:when test="'android'=$mobile.device.platform">
        <script type="text/javascript" charset="utf-8" src="../js/cordova-1.8.1.js">
          <xsl:comment>
          </xsl:comment>
          </script>
      </xsl:when>
    </xsl:choose>
    
    <script type="text/javascript">
              //The id for tree cookie
              var treeCookieId = "treeview-1055";
              var language = "en";
              var w = new Object();
              //Localization
              txt_filesfound = 'Results';
              txt_enter_at_least_1_char = "You must enter at least one character.";
              txt_browser_not_supported = "JavaScript is disabled on your browser. Please enable JavaScript to enjoy all the features of this site.";
              txt_please_wait = "Please wait. Search in progress...";
              txt_results_for = "Results for: ";
            </script>
    
    <script type="text/javascript" src="../js/browserDetect.js">
      <xsl:comment>//jQuery</xsl:comment>
    </script>
    <script type="text/javascript" src="../js/jquery.min.js">
      <xsl:comment>//jQuery</xsl:comment>
    </script>
    <script type="text/javascript" src="../js/jquery.cookie.min.js">
      <xsl:comment>include mobile menubar js</xsl:comment>
    </script>
    <script type="text/javascript" src="../js/mobile-menubar.js">
      <xsl:comment>mobile-menubar</xsl:comment>
    </script>
    <script type="text/javascript" src="../js/mobile-settings.js">
      <xsl:comment>include mobile settings js</xsl:comment>
    </script>
    <!-- JS for Indexer Search -->
    <script type="text/javascript" src="search/l10n.js">
              <xsl:comment>l10n</xsl:comment>
            </script>
    <script type="text/javascript" src="search/htmlFileInfoList.js">
              <xsl:comment>htmlFileInfoList</xsl:comment>
            </script>
    <script type="text/javascript" src="search/nwSearchFnt.js">
              <xsl:comment>nwSearchFnt</xsl:comment>
            </script>
    <script type="text/javascript" src="{concat('search/stemmers/',$mobile.indexer.language,'_stemmer.js')}">
              <xsl:comment>make scalable to other languages as well.</xsl:comment>
            </script>
    <!--Index Files: Index is broken in to three equal sized(number of index
                items) files. This is to help parallel downloading of files to make it faster. -->
    <script type="text/javascript" src="search/index-1.js">
              <xsl:comment>index-1</xsl:comment>
            </script>
    <script type="text/javascript" src="search/index-2.js">
              <xsl:comment>index-2</xsl:comment>
            </script>
    <script type="text/javascript" src="search/index-3.js">
              <xsl:comment>index-3</xsl:comment>
            </script>
    <!-- End of index js -->
    <!-- pop up the settings panel when click on menu button of the phone/device -->
    <script type="text/javascript" charset="utf-8">
        document.addEventListener("deviceready", onDeviceReady, false);

        function onDeviceReady() {
          document.addEventListener("menubutton", onMenuKeyDown, false);
        }

        function onMenuKeyDown() {
          $.mobile.changePage("<xsl:value-of select="$mobile.setting.filename"/>");
        }
		</script>
    <script type="text/javascript" src="../js/jquery.mobile-1.1.0.min.js">
      <xsl:comment>
      </xsl:comment>
    </script>
    <script type="text/javascript" src="../js/swipeupdown.js">
      <xsl:comment>
      </xsl:comment>
    </script>
  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	user.header.navigation								                  = -->
  <!-- ============================================================ -->
  <xsl:template name="user.header.navigation">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="nav.context"/>
    <xsl:call-template name="mobileheader">
      <xsl:with-param name="prev" select="$prev"/>
      <xsl:with-param name="next" select="$next"/>
      <xsl:with-param name="nav.context" select="$nav.context"/>
    </xsl:call-template>
    <!--xsl:call-template name="mobiletoc"/-->
    
  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	user.header.content								                      = -->
  <!-- ============================================================ -->
  <xsl:template name="user.header.content">
    <xsl:comment>KEEP THIS CODE</xsl:comment>
  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	user.footer.navigation						                      = -->
  <!-- ============================================================ -->
  <xsl:template name="user.footer.navigation">
    <!--<xsl:call-template name="mobiletoc">
      <xsl:with-param name="currentid" select="generate-id(.)"/>
    </xsl:call-template>-->
  </xsl:template>

  <xsl:template match="/">
    <xsl:message>language: <xsl:value-of select="$mobile.indexer.language"/>
    </xsl:message>
    <!-- * Get a title for current doc so that we let the user -->
    <!-- * know what document we are processing at this point. -->
    <xsl:variable name="doc.title">
      <xsl:call-template name="get.doc.title"/>
    </xsl:variable>
    <xsl:choose>
      <!-- Hack! If someone hands us a DocBook V5.x or DocBook NG document,
	  toss the namespace and continue.  Use the docbook5 namespaced
	  stylesheets for DocBook5 if you don't want to use this feature.-->
      <!-- include extra test for Xalan quirk -->
      <xsl:when
        test="$exsl.node.set.available != 0                     and (*/self::ng:* or */self::db:*)">
        <xsl:call-template name="log.message">
          <xsl:with-param name="level">Note</xsl:with-param>
          <xsl:with-param name="source" select="$doc.title"/>
          <xsl:with-param name="context-desc">
            <xsl:text>namesp. cut</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="message">
            <xsl:text>stripped namespace before processing</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:variable name="nons">
          <xsl:apply-templates mode="stripNS"/>
        </xsl:variable>

        <xsl:call-template name="log.message">
          <xsl:with-param name="level">Note</xsl:with-param>
          <xsl:with-param name="source" select="$doc.title"/>
          <xsl:with-param name="context-desc">
            <xsl:text>namesp. cut</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="message">
            <xsl:text>processing stripped document</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates select="exsl:node-set($nons)"/>
      </xsl:when>
      <!-- Can't process unless namespace removed -->
      <xsl:when test="*/self::ng:* or */self::db:*">
        <xsl:message terminate="yes">
          <xsl:text>Unable to strip the namespace from DB5 document,</xsl:text>
          <xsl:text> cannot proceed.</xsl:text>
        </xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$rootid != ''">
            <xsl:choose>
              <xsl:when test="count(key('id',$rootid)) = 0">
                <xsl:message terminate="yes">
                  <xsl:text>ID '</xsl:text>
                  <xsl:value-of select="$rootid"/>
                  <xsl:text>' not found in document.</xsl:text>
                </xsl:message>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if
                  test="$collect.xref.targets = 'yes' or                             $collect.xref.targets = 'only'">
                  <xsl:apply-templates select="key('id', $rootid)" mode="collect.targets"/>
                </xsl:if>
                <xsl:if test="$collect.xref.targets != 'only'">
                  <xsl:apply-templates select="key('id',$rootid)" mode="process.root"/>
                  <xsl:if test="$tex.math.in.alt != ''">
                    <xsl:apply-templates select="key('id',$rootid)" mode="collect.tex.math"/>
                  </xsl:if>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if
              test="$collect.xref.targets = 'yes' or                         $collect.xref.targets = 'only'">
              <xsl:apply-templates select="/" mode="collect.targets"/>
            </xsl:if>
            <xsl:if test="$collect.xref.targets != 'only'">
              <xsl:apply-templates select="/" mode="process.root"/>
              <xsl:if test="$tex.math.in.alt != ''">
                <xsl:apply-templates select="/" mode="collect.tex.math"/>
              </xsl:if>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="toc.html"/>
    
    <!--<xsl:call-template name="index.html"/>-->

    <xsl:call-template name="settings.html"/>

    <xsl:call-template name="menubar.html"/>
    
    <xsl:call-template name="l10n.js"></xsl:call-template>

  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	chunk-element-content								                    = -->
  <!-- ============================================================ -->
  <xsl:template name="chunk-element-content">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="nav.context"/>
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>

    <xsl:call-template name="user.preroot"/>

    <html>
      <xsl:call-template name="html.head">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
      </xsl:call-template>

      <body>
        <!--Page should have identical id to identify itselt. It is logical to use html file name as id -->
        <xsl:variable name="currentPage">
          <xsl:call-template name="href.target">
            <xsl:with-param name="context" select="."/>
          </xsl:call-template>
        </xsl:variable>
        <!-- cuncact the file name with "#" symbol to identify in DOM -->
        <xsl:variable name="id_current" select="translate(concat('id_',$currentPage),'.','_')"/>
        
        <div data-role="page" >
          <xsl:attribute name="id">
            <xsl:value-of select="$id_current"/>
          </xsl:attribute>
          
          <xsl:call-template name="user.header.content"/>
          
          <div data-role="header" data-theme="b">
            <xsl:call-template name="body.attributes"/>

            <xsl:call-template name="user.header.navigation">
              <xsl:with-param name="prev" select="$prev"/>
              <xsl:with-param name="next" select="$next"/>
              <xsl:with-param name="nav.context" select="$nav.context"/>
            </xsl:call-template>
          </div>
          <div data-role="content" id="bodyone">
            <div id="content">

              <xsl:copy-of select="$content"/>

              <xsl:call-template name="user.footer.content"/>

              <xsl:call-template name="footer.navigation">
                <xsl:with-param name="prev" select="$prev"/>
                <xsl:with-param name="next" select="$next"/>
                <xsl:with-param name="nav.context" select="$nav.context"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
      </body>
    </html>
    <xsl:value-of select="$chunk.append"/>
  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	Mobile Header					                                  = -->
  <!-- ============================================================ -->
  <xsl:template name="mobileheader">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="nav.context"/>

    <xsl:variable name="home" select="/*[1]"/>
    <xsl:variable name="up" select="parent::*"/>

    <!-- Display the page title and the main heading(parent) of it-->
    <h4>
      <xsl:choose>
        <xsl:when test="count($up) &gt; 0 and generate-id($up) != generate-id($home)">
          <xsl:apply-templates select="$up" mode="object.title.markup"/>
          <br/>
        </xsl:when>
        <xsl:otherwise>&#160;</xsl:otherwise>
      </xsl:choose>
      
      <xsl:apply-templates select="." mode="object.title.markup"/>
    </h4>

    <!-- Prev links generation-->

    <xsl:comment>
    <!-- KEEP this code. In case of neither prev nor next links are available, this will help to
      keep the integrity of the DOM tree-->
    </xsl:comment>

    <!--<td>
      <img src="../common/images/highlight-blue.gif" alt="H" height="25px"
        onclick="toggleHighlight()" id="showHideHighlight" style="cursor:pointer">
        <xsl:attribute name="title">
          <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'HighlightButton'"/>
          </xsl:call-template>
        </xsl:attribute>
      </img>
    </td>-->
    <xsl:if
      test="count($prev) &gt; 0
      or (count($up) &gt; 0
      and generate-id($up) != generate-id($home)
      and $navig.showtitles != 0)
      or count($next) &gt; 0">

      <!-- "Previous" navigator genarate -->
      <xsl:if test="count($prev)>0">
        <a accesskey="p" data-role="button" data-icon="arrow-l" data-iconpos="notext" data-theme="a">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$prev"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:call-template name="navig.content">
            <xsl:with-param name="direction" select="'prev'"/>
          </xsl:call-template>
        </a>
      </xsl:if>

      <!-- "Up" link-->
      <xsl:choose>
        <xsl:when test="count($up)&gt;0
            and generate-id($up) != generate-id($home)">
          <!--<div accesskey="u" data-role="button" data-icon="arrow-u" data-iconpos="notext"
            data-theme="a"/>-->
          <!--<div>
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="object" select="$up"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:call-template name="navig.content">
              <xsl:with-param name="direction" select="'up'"/>
            </xsl:call-template>
          </div>-->
          &#160; </xsl:when>
        <xsl:otherwise>&#160;</xsl:otherwise>
      </xsl:choose>
      <!-- "Next" navigator genarate -->
      <xsl:if test="count($next)>0">

        <a accesskey="n" data-role="button" data-icon="arrow-r" data-iconpos="notext" data-theme="a">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$next"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:call-template name="navig.content">
            <xsl:with-param name="direction" select="'next'"/>
          </xsl:call-template>
        </a>
      </xsl:if>
      <!-- add swipe scripts to navigate -->
      <xsl:variable name="nav_prev">
        <xsl:call-template name="href.target">
          <xsl:with-param name="object" select="$prev"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="nav_next">
        <xsl:call-template name="href.target">
          <xsl:with-param name="object" select="$next"/>
        </xsl:call-template>
      </xsl:variable>
      <!--Page should have identical id to identify itselt. It is logical to use html file name as id -->
      <xsl:variable name="nav_current">
        <xsl:call-template name="href.target.uri">
          <xsl:with-param name="object" select="."/>
        </xsl:call-template>
      </xsl:variable>
      <!-- cuncact the file name with "#" symbol to identify in DOM -->
      <xsl:variable name="id_current" select="translate(concat('#id_',$nav_current),'.','_')"/>

      <!-- actions for the events happening on the phone/device -->
      <script type="text/javascript">
        /*$(function() {
          $("<xsl:value-of select="$id_current"/>").live('swipedown', function(event) {
            $.mobile.changePage("<xsl:value-of select="$mobile.toc.filename"/>");
          });
        });
				
        $(function() {
          $("<xsl:value-of select="$id_current"/>").live('swipeup', function(event) {
            $.mobile.changePage("<xsl:value-of select="$mobile.menubar.filename"/>");
          });
        });*/
					
        $(function() {
          $("<xsl:value-of select="$id_current"/>").live('swipeleft', function(event) {
            $.mobile.changePage("<xsl:value-of select="$nav_prev"/>");
          });
				 		
          $("<xsl:value-of select="$id_current"/>").live('swiperight', function(event) {
            $.mobile.changePage("<xsl:value-of select="$nav_next"/>");
          });
        });
			</script>
    </xsl:if>

  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	Mobile ToC								                              = -->
  <!-- ============================================================ -->
  <xsl:template name="mobiletoc">
    <xsl:param name="currentid"/>
    <xsl:choose>
      <xsl:when test="$rootid != ''">
        <xsl:variable name="title">
          <xsl:if test="$mobile.autolabel=1">
            <xsl:variable name="label.markup">
              <xsl:apply-templates select="key('id',$rootid)" mode="label.markup"/>
            </xsl:variable>
            <xsl:if test="normalize-space($label.markup)">
              <xsl:value-of select="concat($label.markup,$autotoc.label.separator)"/>
            </xsl:if>
          </xsl:if>
          <xsl:apply-templates select="key('id',$rootid)" mode="title.markup"/>
        </xsl:variable>
        <xsl:variable name="href">
          <xsl:choose>
            <xsl:when test="$manifest.in.base.dir != 0">
              <xsl:call-template name="href.target">
                <xsl:with-param name="object" select="key('id',$rootid)"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="href.target.with.base.dir">
                <xsl:with-param name="object" select="key('id',$rootid)"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
      </xsl:when>

      <xsl:otherwise>
        <xsl:variable name="title">
          <xsl:if test="$mobile.autolabel=1">
            <xsl:variable name="label.markup">
              <xsl:apply-templates select="/*" mode="label.markup"/>
            </xsl:variable>
            <xsl:if test="normalize-space($label.markup)">
              <xsl:value-of select="concat($label.markup,$autotoc.label.separator)"/>
            </xsl:if>
          </xsl:if>
          <xsl:apply-templates select="/*" mode="title.markup"/>
        </xsl:variable>
        <xsl:variable name="href">
          <xsl:choose>
            <xsl:when test="$manifest.in.base.dir != 0">
              <xsl:call-template name="href.target">
                <xsl:with-param name="object" select="/"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="href.target.with.base.dir">
                <xsl:with-param name="object" select="/"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <div id="tabs">
          <h3>
            <a href="#treeDiv">
              <em>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key" select="'TableofContents'"/>
                </xsl:call-template>
              </em>
            </a>
          </h3>
          <div id="treeDiv">
            <!--<img src="../common/images/loading.gif" alt="loading table of contents..."
							id="tocLoading" style="display:block;"/>-->

            <div id="tree" class="filetree">
              <xsl:apply-templates select="/*/*" mode="mobiletoc">
                <xsl:with-param name="currentid" select="$currentid"/>
              </xsl:apply-templates>
            </div>
          </div>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ============================================================ -->
  <!-- = Build toc recursively				                            = -->
  <!-- ============================================================ -->
  <xsl:template
    match="book|part|reference|preface|chapter|bibliography|appendix|article|glossary|section|simplesect|sect1|sect2|sect3|sect4|sect5|refentry|colophon|bibliodiv|index"
    mode="mobiletoc">
    <xsl:param name="currentid"/>
    <xsl:variable name="title">
      <xsl:if test="$mobile.autolabel=1">
        <xsl:variable name="label.markup">
          <xsl:apply-templates select="." mode="label.markup"/>
        </xsl:variable>
        <xsl:if test="normalize-space($label.markup)">
          <xsl:value-of select="concat($label.markup,$autotoc.label.separator)"/>
        </xsl:if>
      </xsl:if>
      <xsl:apply-templates select="." mode="title.markup"/>
    </xsl:variable>

    <xsl:variable name="href">
      <xsl:choose>
        <xsl:when test="$manifest.in.base.dir != 0">
          <xsl:call-template name="href.target"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="href.target.with.base.dir"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="id" select="generate-id(.)"/>
    <!--xsl:message>
            <xsl: select="name(ancestor-or-self::*) "/>
        </xsl:message-->

    <xsl:if test="not(self::index) or (self::index and not($generate.index = 0))">
      <!--li style="white-space: pre; line-height: 0em;"-->
      <div data-role="collapsible" data-content-theme="c">
        <xsl:if test="$id = $currentid">
          <xsl:attribute name="id">mobile-currentid</xsl:attribute>
        </xsl:if>
        <h5>
          <a href="{substring-after($href,concat($mobile.base.dir,'/content/'))}">
            <xsl:value-of select="$title"/>
          </a>
        </h5>
        <xsl:if
          test="part|reference|preface|chapter|bibliography|appendix|article|glossary|section|simplesect|sect1|sect2|sect3|sect4|sect5|refentry|colophon|bibliodiv">
          <div data-content-theme="b">
            <xsl:apply-templates
              select="part|reference|preface|chapter|bibliography|appendix|article|glossary|section|simplesect|sect1|sect2|sect3|sect4|sect5|refentry|colophon|bibliodiv"
              mode="mobiletoc">
              <xsl:with-param name="currentid" select="$currentid"/>
            </xsl:apply-templates>
          </div>
        </xsl:if>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()" mode="mobiletoc"/>

  <!-- ============================================================ -->
  <!-- =	user.footer.content						                          = -->
  <!-- ============================================================ -->
  <xsl:template name="user.footer.content">
    <!--        <script type="text/javascript" src="../common/main.js">-->
    <xsl:comment/>
    <!--        </script>-->
  </xsl:template>

  <!-- ============================================================ -->
  <!-- =	index html                                              = -->
  <!-- ============================================================ -->
  <xsl:template name="index.html">
    <xsl:variable name="default.topic">
      <xsl:choose>
        <xsl:when test="$mobile.default.topic != ''">
          <xsl:value-of select="$htmlhelp.default.topic"/>
        </xsl:when>
        <xsl:when test="$htmlhelp.default.topic != ''">
          <xsl:value-of select="$htmlhelp.default.topic"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="make-relative-filename">
            <xsl:with-param name="base.dir"/>
            <xsl:with-param name="base.name">
              <xsl:choose>
                <xsl:when test="$rootid != ''">
                  <xsl:apply-templates select="key('id',$rootid)" mode="chunk-filename"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates
                    select="*/*[self::preface|self::chapter|self::appendix|self::part][1]"
                    mode="chunk-filename"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename">
        <!--       <xsl:if test="$manifest.in.base.dir != 0"> -->
        <!--         <xsl:value-of select="$base.dir"/> -->
        <!--       </xsl:if> -->
        <xsl:choose>
          <xsl:when test="$mobile.start.filename">
            <xsl:value-of select="concat($mobile.base.dir,'/',$mobile.start.filename)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'index.html'"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="method" select="'xml'"/>
      <xsl:with-param name="encoding" select="'utf-8'"/>
      <xsl:with-param name="indent" select="'yes'"/>
      <xsl:with-param name="content">
        <html>
          <head>
            <link rel="shortcut icon" href="favicon.ico"/>
            <meta http-equiv="Refresh" content="1; URL=content/{$default.topic}"/>
            <title><xsl:value-of select="//title[1]"/>&#160; </title>
          </head>
          <body> If not automatically redirected, click here: <a href="content/ch01.html"
              >content/ch01.html</a>
          </body>
        </html>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- ============================================================= -->
  <!-- =	Settings html                                            = -->
  <!-- ============================================================= -->
  <xsl:template name="settings.html">

    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename">
        <!--<xsl:choose>
          <xsl:when test="$mobile.start.filename">
            <xsl:value-of select="concat($mobile.base.dir,'/',$mobile.start.filename)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'index.html'"/>
          </xsl:otherwise>
        </xsl:choose>-->

        <xsl:value-of select="concat($mobile.base.dir,'/content/',$mobile.setting.filename)"/>
      </xsl:with-param>
      <xsl:with-param name="method" select="'xml'"/>
      <xsl:with-param name="encoding" select="'utf-8'"/>
      <xsl:with-param name="indent" select="'yes'"/>
      <xsl:with-param name="content">

        <html>
          <head>
            <title>Settings</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <!-- add resources to Android device -->
            <xsl:choose>
              <xsl:when test="'android'=$mobile.device.platform">
                <script type="text/javascript" charset="utf-8" src="../js/cordova-1.8.1.js">
                  <xsl:comment>
                  </xsl:comment>
                </script>
              </xsl:when>
            </xsl:choose>

            <link rel="stylesheet" type="text/css"
              href="../css/themes/default/jquery.mobile-1.1.0.min.css"/>
            <style type="text/css">
              .containing-element .ui-slider-switch { width: 100% }
            </style>
            <script type="text/javascript" src="../js/jquery.min.js">// jquery </script>
            <script type="text/javascript" src="../js/jquery.cookie.min.js">// cookies </script>
            <!--<script type="text/javascript" src="../js/mobile-menubar.js">
              <xsl:comment>mobile menubar</xsl:comment>
            </script>-->
            <script type="text/javascript" src="../js/mobile-settings.js">
                <xsl:comment>mobile settings</xsl:comment>
              </script>
            <script type="text/javascript" src="../js/jquery.mobile-1.1.0.min.js">// jquery mobile </script>
            <script type="text/javascript" src="../js/swipeupdown.js">//swipe</script>
          </head>
          <body>

            <!-- Set id for settings.html as its name -->
            <xsl:variable name="id_settings"
              select="translate(concat('id_',$mobile.setting.filename),'.','_')"/>
            <div data-role="page">
              <xsl:attribute name="id">
                <xsl:value-of select="$id_settings"/>
              </xsl:attribute>
              
              <script type="text/javascript" src="../js/mobile-menubar.js">
               <xsl:comment>mobile menubar</xsl:comment>
              </script>

              <div data-role="header">
                <h1>Settings</h1>
                <script type="text/javascript">
                  $(function(){
                    $("#viewtoc").live('tap',function(event ,ui){
                      $.mobile.changePage("<xsl:value-of select="$mobile.toc.filename"/>");
                    });
                    
                    $("#viewmenubar").live('tap', function(){
                      $.mobile.changePage("<xsl:value-of select="$mobile.menubar.filename"/>");
                    });
                    //hide the link for open Warning Dialog Box
                    $("#showDialog").hide();
                  });
                </script>
              </div>

              <div data-role="content">

                <form>
                  <ul data-role="listview" data-inset="true" data-theme="b">
                    <li data-role="list-divider">Edit</li>
                    <!-- ======================================= -->
                    <!-- =  Go to ToC / Menubar                = -->
                    <!-- ======================================= -->
                    <li>
                      <a id="viewtoc">ToC</a>
                    </li>
                    <li>
                      <a id="viewmenubar"> Menu Bar</a>
                    </li>

                    <!--<li>
                      <label for="view-bars" class="select" data-mini="true">
                        <strong>
                          <em>View</em>
                        </strong>
                      </label>
                      <select name="select-view-bars" id="view-bars" data-theme="e"
                        data-icon="arrow-d" data-native-menu="false">
                        <option value="viewToC">View ToC</option>
                        <option value="viewMenuBar">View Menu Bar</option>
                      </select>
                    </li>-->

                    <!-- ======================================= -->
                    <!-- =  Positioning ToC / Menubar          = -->
                    <!-- ======================================= -->
                    <li>
                      <label for="select-menu-bar-position" class="select" data-mini="true">
                        <strong>
                          <em> Menu Bar Tap Position </em>
                        </strong>
                      </label>
                      <select name="select-menu-bar-position" id="select-menu-bar-position"
                        data-theme="e" data-icon="arrow-d" data-native-menu="false">
                        <option value="tapUpper">Tap Upper Screen</option>
                        <option value="tapLower">Tap Lower Screen</option>
                      </select>
                    </li>

                    <li>
                      <label for="select-toc-position" class="select" data-mini="true">
                        <strong>
                          <em>ToC Tap Position </em>
                        </strong>
                      </label>
                      <select name="select-toc-position" id="select-toc-position" data-theme="e"
                        data-icon="arrow-d" data-native-menu="false">
                        <option value="tapUpper">Tap Upper Screen</option>
                        <option value="tapLower">Tap Lower Screen</option>
                      </select>
                    </li>

                    <!-- ======================================= -->
                    <!-- =  Set popup or not ToC / Menubar     = -->
                    <!-- ======================================= -->
                    <li>
                      <label for="select-pop-up-menu-bar" class="select" data-mini="true">
                        <strong>
                          <em>Pop Up Menu Bar</em>
                        </strong>
                      </label>
                      <select name="select-pop-up-menu-bar" id="select-pop-up-menu-bar"
                        data-theme="e" data-icon="arrow-d" data-native-menu="false">
                        <option value="showMenuBar">Show Menu Bar</option>
                        <option value="hideMenuBar">Hide Menu Bar</option>

                      </select>
                    </li>

                    <li>
                      <label for="select-pop-up-toc" class="select" data-mini="true">
                        <strong>
                          <em>Pop Up ToC </em>
                        </strong>
                      </label>
                      <select name="select-pop-up-toc" id="select-pop-up-toc" data-theme="e"
                        data-icon="arrow-d" data-native-menu="false">
                        <option value="showtoc">Show ToC</option>
                        <option value="hidetoc">Hide ToC</option>
                      </select>
                    </li>

                    <!-- ======================================= -->
                    <!-- =  Page Navigation directions         = -->
                    <!-- ======================================= -->
                    <li data-theme="a">
                      <label for="select-prev-page-direction" class="select" data-mini="true">
                        <strong>
                          <em>Prev Page Direction </em>
                        </strong>
                      </label>
                      <select name="select-prev-page-direction" id="select-prev-page-direction"
                        data-theme="e" data-icon="arrow-d" data-native-menu="false">
                        <option value="swipeLeft">Swipe Left</option>
                        <option value="swipeRight">Swipe Right</option>
                      </select>
                    </li>

                    <li data-theme="a">
                      <label for="select-next-page-direction" class="select" data-mini="true">
                        <strong>
                          <em>Next Page Direction </em>
                        </strong>
                      </label>
                      <select name="select-next-page-direction" id="select-next-page-direction"
                        data-theme="e" data-icon="arrow-d" data-native-menu="false">
                        <option value="swipeLeft">Swipe Left</option>
                        <option value="swipeRight">Swipe Right</option>
                      </select>
                    </li>

                  </ul>
                </form>

                <!-- ============================================ -->
                <!-- = Advance Settings                         = -->
                <!-- ============================================ -->
                <form>
                  <ul data-role="listview" data-inset="true" data-theme="b">
                    <li data-role="list-divider">Advance Settings</li>
                    <!-- SETTING FOR FLIP SWITCH <li>
                      <div class="ui-grid-a">
                        <div class="ui-block-a">
                          <label for="remember-page" data-mini="true">Remember Page</label>
                        </div>
                        <div class="ui-block-b">
                          <div class="ui-block-a"/>
                          <div class="ui-block-b">
                            <select name="remember-page" id="remember-page" data-role="slider"
                              data-mini="true" data-pos="right">
                              <option value="off">Off</option>
                              <option value="on">On</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </li>-->

                    <li>
                      <label for="remember-page" data-mini="true" class="select">
                        <strong>
                          <em>Remember Page</em>
                        </strong>
                      </label>
                      <select name="remember-page" id="remember-page" data-icon="arrow-d"
                        data-native-menu="false">
                        <option value="off">Off</option>
                        <option value="on">On</option>
                      </select>
                    </li>
                    <li>
                      <label for="voice-search" data-mini="true" class="select">
                        <strong>
                          <em>Voice Search </em>
                        </strong>
                      </label>
                      <select name="voice-search" id="voice-search" data-icon="arrow-d"
                        data-native-menu="false">
                        <option value="off">Off</option>
                        <option value="on">On</option>
                      </select>
                    </li>
                    <!-- ======================================= -->
                    <!-- =  Reset Settings                     = -->
                    <!-- ======================================= -->
                    <li data-theme="a">
                      <label for="reset-settings" class="select" data-mini="true">
                        <strong>
                          <em>Reset Settings </em>
                        </strong>
                      </label>
                      <select name="reset-settings" id="reset-settings"
                        data-theme="e" data-icon="arrow-d" data-native-menu="false" data-mini="true">
                        <option value="reset">Reset </option>
                        <option value="cancel">Cancel </option>
                      </select>
                    </li>

                  </ul>
                </form>
                <a href="menubar.html#settings_alert" id="showDialog" data-role="button" data-inline="true" data-rel="dialog" data-transition="pop">
                  <xsl:comment>link:Dialog Box for show Warnings</xsl:comment>
                </a>
              </div>
            </div>
            <!-- Warning Dialog Box -->
            <div data-role="page" id="settings_alert" data-url="settings_alert" data-overlay-theme="e">
              <div data-role="header" data-theme="b">
                <h1>Warning Alert</h1>
              </div>
              <div data-role="content" data-theme="a">
                <p style="color:orange;text-align:center;" id="warningMSG">Warning Message</p>
                <a href="meubar.html" data-role="button" data-rel="back" data-theme="b" data-inline="true">OK</a>
              </div>
            </div>
          </body>
        </html>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- ============================================================ -->
  <!-- = Menu Bar html                                            = -->
  <!-- ============================================================ -->
  <xsl:template name="menubar.html">
    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename">
        <!--<xsl:choose>
          <xsl:when test="$mobile.start.filename">
            <xsl:value-of select="concat($mobile.base.dir,'/',$mobile.start.filename)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'index.html'"/>
          </xsl:otherwise>
        </xsl:choose>-->

        <xsl:value-of select="concat($mobile.base.dir,'/content/',$mobile.menubar.filename)"/>
      </xsl:with-param>
      <xsl:with-param name="method" select="'xml'"/>
      <xsl:with-param name="encoding" select="'utf-8'"/>
      <xsl:with-param name="indent" select="'yes'"/>
      <xsl:with-param name="content">
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <xsl:choose>
              <xsl:when test="'android'=$mobile.device.platform">
                <script type="text/javascript" charset="utf-8" src="../js/cordova-1.8.1.js">
                  <xsl:comment>
                  </xsl:comment>
                </script>
              </xsl:when>
            </xsl:choose>
            <script type="text/javascript">
              //The id for tree cookie
              var treeCookieId = "treeview-1055";
              var language = "en";
              var w = new Object();
              //Localization
              txt_filesfound = 'Results';
              txt_enter_at_least_1_char = "You must enter at least one character.";
              txt_browser_not_supported = "JavaScript is disabled on your browser. Please enable JavaScript to enjoy all the features of this site.";
              txt_please_wait = "Please wait. Search in progress...";
              txt_results_for = "Results for: ";
            </script>
            <link rel="stylesheet" type="text/css"
              href="../css/themes/default/jquery.mobile-1.1.0.min.css"/>
            <script type="text/javascript" src="../js/browserDetect.js">
              <xsl:comment>browserDetect</xsl:comment>
            </script>
            <script type="text/javascript" src="../js/jquery.min.js">
              <xsl:comment>jquery</xsl:comment>
            </script>
            <script type="text/javascript" src="../js/jquery.cookie.min.js">
              <xsl:comment>cookies</xsl:comment>
            </script>
            <!--<script type="text/javascript" src="../js/mobile-menubar.js">
               <xsl:comment>mobile menubar</xsl:comment>
              </script>-->
            <script type="text/javascript" src="../js/mobile-settings.js">
                <xsl:comment>mobile settings</xsl:comment>
              </script>
            
            <script type="text/javascript" src="search/l10n.js">
              <xsl:comment>l10n</xsl:comment>
            </script>
            <script type="text/javascript" src="search/htmlFileInfoList.js">
              <xsl:comment>htmlFileInfoList</xsl:comment>
            </script>
            <script type="text/javascript" src="search/nwSearchFnt.js">
              <xsl:comment>nwSearchFnt</xsl:comment>
            </script>
            <script type="text/javascript" src="{concat('search/stemmers/',$mobile.indexer.language,'_stemmer.js')}">
              <xsl:comment>make scalable to other languages as well.</xsl:comment>
            </script>
            <!--Index Files: Index is broken in to three equal sized(number of index
                items) files. This is to help parallel downloading of files to make it faster. -->
            <script type="text/javascript" src="search/index-1.js">
              <xsl:comment>index-1</xsl:comment>
            </script>
            <script type="text/javascript" src="search/index-2.js">
              <xsl:comment>index-2</xsl:comment>
            </script>
            <script type="text/javascript" src="search/index-3.js">
              <xsl:comment>index-3</xsl:comment>
            </script>
            <!-- End of index js -->
            <script type="text/javascript" src="../js/jquery.mobile-1.1.0.min.js">
              <xsl:comment>jquerymobile</xsl:comment>
            </script>
            <script type="text/javascript" src="../js/swipeupdown.js">
              <xsl:comment>swipe</xsl:comment>
            </script>
          </head>
          <body>
            <!-- Set id for menubar.html as its name -->
            <xsl:variable name="id_menubar"
              select="translate(concat('id_',$mobile.menubar.filename),'.','_')"/>
            <div data-role="page">
              <xsl:attribute name="id">
                <xsl:value-of select="$id_menubar"/>
              </xsl:attribute>
              
              <script type="text/javascript" src="../js/mobile-menubar.js">
               <xsl:comment>mobile menubar</xsl:comment>
              </script>

              <div data-role="header" data-theme="b">
                <h1>Menu Bar</h1>
                <a href="settings.html" data-icon="gear" class="ui-btn-right">Settings</a>
                <hr/>
                <!-- First Raw -->
                <!--<div data-role="navbar" data-theme="b">
                  <ul>
                    <li>
                      <div style="margin: 8px 10px;">
                        <input id="value" placeholder="Page No..." data-theme="b"/>
                      </div>
                    </li>
                    <li>
                      <a onclick="" data-role="button" data-icon="arrow-r" data-theme="b">Go</a>
                    </li>
                  </ul>
                </div>-->
                <!-- Second row -->
                <div data-role="navbar" data-theme="b">
                  <ul>
                    <li>
                      <div style="margin: 10px 15px;">
                        <select name="font-size" id="font-size" data-theme="e"
                          data-native-menu="false" data-mini="true">
                          <option value="8px">Front size-8</option>
                          <option value="9px">Front size-9</option>
                          <option value="10px">Front size-10</option>
                          <option value="12px">Front size-12</option>
                          <option value="14px">Front size-14</option>
                          <option value="16px">Front size-16</option>
                        </select>
                      </div>
                    </li>
                    <li>
                      <div style="margin: 10px 15px;">
                        <select name="font-family" id="font-family" data-theme="e"
                          data-native-menu="false" data-mini="true">
                          <option value="Arial">Font Arial</option>
                          <option value="Helvetica">Font Helvetica</option>
                          <option value="Sans-Serif">Font Sans-Serif</option>
                        </select>
                      </div>
                    </li>
                  </ul>
                </div>
                <!-- Third Raw -->
                <div id="searchDiv">
                  <div data-role="navbar" data-theme="b">
                    <ul>
                      <li>
                        <form name="searchForm" onsubmit="Verifie(searchForm);return false"
                          class="err">
                          <div style="margin: 10px 10px;">
                            <input type="text" name="textToSearch" id="textToSearch" data-theme="b"
                              placeholder="Search..." data-inset="true"/>
                            <div id="doSearch" onclick="Verifie(searchForm)" data-theme="b"/>
                          </div>
                        </form>
                      </li>
                      <li>
                        <ul>
                          <li>
                            <a onclick="searchWord()" data-icon="search" data-theme="b">Search</a>
                          </li>
                          <li>
                            <a onclick="goBack()" data-role="button" data-icon="back" data-theme="a"
                              >Back</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
                <script type="text/javascript">
                  function goBack(){
                    history.back();
                    return false;
                  }
                  function searchWord(){
                    $("#searchResults").empty();
                    $("#doSearch").click();
                  }
                  //hide the link for open the Dialog
                  $(function(){
                    $("#showDialogMenu").hide();
                  });
                </script>
              </div>
              <div data-role="content">
                <div id="searchResults">
                  <xsl:comment>Show search results</xsl:comment>
                </div>
                <xsl:comment>Show up warning message though Dialog box by redirecting to this link</xsl:comment>
                <a href="menubar.html#menubar_alert" id="showDialogMenu" data-role="button" data-inline="true" data-rel="dialog" data-transition="pop">
                  <xsl:comment>link:Dialog Box for Show Warnings</xsl:comment>
                </a>
              </div>
            </div>
            <!-- Warning Dialog Box -->
            <div data-role="page" id="menubar_alert" data-url="menubar_alert" data-overlay-theme="e">
              <div data-role="header" data-theme="b">
                <h1>Warning Alert</h1>
              </div>
              <div data-role="content" data-theme="a">
                <p style="color:orange;text-align:center;" id="warningMSGMenu">Warning Message</p>
                <a href="meubar.html" data-role="button" data-rel="back" data-theme="b" data-inline="true">OK</a>
              </div>
            </div>
          </body>
        </html>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <!-- ============================================================ -->
  <!-- = ToC html                                                 = -->
  <!-- ============================================================ -->
  <xsl:template name="toc.html">
    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename">
        <!--<xsl:choose>
          <xsl:when test="$mobile.start.filename">
            <xsl:value-of select="concat($mobile.base.dir,'/',$mobile.start.filename)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'index.html'"/>
          </xsl:otherwise>
        </xsl:choose>-->
        
        <xsl:value-of select="concat($mobile.base.dir,'/content/', $mobile.toc.filename)"/>
      </xsl:with-param>
      <xsl:with-param name="method" select="'xml'"/>
      <xsl:with-param name="encoding" select="'utf-8'"/>
      <xsl:with-param name="indent" select="'yes'"/>
      <xsl:with-param name="content">
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <xsl:choose>
              <xsl:when test="'android'=$mobile.device.platform">
                <script type="text/javascript" charset="utf-8" src="../js/cordova-1.8.1.js">
                  <xsl:comment>
                  </xsl:comment>
                </script>
              </xsl:when>
            </xsl:choose>
            <link rel="stylesheet" type="text/css"
              href="../css/themes/default/jquery.mobile-1.1.0.min.css"/>
            <script type="text/javascript" src="../js/jquery.min.js">// jquery </script>
            <script type="text/javascript" src="../js/jquery.cookie.min.js">// cookies </script>
            <!--<script type="text/javascript" src="../js/mobile-menubar.js">
              <xsl:comment>mobile menubar</xsl:comment>
            </script>-->
            <script type="text/javascript" src="../js/mobile-settings.js">
                <xsl:comment>mobile settings</xsl:comment>
              </script>
            <script type="text/javascript" src="../js/jquery.mobile-1.1.0.min.js">// jquery mobile </script>
            <!-- <script type="text/javascript" src="../js/swipeupdown.js">//swipe</script>-->
          </head>
          <body>
            <!-- Set id for toc.html as its name -->
            <xsl:variable name="id_toc" select="translate(concat('id_',$mobile.toc.filename),'.','_')"/>
            <div data-role="page" >
              <xsl:attribute name="id">
                <xsl:value-of select="$id_toc"/>
              </xsl:attribute>
              
              <script type="text/javascript" src="../js/mobile-menubar.js">
               <xsl:comment>mobile menubar</xsl:comment>
              </script>
              
              <div data-role="header">
                <h1>Table of Content</h1>
              </div>
              <div data-role="content" data-theme="a">
                <xsl:call-template name="mobiletoc">
                  <xsl:with-param name="currentid" select="generate-id(.)"/>
                </xsl:call-template>
              </div>
            </div>
          </body>
        </html>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- ============================================================ -->
  <!-- = l10n.js                                                  = -->
  <!-- ============================================================ -->
  <xsl:template name="l10n.js">
    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename">
        <xsl:value-of select="concat($base.dir,'search/l10n.js')"/>
      </xsl:with-param>
      <xsl:with-param name="method" select="'text'"/>
      <xsl:with-param name="encoding" select="'utf-8'"/>
      <xsl:with-param name="indent" select="'no'"/>
      <xsl:with-param name="content">
        //Resource strings for localization
        var localeresource = new Object;
        localeresource["search_no_results"]="<xsl:call-template name="gentext.template">
          <xsl:with-param name="name" select="'Your_search_returned_no_results'"/>
          <xsl:with-param name="context" select="'webhelp'"/>
        </xsl:call-template>";
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>

</xsl:stylesheet>
