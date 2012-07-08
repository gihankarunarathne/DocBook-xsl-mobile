<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:exsl="http://exslt.org/common"
        xmlns:ng="http://docbook.org/docbook-ng" 
        xmlns:db="http://docbook.org/ns/docbook"
        version="1.0" xmlns="http://www.w3.org/1999/xhtml">

    <xsl:import href="../../xhtml/chunk.xsl"/>

    <xsl:output
            method="html"
            encoding="utf-8"
            cdata-section-elements=""/>
	
<!-- =================================================================================================== -->	
<!-- =			some configurations for mobile xsl sheets											   = -->
<!-- =================================================================================================== -->		
	<xsl:param name="mobile.base.dir">application</xsl:param>
	<xsl:param name="mobile.include.search.tab">true</xsl:param>
	<xsl:param name="mobile.start.filename">index.html</xsl:param>
	<xsl:param name="mobile.tree.cookie.id" select="concat( 'treeview-', count(//node()) )" />
	<xsl:param name="mobile.indexer.language">en	</xsl:param>
	<xsl:param name="mobile.default.topic" />
	<xsl:param name="mobile.autolabel">0</xsl:param>
	
<!-- =================================================================================================== -->	
<!-- =			default configuration for build mobile out put										   = -->
<!-- =================================================================================================== -->	
	<xsl:param name="chunker.output.indent">no</xsl:param>
	<xsl:param name="navig.showtitles">0</xsl:param>
	<xsl:param name="generate.manifest" select="0"></xsl:param>	
	<!--<xsl:param name="manifest">HTML.manifest</xsl:param>
	<xsl:param name="manifest.in.base.dir" select="1"></xsl:param>-->

	<xsl:param name="base.dir" select="concat($mobile.base.dir,'/')"/>
	
	<xsl:param name="suppress.navigation" select="0"> </xsl:param>
		<!-- =|? If non-zero, header and footer navigation will be suppressed ?|= -->
	<!--<xsl:param name="suppress.header.navigation" select="0"></xsl:param>
	<xsl:param name="suppress.footer.navigation">0</xsl:param>-->
	
	<xsl:param name="generate.index" select="0"></xsl:param>
	<!--<xsl:param name="index.links.to.section" select="1"></xsl:param>-->	
	
	<xsl:param name="inherit.keywords" select="0"></xsl:param>
		<!-- =|? is non-zero, the keyword meta for each HTML head element will include all of the keywords from ancestor elements. =|? -->
	
	<xsl:param name="para.propagates.style" select="1"></xsl:param>
		<!-- =|? if true, the role attribute of para elements will be passed through to the HTML as a class attribute on the p generated for the 					paragraph =|? -->
	
	<xsl:param name="phrase.propagates.style" select="1"></xsl:param>
		<!-- =|? the role attribute of phrase elements will be passed through to the HTML as a class attribute on a span that
			surrounds the phrase =|? -->
	
	<xsl:param name="chunk.first.sections" select="0"></xsl:param>
		<!-- =|? if non zero, a chunk will be created for the first top level sect1 or section elements in each component =|? -->	
	
	<!--<xsl:param name="chunk.section.depth" select="1"></xsl:param>
	<xsl:param name="chunk.separate.lots" select="1"></xsl:param>-->
		<!-- =|? if non-zero, each of the ToC and LoTs (List of Examples, List of Figures, etc.) will be put in its own separate chunk.
			The title page includes generated links to each of the separate files.
			This feature depends on the chunk.tocs.and.lots parameter also being non-zero =|? -->
	<xsl:param name="chunk.tocs.and.lots" select="1"></xsl:param>
	<!-- =|? if non-zero, ToC and LoT (List of Examples, List of Figures, etc.) will be put in a separate chunk =|? -->
	<!-- <xsl:param name="generate.section.toc.level" select="0"></xsl:param> -->
	<!-- <xsl:param name="toc.max.depth">8</xsl:param> -->

	<xsl:param name="chapter.autolabel" select="1"/>
    <xsl:param name="section.autolabel" select="0"/>
    <!-- <xsl:param name="appendix.autolabel">A</xsl:param> -->
    <!-- <xsl:param name="preface.autolabel" select="0"></xsl:param> -->
    
<!--########################################################################################################################
	#																													   #
	########################################################################################################################-->
	
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
	
<!-- ========== elementary template which is located in "docbook.xsl" of xhtml style sheets in xsl repo. =================== -->	
	<xsl:template match="/">
		<xsl:message> language: <xsl:value-of select="$mobile.indexer.language"/>
		</xsl:message>
		<!-- * Get a title for current doc so that we let the user -->
		<!-- * know what document we are processing at this point. -->
		<xsl:variable name="doc.title">
			<xsl:call-template name="get.doc.title"/>
		</xsl:variable>
		<xsl:choose>
			<!-- Hack! If someone hands us a DocBook V5.x or DocBook NG document, 
				toss the namespace and continue. Use the docbook5 namespaced stylesheets 
				for DocBook5 if you don't want to use this feature. -->
			<!-- include extra test for Xalan quirk -->
			<xsl:when test="$exsl.node.set.available != 0 and (*/self::ng:* or */self::db:*)">
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
				<!-- <xsl:message>Saving stripped document.</xsl:message> <xsl:call-template 
					name="write.chunk"> <xsl:with-param name="filename" select="'/tmp/stripped.xml'"/> 
					<xsl:with-param name="method" select="'xml'"/> <xsl:with-param name="content"> 
					<xsl:copy-of select="exsl:node-set($nons)"/> </xsl:with-param> </xsl:call-template> -->
				<xsl:call-template name="log.message">
					<xsl:with-param name="level"> Note </xsl:with-param>
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
									<xsl:apply-templates select="key('id', $rootid)"
										mode="collect.targets"/>
								</xsl:if>
								<xsl:if test="$collect.xref.targets != 'only'">
									<xsl:apply-templates select="key('id',$rootid)"
										mode="process.root"/>
									<xsl:if test="$tex.math.in.alt != ''">
										<xsl:apply-templates select="key('id',$rootid)"
											mode="collect.tex.math"/>
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

		<!--<xsl:call-template name="index.html" />-->
		<!--		<xsl:call-template name="menubar.html"/>-->
		<xsl:call-template name="mobiletoc.html"/>

	</xsl:template>

<!-- ========== elementary template which is located in chunk-common.xsl of xhtml style sheets in xsl repo.=================== -->
	
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
				<!-- from 1026:chunk-common.xsl : also add "head" tag -->
				<xsl:with-param name="prev" select="$prev"/>
				<xsl:with-param name="next" select="$next"/>
			</xsl:call-template>

			<body>
				<!--<xsl:variable name="doc.title">
					<xsl:call-template name="chapter.titlepage"/>
				</xsl:variable>-->
				<!-- have to put page id as chunked htmls -->
				<div data-role="page" id="current_page">
					<xsl:call-template name="body.attributes"/>
					<!-- from 117:docbook.xsl -->

					<xsl:call-template name="user.header.navigation">
						<!-- from 322 docbook.xsl -->
						<xsl:with-param name="prev" select="$prev"/>
						<xsl:with-param name="next" select="$next"/>
						<xsl:with-param name="nav.context" select="$nav.context"/>
					</xsl:call-template>

					<div data-role="content">

						<xsl:call-template name="user.header.content"/>

						<xsl:copy-of select="$content"/>

						<xsl:call-template name="user.footer.content"/>

						<xsl:call-template name="footer.navigation">
							<xsl:with-param name="prev" select="$prev"/>
							<xsl:with-param name="next" select="$next"/>
							<xsl:with-param name="nav.context" select="$nav.context"/>
						</xsl:call-template>
					</div>
<!--					<xsl:call-template name="user.footer.navigation"/>-->
				</div>
			</body>
		</html>
		<xsl:value-of select="$chunk.append"/>
	</xsl:template>
	
<!-- =================================================================================================== -->	
<!-- 			Head content																			 -->
<!-- =================================================================================================== -->	
	
<!-- ====== "user.head.content" called from "chunk-element-content ===================================== -->
	
	<xsl:template name="user.head.content">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<!-- <xsl:message> mobile.tree.cookie.id = <xsl:value-of select="$mobile.tree.cookie.id"/> 
			+++ <xsl:value-of select="count(//node())"/> $mobile.indexer.language = 
			<xsl:value-of select="$mobile.indexer.language"/> +++ <xsl:value-of select="count(//node())"/> 
			</xsl:message> -->
		
		<script type="text/javascript">
			//The id for tree cookie
			var treeCookieId = "
			<xsl:value-of select="$mobile.tree.cookie.id" />
			";
			var language = "
			<xsl:value-of select="$mobile.indexer.language" />
			";
			var w = new Object();
			//Localization
			txt_filesfound = '
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'txt_filesfound'" />
			</xsl:call-template>
			';
			txt_enter_at_least_1_char = "
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'txt_enter_at_least_1_char'" />
			</xsl:call-template>
			";
			txt_browser_not_supported = "
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'txt_browser_not_supported'" />
			</xsl:call-template>
			";
			txt_please_wait = "
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'txt_please_wait'" />
			</xsl:call-template>
			";
			txt_results_for = "
			<xsl:call-template name="gentext">
				<xsl:with-param name="key" select="'txt_results_for'" />
			</xsl:call-template>
			";
		</script>
		
		<!--<style type="text/css">
			input {
			margin-bottom: 5px;
			margin-top: 2px;
			}

			.folder {
			display: block;
			height: 22px;
			padding-left: 20px;
			background: transparent url(../common/jquery/treeview/images/folder.gif) 0 0px
			no-repeat;
			}
			<!-\-[if IE]> input { margin-bottom: 5px; margin-top: 2px; } <![endif] -\->
		</style>-->
		
		<!--<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="../common/css/positioning.css" />
		<link rel="stylesheet" type="text/css"
			href="../common/jquery/theme-redmond/jquery-ui-1.8.2.custom.css" />
		<link rel="stylesheet" type="text/css"
			href="../common/jquery/treeview/jquery.treeview.css" />-->
		<link rel="stylesheet" type="text/css" href="css/themes/default/jquery.mobile-1.1.0.css" />
		
		<script type="text/javascript" charset="utf-8" src="js/cordova-1.8.1.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="js/jquery-1.7.2.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="js/jquery.mobile-1.1.0.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="js/swipeupdown.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		
		<!--Scripts/css stylesheets for Search -->
		<script type="text/javascript" src="search/htmlFileList.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="search/htmlFileInfoList.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="search/nwSearchFnt.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		
		<!--<script type="text/javascript" src="search/addition.js"> <xsl:comment></xsl:comment> 
			</script> <script type="text/javascript" src="search/indexLoader.js"> <xsl:comment></xsl:comment> 
			</script> -->
		
		
		<!-- NOTE: Stemmer javascript files should be in format <language>_stemmer.js. 
			For example, for English(en), source should be: "search/stemmers/en_stemmer.js" 
			For country codes, see: http://www.uspto.gov/patft/help/helpctry.htm -->
		<!--<xsl:message><xsl:value-of select="concat('search/stemmers/',$mobile.indexer.language,'_stemmer.js')"/></xsl:message> -->
		<script type="text/javascript"
			src="{concat('search/stemmers/',$mobile.indexer.language,'_stemmer.js')}">
			<xsl:comment>
				//make this scalable to other languages as well.
			</xsl:comment>
		</script>
		
		<!--Index Files: Index is broken in to three equal sized(number of index 
			items) files. This is to help parallel downloading of files to make it faster. -->
		<script type="text/javascript" src="search/index-1.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="search/index-2.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<script type="text/javascript" src="search/index-3.js">
			<xsl:comment>
			</xsl:comment>
		</script>
		<!--End of index files -->
	</xsl:template>
	
<!-- ====== "system.header.content" called from "docbook.xsl" ========================================== -->
	<!-- system.head.content is like user.head.content, except that
       it is called before head.content. This is important because it
       means, for example, that <style> elements output by system.head.content
       have a lower CSS precedence than the users stylesheet. -->
	
	<!--<xsl:template name="system.head.content">
		<xsl:param name="node" select="." />
		<xsl:text>
        </xsl:text>
		<!-\- This avoids two problems in IE 8. We should someday figure out why 
			this is happening and tweak the JavaScript so this <meta/> tag is not necessary: 
			1. When you perform a search and click the Toggle Highlight button, IE 8 
			adds a line break before the highlighted word. 2. If you click the show/hide 
			toc button, the tab crashes. These problems go away when you add this IE=7 
			mode meta tag. -\->
		<meta http-equiv="X-UA-Compatible" content="IE=7" />
		<xsl:text>
        </xsl:text>
	</xsl:template>-->
	
<!-- ====== "user.header.navigation" called from "chunk-element-content" ============================== -->
	<xsl:template name="user.header.navigation">
		<xsl:param name="prev" />
		<xsl:param name="next" />
		<xsl:param name="nav.context" />
		<xsl:call-template name="mobileheader">
			<xsl:with-param name="prev" select="$prev" />
			<xsl:with-param name="next" select="$next" />
			<xsl:with-param name="nav.context" select="$nav.context" />
		</xsl:call-template>
		<!-- <xsl:call-template name="mobiletoc"/> -->
		
		<!-- <testing toc in the content page> <xsl:call-template name="mobiletoctoc"/> 
			<xsl:if test="$mobile.include.search.tab != 'false'"> <xsl:call-template 
			name="search"/> </xsl:if> -->
	</xsl:template>
	
<!-- ====== "user.header.content" called from "chunk-element-content" ============================== -->
	<xsl:template name="user.header.content">
		<xsl:comment> <!-- KEEP this code. -->
		</xsl:comment>
	</xsl:template>
	
<!-- ====== "mobileheader" : The Header with the company logo -->
	<xsl:template name="mobileheader">
		<xsl:param name="prev"/>
		<xsl:param name="next"/>
		<xsl:param name="nav.context"/>

		<xsl:variable name="home" select="/*[1]"/>
		<xsl:variable name="up" select="parent::*"/>

		<!--		<div id="header">-->
		<div data-role="header" data-theme="b" data-mini="true">
			<!--<img style="margin-right: 2px; height: 59px; padding-right: 25px; padding-top: 8px"
				align="right" src="../common/images/logo.png" alt="Company Logo"/>-->

			<!-- Display the page title and the main heading(parent) of it -->
			<h6>			
				<xsl:choose>
					<xsl:when
						test="count($up)&gt; 0 and generate-id($up) != generate-id($home)">
						<!-- test="count($up)&gt; 0 and generate-id($up) != generate-id($home)"> -->
						<xsl:apply-templates select="$up"
							mode="object.title.markup" />
					</xsl:when>
					<xsl:otherwise>
						&#160;
					</xsl:otherwise>
				</xsl:choose>
			</h6>

			<!-- Prev and Next links generation -->

			<xsl:comment>
					<!-- KEEP this code. In case of neither prev nor next links are available, 
						this will help to keep the integrity of the DOM tree -->
				</xsl:comment>
			<!--<xsl:with-param name="prev" select="$prev"/> <xsl:with-param name="next" 
					select="$next"/> <xsl:with-param name="nav.context" select="$nav.context"/> -->

			<!--<a href="ch02_02_01.html" data-role="button" data-icon="arrow-l"
					data-iconpos="notext" data-theme="a">PREV</a>
				<h6>Introduction</h6>
				<a href="ch01.html" data-role="button" data-icon="arrow-r" data-iconpos="notext"
					data-theme="a">NEXT</a>-->

			<xsl:if
				test="count($prev) &gt; 0
							or (count($up) &gt; 0
							and generate-id($up) != generate-id($home)
							and $navig.showtitles != 0)
							or count($next) &gt; 0">

				<xsl:if test="count($prev)>0">
					<a data-role="button" data-icon="arrow-l" data-iconpos="notext" data-theme="a">
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

				<!-- "Up" link -->
				<!--<xsl:choose>
						<xsl:when
							test="count($up)&gt;0
										and generate-id($up) != generate-id($home)"
							> | <a accesskey="u">
								<xsl:attribute name="href">
									<xsl:call-template name="href.target">
										<xsl:with-param name="object" select="$up"/>
									</xsl:call-template>
								</xsl:attribute>
								<xsl:call-template name="navig.content">
									<xsl:with-param name="direction" select="'up'"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise> &#160; </xsl:otherwise>
					</xsl:choose>-->

				<xsl:if test="count($next)>0">
					<a data-role="button" data-icon="arrow-r" data-iconpos="notext" data-theme="a">
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
				<script type="text/javascript">
					$(function() {
						$("#current_page").live('swipedown', function(event) {
							$.mobile.changePage("bk01-toc.html");
						});
					});
				
					$(function() {
						$("#current_page").live('swipeup', function(event) {
							$.mobile.changePage("menubar.html");
						});
					});
					
				 	$(function() {
				 		$("#current_page").live('swipeleft', function(event) {
				 			$.mobile.changePage("<xsl:value-of select="$nav_prev"/>");
				 		});
				 	});
					
					$(function() {
						$("#current_page").live('swiperight', function(event) {
							$.mobile.changePage("<xsl:value-of select="$nav_next"/>");
						});
					});
				</script>
			</xsl:if>
		</div>
	</xsl:template>
	
<!-- =================================================================================================== -->	
<!-- 			Footer content																			 -->
<!-- =================================================================================================== -->	
	
<!-- ====== "user.footer.content" called from "                          " ========================= -->	
	<xsl:template name="user.footer.content">
		<script type="text/javascript" src="../common/main.js">
			<xsl:comment></xsl:comment>
		</script>
	</xsl:template>
	
<!-- ====== "user.footer.navigation" called from "                         " ======================= -->
	<xsl:template name="user.footer.navigation">
		<xsl:call-template name="mobiletoc">
			<xsl:with-param name="currentid" select="generate-id(.)" />
		</xsl:call-template>
	</xsl:template>
	
<!-- =================================================================================================== -->	
<!-- =			Table of content																	   = -->
<!-- =================================================================================================== -->	
		
	<xsl:template match="text()" mode="mobiletoc" />
	
	<!-- DEFINITION : both xsl:template and xsl:apply-templates have an optional mode attribute. If xsl:template does not have a match attribute, it 		must not have a mode attribute. If an xsl:apply-templates element has a mode attribute, then it applies only to those template rules from 				xsl:template elements that have a mode attribute with the same value; if an xsl:apply-templates element does not have a mode attribute, then it 		applies only to those template rules from xsl:template elements that do not have a mode attribute -->
	
<!-- ====== "mobile-toc" : newly created =============================================================== -->
	<xsl:template name="mobiletoc">
		<xsl:param name="currentid" />
		<xsl:choose>
			<xsl:when test="$rootid != ''">
				<xsl:variable name="title">
					<xsl:if test="$mobile.autolabel=1">
						<xsl:variable name="label.markup">
							<xsl:apply-templates select="key('id',$rootid)"
								mode="label.markup" />
						</xsl:variable>
						<xsl:if test="normalize-space($label.markup)">
							<xsl:value-of select="concat($label.markup,$autotoc.label.separator)" />
						</xsl:if>
					</xsl:if>
					<xsl:apply-templates select="key('id',$rootid)"
						mode="title.markup" />
				</xsl:variable>
				<xsl:variable name="href">
					<xsl:choose>
						<xsl:when test="$manifest.in.base.dir != 0">
							<xsl:call-template name="href.target">
								<xsl:with-param name="object" select="key('id',$rootid)" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="href.target.with.base.dir">
								<xsl:with-param name="object" select="key('id',$rootid)" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
			</xsl:when>
			
			<xsl:otherwise>
				<xsl:variable name="title">
					<xsl:if test="$mobile.autolabel=1">
						<xsl:variable name="label.markup">
							<xsl:apply-templates select="/*" mode="label.markup" />
						</xsl:variable>
						<xsl:if test="normalize-space($label.markup)">
							<xsl:value-of select="concat($label.markup,$autotoc.label.separator)" />
						</xsl:if>
					</xsl:if>
					<xsl:apply-templates select="/*" mode="title.markup" />
				</xsl:variable>
				<xsl:variable name="href">
					<xsl:choose>
						<xsl:when test="$manifest.in.base.dir != 0">
							<xsl:call-template name="href.target">
								<xsl:with-param name="object" select="/" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="href.target.with.base.dir">
								<xsl:with-param name="object" select="/" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<div>
					<div id="leftnavigation" style="padding-top:3px; background-color:white;">
						<div id="tabs">
							<ul>
								<li>
									<a href="#treeDiv">
										<em>
											<xsl:call-template name="gentext">
												<xsl:with-param name="key" select="'TableofContents'" />
											</xsl:call-template>
										</em>
									</a>
								</li>
								<xsl:if test="$mobile.include.search.tab != 'false'">
									<li>
										<a href="#searchDiv">
											<em>
												<xsl:call-template name="gentext">
													<xsl:with-param name="key" select="'Search'" />
												</xsl:call-template>
											</em>
										</a>
									</li>
								</xsl:if>
							</ul>
							<div id="treeDiv">
								<img src="../common/images/loading.gif" alt="loading table of contents..."
									id="tocLoading" style="display:block;" />
								<div id="ulTreeDiv" style="display:none">
									<ul id="tree" class="filetree">
										<xsl:apply-templates select="/*/*" mode="mobiletoc">
											<xsl:with-param name="currentid" select="$currentid" />
										</xsl:apply-templates>
									</ul>
								</div>
								
							</div>
							<xsl:if test="$mobile.include.search.tab != 'false'">
								<div id="searchDiv">
									<div id="search">
										<form onsubmit="Verifie(ditaSearch_Form);return false"
											name="ditaSearch_Form" class="searchForm">
											<fieldset class="searchFieldSet">
												<legend>
													<xsl:call-template name="gentext">
														<xsl:with-param name="key" select="'Search'" />
													</xsl:call-template>
												</legend>
												<center>
													<input id="textToSearch" name="textToSearch" type="text"
														class="searchText" />
													<xsl:text disable-output-escaping="yes"> <![CDATA[&nbsp;]]> 
                                                    </xsl:text>
													<input onclick="Verifie(ditaSearch_Form)" type="button"
														class="searchButton" value="Go" id="doSearch" />
												</center>
											</fieldset>
										</form>
									</div>
									<div id="searchResults">
										<center>
										</center>
									</div>
								</div>
							</xsl:if>
							
						</div>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="mobiletoc.html">
			<xsl:variable name="default.topic">
				<xsl:choose>
					<xsl:when test="$mobile.default.topic != ''">
						<xsl:value-of select="$htmlhelp.default.topic" />
					</xsl:when>
					<xsl:when test="$htmlhelp.default.topic != ''">
						<xsl:value-of select="$htmlhelp.default.topic" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="make-relative-filename">
							<xsl:with-param name="base.dir" />
							<xsl:with-param name="base.name">
								<xsl:choose>
									<xsl:when test="$rootid != ''">
										<xsl:apply-templates select="key('id',$rootid)"
											mode="chunk-filename" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates
											select="*/*[self::preface|self::chapter|self::appendix|self::part][1]"
											mode="chunk-filename" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="write.chunk">
				<xsl:with-param name="filename">
					<!-- <xsl:if test="$manifest.in.base.dir != 0"> -->
					<!-- <xsl:value-of select="$base.dir"/> -->
					<!-- </xsl:if> -->
					<xsl:choose>
						<xsl:when test="$mobile.start.filename">
							<xsl:value-of
								select="concat($mobile.base.dir,'/',$mobile.start.filename)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'index.html'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="method" select="'xml'" />
				<xsl:with-param name="encoding" select="'utf-8'" />
				<xsl:with-param name="indent" select="'yes'" />
				<xsl:with-param name="content">
					<html>
						<head>
							<link rel="shortcut icon" href="favicon.ico" />
							<meta http-equiv="Refresh" content="1; URL=content/{$default.topic}" />
							<title>
								<xsl:value-of select="//title[1]" />
								&#160;
							</title>
						</head>
						<body>
							If not automatically redirected, click here:
							<a href="content/ch01.html">content/ch01.html</a>
						</body>
					</html>
				</xsl:with-param>
			</xsl:call-template>
	</xsl:template>
	
	
<!-- ====== when match one of following ->execute ====================================================== -->
	<xsl:template  match= "book|part|reference|preface|chapter|bibliography|appendix|article|glossary|section|simplesect|sect1|sect2|sect3|sect4|sect5|refentry|colophon|bibliodiv|index"
		mode="mobiletoc">
		<xsl:param name="currentid" />
		<xsl:variable name="title">
			<xsl:if test="$mobile.autolabel=1">
				<xsl:variable name="label.markup">
					<xsl:apply-templates select="." mode="label.markup" />
				</xsl:variable>
				<xsl:if test="normalize-space($label.markup)">
					<xsl:value-of select="concat($label.markup,$autotoc.label.separator)" />
				</xsl:if>
			</xsl:if>
			<xsl:apply-templates select="." mode="title.markup" />
		</xsl:variable>
		
		<xsl:variable name="href">
			<xsl:choose>
				<xsl:when test="$manifest.in.base.dir != 0">
					<xsl:call-template name="href.target" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="href.target.with.base.dir" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="id" select="generate-id(.)" />
		<!--<xsl:message> <xsl: select="name(ancestor-or-self::*) "/> </xsl:message> -->
		
		<xsl:if
			test="not(self::index) or (self::index and not($generate.index = 0))">
			<!--li style="white-space: pre; line-height: 0em;" -->
			<li>
				<xsl:if test="$id = $currentid">
					<xsl:attribute name="id">mobile-currentid</xsl:attribute>
				</xsl:if>
				<span class="file">
					<a href="{substring-after($href,concat($mobile.base.dir,'/content/'))}">
						<xsl:value-of select="$title" />
					</a>
				</span>
				<xsl:if
					test="part|reference|preface|chapter|bibliography|appendix|article|glossary|section|simplesect|sect1|sect2|sect3|sect4|sect5|refentry|colophon|bibliodiv">
					<ul>
						<xsl:apply-templates
							select="part|reference|preface|chapter|bibliography|appendix|article|glossary|section|simplesect|sect1|sect2|sect3|sect4|sect5|refentry|colophon|bibliodiv"
							mode="mobiletoc">
							<xsl:with-param name="currentid" select="$currentid" />
						</xsl:apply-templates>
					</ul>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>
	
<!-- =================================================================================================== -->	
<!-- 			Menu Bar content																		 -->
<!-- =================================================================================================== -->		
	
<!-- ====== "mobile-munubar.html" : newly created -->
	<xsl:template name="mobile-munubar.html"></xsl:template>
	
</xsl:stylesheet>