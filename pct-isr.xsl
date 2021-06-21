<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="mathml.xsl"?>

<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="exsl msxsl"
	xmlns:LT="Lookuptable"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">
	
	<!-- Default to WEB display. Change the parameter to enable the edit mode. -->
	<xsl:param name="media" select="'web'"/>
	<xsl:param name="bgcolor-editable" select="'#E4EFFF'" /> <!--#E0F0FF #E0F0FF #D9F7FF #D4E5FF -->
	<xsl:param name="langGui" select="''"/> <!-- User selected language -->
	<xsl:param name="addNavigation" select="'true'"/>
	<xsl:param name="forceRightToLeft" select="'false'"/> <!-- 'true' for "AR" in Editor and DocViewer (no need for moden browser!) -->
	
	<!-- 
	********************
	*  Global variables
	********************
	-->
	<xsl:variable name="a4Height" select="number('3508')" />
	<xsl:variable name="a4Width" select="number('2480')" />
	<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþабвгдежзийклмнопрстуфхцчшщъыьэюяčďľĺňŕřšůťž'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯČĎĽĹŇŔŘŠŮŤŽ'" />
	<xsl:variable name="alpha" select="'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<xsl:variable name="numbers" select="'0123456789'"/>
	<xsl:param name="dpi" select="number('80')" />

    <xsl:variable name="ia"
		select="translate(substring(//application-reference/document-id/doc-number, 5), '/', '')" />
		
	<xsl:variable name="dash">
		<xsl:text disable-output-escaping="yes">&#8208;&#8193;</xsl:text>
	</xsl:variable>
	<xsl:variable name="bullet">
		<xsl:text disable-output-escaping="yes">&#8226;&#8193;</xsl:text>
	</xsl:variable>
	<xsl:variable name="circle">
		<xsl:text disable-output-escaping="yes">&#9675;&#8193;</xsl:text>
	</xsl:variable>
	<xsl:variable name="square">
		<xsl:text disable-output-escaping="yes">&#9744;&#8193;</xsl:text>
	</xsl:variable>
	<xsl:variable name="upArrow">
		<xsl:text disable-output-escaping="yes">&#8679;</xsl:text>
	</xsl:variable>
	<xsl:variable name="upTrangleSolid">
		<xsl:text disable-output-escaping="yes">&#9650;</xsl:text>
	</xsl:variable>
	<xsl:variable name="upTrangleHollow">
		<xsl:text disable-output-escaping="yes">&#9651;</xsl:text>
	</xsl:variable>
	<xsl:variable name="spaceNormal">
		<xsl:text disable-output-escaping="yes">&#32;</xsl:text>
	</xsl:variable>
	<xsl:variable name="spaceNbsp">
		<xsl:text disable-output-escaping="yes">&#160;</xsl:text>
	</xsl:variable>
	<xsl:variable name="spaceEn">
		<xsl:text disable-output-escaping="yes">&#8192;</xsl:text>
	</xsl:variable>	
	<xsl:variable name="spaceEm">
		<xsl:text disable-output-escaping="yes">&#8193;</xsl:text>
	</xsl:variable>				
	<xsl:variable name="semiColon">
		<xsl:text disable-output-escaping="yes">&#59;</xsl:text>
	</xsl:variable>	
	<xsl:variable name="semiColonNonLatin">
		<xsl:text disable-output-escaping="yes">&#65307;</xsl:text>
	</xsl:variable>
	<xsl:variable name="fullWidthComma">
		<xsl:text disable-output-escaping="yes">&#65292;</xsl:text>
	</xsl:variable>	
	<xsl:variable name="smallComma">
		<xsl:text disable-output-escaping="yes">&#65104;</xsl:text>
	</xsl:variable>		
	<xsl:variable name="quotNonLatinLeft">
		<xsl:text disable-output-escaping="yes">&#8220;</xsl:text>
	</xsl:variable>	
	<xsl:variable name="quotNonLatinRight">
		<xsl:text disable-output-escaping="yes">&#8221;</xsl:text>
	</xsl:variable>	
	<xsl:variable name="softHyphen">
		<xsl:text disable-output-escaping="yes">&#xad;</xsl:text>
	</xsl:variable>
	
	<xsl:param name="max-width" select="210"/>
	<xsl:param name="max-height" select="297"/>
	
	<xsl:param name="ipcUrlRoot">
	  <xsl:text>http://www.wipo.int/ipcpub/?refresh=page&amp;viewmode=a&amp;notion=scheme&amp;lang=en</xsl:text>
	</xsl:param>
	
	<xsl:param name="iaUrlRoot">
	  <xsl:text>http://patentscope.wipo.int/search/en/</xsl:text>
	</xsl:param>
		
	<xsl:param name="pnUrlRoot">
	  <xsl:text>http://patentscope.wipo.int/search/en/detail.jsf?docPN=</xsl:text>
	</xsl:param>	
	
	<xsl:param name="gnUrlRoot">
	  <xsl:text>http://patentscope.wipo.int/search/en/detail.jsf?docGN=</xsl:text>
	</xsl:param>
	
	<xsl:param name="anUrlRoot">
	  <xsl:text>http://patentscope.wipo.int/search/en/detail.jsf?docAN=</xsl:text>
	</xsl:param>
	
	<xsl:param name="idUrlRoot">
	  <xsl:text>http://patentscope.wipo.int/search/en/detail.jsf?docId=</xsl:text>
	</xsl:param>	
		
	<xsl:param name="fuzzyUrlRoot">
	  <xsl:text>http://patentscope.wipo.int/search/en/detail.jsf?query=</xsl:text>
	</xsl:param>
	
	<xsl:param name="doiUrlRoot">
	  <xsl:text>https://www.doi.org/</xsl:text>
	</xsl:param>
	
	<xsl:param name="issnUrlRoot">
	  <xsl:text>https://portal.issn.org/resource/ISSN/</xsl:text>
	</xsl:param>
		
	<xsl:param name="isbnUrlRoot">
	  <xsl:text>https://isbnsearch.org/isbn/</xsl:text>
	</xsl:param>
	
	<xsl:param name="usePatentScopeUrl" select='true' />
	
	<xsl:param name="imageRoot" select="'none'" />
	<xsl:variable name="imageUrlRoot"> 
		<xsl:choose>
			<xsl:when test="$imageRoot">
				<xsl:choose>
					<xsl:when test="$imageRoot = 'none'"><xsl:text/></xsl:when>
					<xsl:otherwise><xsl:value-of select="$imageRoot"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		<xsl:otherwise>http://www.wipo.int/pctdb/images/ST36-DATA/<xsl:value-of select="substring($ia, 1, 2)"/>/<xsl:value-of select="substring($ia, 11, 2)"/>/<xsl:value-of select="$ia"/>/</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="ssLink" select="'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAANCAYAAABPeYUaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAE1SURBVDhPY/z169d/Bnzg5w+G3+wcDKxQLjbABKVxglcnbjDULbvJ8PAbVAALIGgICPz58IVhyrLLDIef/oaKoAKchvz+9pnh04sXDDff/4MI/PrFsGnjZYbpx18zoBuFFia/Gd5ducuw9PRXhkffoUJYAK+UMEOOjwKDEAuEj2TIF4Yrm28xLHyMP5zhgI2dISxYg8FUkAXhnVdH7hJvABqAGvKEYf/VPxAmEQDkncoEHbArQADindvXGEp3QwKBhZONQV2EjUFZkYOBF8j/fOctw6ZnMBcyMigZyjKkWIqipBuwUe9e/mZgEeBhSPFRYlDmQ01Wr96+Z2B49hcYBmwMfp4aDLbSmMkO4pL37xjeCQoxCEEFkcGrgxcY+p9yMmQEqDPIc0EF0QBVkj1hQwgCBgYAA/92L852VTMAAAAASUVORK5CYII='" />
	
	<!-- Use the GUI language setting if provided; otherwise read it from the XML -->
	<xsl:variable name="langOriginal" select="substring(translate(/search-report/@lang, $uppercase, $smallcase),1,2)" />
	
	<xsl:variable name="lang">
		<xsl:choose>
			<xsl:when test="$langGui=''">			
				<xsl:value-of select="$langOriginal"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$langGui" />
			</xsl:otherwise>		
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="varNeedTranslation">
		<xsl:choose>
			<xsl:when test="$lang!=$langOriginal">			
				<xsl:value-of select="'needTranslation'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>		
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="clsIndent40">
		<xsl:choose>
			<xsl:when test="$lang='ar'">
				<xsl:value-of select="'indent40_R'"/>
			</xsl:when>
			<xsl:otherwise>		
				<xsl:value-of select="'indent40'"/>		
			</xsl:otherwise>			
		</xsl:choose>
	</xsl:variable>
		
	<xsl:variable name="clsThinDivider">
		<xsl:choose>
			<xsl:when test="$lang='ar'">
				<xsl:value-of select="'thinRight'"/>
			</xsl:when>
			<xsl:otherwise>		
				<xsl:value-of select="'thinLeft'"/>		
			</xsl:otherwise>			
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="textDirection">
		<xsl:choose>
			<xsl:when test="$lang='ar'">
				<xsl:value-of select="'rtl'"/>
			</xsl:when>
			<xsl:otherwise>		
				<xsl:value-of select="'auto'"/>		
			</xsl:otherwise>			
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="srepOffice" select="/search-report/@srep-office" />  
    <xsl:variable name="dateProduced" select="/search-report/@date-produced" />
    
    <xsl:variable name="newCitationLayout">
    	<xsl:choose>
			<xsl:when test="$srepOffice='KR' and $dateProduced &gt; 20181231">
				<xsl:value-of select="'true'"/>
			</xsl:when>
			<xsl:otherwise>		
				<xsl:value-of select="'false'"/>		
			</xsl:otherwise>			
		</xsl:choose>
	</xsl:variable>   
		
  <!-- PCT Form ID PCT/(RO| ISA| IB| IPEA| SISA)/NNN -->
	<xsl:param name="form_number">
		<xsl:choose>
			<xsl:when test="//srep-info/srep-established/@srep-established = 'no' ">203</xsl:when>
			<xsl:when test="//srep-info/srep-established/@srep-established = 'yes' ">210</xsl:when>
			<xsl:when test="search-report/@search-type='isr' and not(//srep-info/srep-established)">210</xsl:when>
			<xsl:when test="contains(/written-opinion/@opinion-type, 'woisa') ">237</xsl:when>
			<xsl:when test="contains(/written-opinion/@opinion-type, 'iprp') ">409</xsl:when>
			<xsl:otherwise>999</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	
	<xsl:param name="version_indicator">
		<xsl:choose>
			<xsl:when test="$form_number = 203">
				<xsl:value-of select="/search-report/@form-version"/>
			</xsl:when>
			<xsl:when test="$form_number = 210">
				<xsl:value-of select="/search-report/@form-version"/>
			</xsl:when>
			<xsl:when test="$form_number = 220">
				<xsl:value-of select="/search-report/@form-version"/>
			</xsl:when>
			<xsl:when test="$form_number = 237">
				<xsl:value-of select="/written-opinion/@form-version"/>
			</xsl:when>
			<xsl:when test="$form_number = 409">
				<xsl:value-of select="/written-opinion/@form-version"/>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	
   <xsl:param name="authority_type">
		<xsl:choose>
			<xsl:when test="$form_number &lt; 100">XXX</xsl:when>
			<xsl:when test="$form_number &lt; 200">RO</xsl:when>
			<xsl:when test="$form_number &lt; 300">ISA</xsl:when>
			<xsl:when test="$form_number &lt; 400">IB</xsl:when>
			<xsl:when test="$form_number &lt; 500">IPEA</xsl:when>
			<xsl:when test="$form_number &lt; 600">SISA</xsl:when>
			<xsl:when test="$form_number = 'WPA'">WO</xsl:when>
			<xsl:otherwise>XXX</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	
	<xsl:param name="form_id">
		<xsl:text>PCT/</xsl:text>
		<xsl:value-of select="$authority_type"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$form_number"/>
	</xsl:param>
	
	<!-- Import the template text translations to be rendered -->
	<xsl:param name="common_table_file" select="concat('translation/CommonTranslationTable-', $lang, '.xml')"/>
	<xsl:param name="form_table_file" select="concat('translation/', $authority_type, $form_number, 'TranslationTable-', $lang, '.xml')"/>
	<xsl:param name="country_table_file">translation/CountryTranslationTable.xml</xsl:param>
	<xsl:param name="office_table_file">translation/OfficeTranslationTable.xml</xsl:param>
	<xsl:param name="language_table_file">translation/LanguageTranslationTable.xml</xsl:param>
	
	<xsl:variable name="common_table" select="document($common_table_file)//LT:template-translations"/>
	<xsl:variable name="form_table" select="document($form_table_file)//LT:template-translations"/>
	
	<xsl:variable name="country_table" select="document($country_table_file)//LT:template-translations[@LT:lang = $lang]"/>
	<xsl:variable name="country_table_en" select="document($country_table_file)//LT:template-translations[@LT:lang = en]"/>
	<xsl:variable name="office_table" select="document($office_table_file)//LT:template-translations[@LT:lang = $lang]"/>
	<xsl:variable name="language_table" select="document($language_table_file)//LT:template-translations[@LT:lang = $lang]"/>	
	
	<xsl:variable name="trans_addon_file" select="'TranslationTableRptAddOn.xml'" /> <!-- report specific -->
	<xsl:variable name="trans_addon_table" select="document($trans_addon_file)//LT:template-translations[@LT:lang = $lang]"/>
	
	<xsl:output method="html" indent="no" />

	<xsl:template name="htmlHeader">
		<head>
			<link type="text/css" href="PctPrint.css" rel="stylesheet" media="print" />
			<title>
				<xsl:choose>
					<xsl:when test="$form_number = 203">
						INTERNATIONAL SEARCH REPORT (ART17.2)
					</xsl:when>
					<xsl:when test="$form_number = 210">
						INTERNATIONAL SEARCH REPORT (ISR)
					</xsl:when>
				</xsl:choose>			
			</title>

			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<style type="text/css">	
				.needTranslation{<!--background-color:yellow; An indicator for translation -->}
				.contentBlock{border-style: solid; border-width: 1px; padding:3px;}
				.contentBlockNoTop{border-style: solid; padding:3px;border-width: 1px;border-top-style:hidden;}
				.contentBlockOnlyTop{border-top-style:solid; padding:3px;border-width: 1px;}
				.contentBlockSectionHeader{color:white;background-color:#1874CD;border-color:black;border-style: solid; padding:3px;border-width: 1px;border-top-style:hidden;}
				.contentBlockSectionHeader2{color:#070546;background-color:#F7F7FA;border-color:black;border-style: solid; 
					padding:3px;border-width: 1px;border-top-style:hidden; border-bottom-style:hidden;}
				.contentBlockTopOnlyNoPaddingNoMargin{border-top-style:solid; padding:0px;margin:0px;border-width: 1px;}
				
			    .reportTitle{margin-top:10px;text-align: center;font-family:Helvetica,Arial,sans-serif;font-size:14pt;font-style:normal;font-weight:bold;text-transform:uppercase;}
				div.footnote{font-size:9pt;font-weight:normal;}				
				.times{font-family:"Times New Roman",Times,serif;}
				.arial{font-family:Arial,Helvetica,sans-serif;}
				.verdana{font-family:verdana;}
				.part{ background-color: #008ACC;
						outline-style:solid; 
						outline-width:1px;	
						padding:2px;
						margin:8px 0px, 0px 0px; 
						font-weight:bold; 
						font-size:12px;
						color:white;
						display: grid;
					    grid-template-columns: 50% 50%;	
					    border-style: solid;	
					    border-color:black;	
					    border-width: 1px;
					    	    
					}
				.part44{color:white;background-color:#1874CD;border-color:black;border-style: solid; padding:3px;border-width: 1px;border-top-style:hidden;}
				
				hr{height:0.5px;}
				h2, h3, h4{margin:3px 3px 3px 0px;}
				
				img.inline { display:inline } 
				img.newline { vertical-align: top }
		
				span{padding:2px;}
				
				.thinDashedBottom {border-bottom-style: dashed; border-bottom-width:1px;}
				.thinDashedRightBottom {border-bottom-style: dashed; border-bottom-width:1px;border-right-style: dashed; border-right-width:1px;}
				
				.thinDoubleBottom {border-bottom-style: double; border-bottom-width:4px;}
				.thinTopDoubleBottom {border-top-style: solid;
									  border-bottom-style: double; 
									  border-top-width:1px;
									  border-bottom-width:4px;}
									  
				.thinBox {border-style: solid; border-width:1px;}
				.thinTop {border-top-style: solid; border-top-width:1px;}
				.thinRight {  border-right-style: solid; border-right-width:1px;}
				.thinBottom {  border-bottom-style: solid; border-bottom-width:1px;}
				.thinLeft {  border-left-style: solid; border-left-width:1px;}
				.thinTopBottom {border-top-style: solid;
									  border-bottom-style: solid; 
									  border-top-width:1px;
									  border-bottom-width:1px;}
				.thintTopRight {border-top-style: solid;
									 border-right-style: solid;
									  border-top-width:1px;
									  border-right-width:1px;}
				
				.thinRightBottom {border-right-style: solid;
									  border-bottom-style: solid; 
									  border-right-width:1px;
									  border-bottom-width:1px;}
			    .thinLeftBottom {border-left-style: solid;
									  border-bottom-style: solid; 
									  border-left-width:1px;
									  border-bottom-width:1px;}
									  
				.thinTopRightBottom {border-top-style: solid;
									 border-right-style: solid;
									  border-bottom-style: solid; 
									  border-top-width:1px;
									  border-right-width:1px;
									  border-bottom-width:1px;}
				
				.thinTopRightDoubleBottom {border-top-style: solid;
										border-right-style: solid;
									  border-bottom-style: double; 
									  border-top-width:1px;
									  border-right-width:1px;
									  border-bottom-width:4px;}
									  
				.borderBottom{border-bottom: 1px solid #000;}
					
				.label {font-weight:normal;padding:1px;}
				.text {font-style:normal;font-weight:bold;padding:1px;}
				.text-hanging-indent {font-style:normal;font-weight:bold;padding:1px;text-indent: -25px;padding-left: 25px;}
				.text-bold-nowrap {white-space:nowrap;font-style:normal;font-weight:bold;padding:1px;}
				.text-bold-underline {font-weight:bold;text-decoration:underline;}
				.text-uppercase {text-transform: uppercase;}
				.text-capitalize {text-transform: capitalize ;}
				.text-big {font-size:11pt;}
				.textAlignMiddleLeft {text-align:left; vertical-align: middle; padding:1px;}
				.textAlignMiddleRight {text-align:right; vertical-align: middle;padding:1px;}
				
				.font-normal-nowrap {white-space:nowrap;font-style:normal;font-weight:normal;padding:1px;}				
				.nowrap{white-space: nowrap}
				
				.hanging-indent {text-indent: -25px;padding-left: 25px;}
				.list-indent {text-indent: -6px; padding-left: 6px;}
				.indent {margin-left: 10px}		
				.indent20 {margin-left: 20px}
				.indent30 {margin-left: 30px}
				.indent40 {margin-left: 40px}
				
				.indent_R {margin-right: 10px}		
				.indent20_R {margin-right: 20px}
				.indent30_R {margin-right: 30px}
				.indent40_R {margin-right: 40px}
								  
				.marginTop{margin-top:6px;}
				.marginBottom{margin-bottom:6px;}
				
				.big-checkbox + label {
				padding: 18px;
				}
				.big-checkbox:checked + label:after {
				font-size: 28px;
				left: 6px;
				}

				div, td, td.div{font-family:verdana;font-size:11pt;}
				
				.hanging-indent {text-indent: -25px;padding-left: 25px;}
									
				.floatTop    {left:0; padding-left-width:1px; position:relative; text-align:left; top:0; width:100%;}
				.floatBottom  {left:0; position:fixed!important; text-align:left; bottom:0; width:100%; 
						background-color:#C0C0C0; opacity:0.95; filter:alpha(opacity=100);}
				.floatMiddle  {right:0; top: 40%; position:fixed !important; text-align:right;width:100%;}	
				
				 .smallCapUpper {font-size: Larger}
    			 .smallCapLower { font-size: Smaller}
				 
				 .icon, symbol {overflow: visible}
				 .icon {height: 1em}
				
				  #hoverShow{
				      display:inline-block;
				      overflow:hidden;
				      height:3px;
				    }
				    
			    #hoverShow:hover{
			      height:auto;           
			    }
				    
				@media screen{
				  	div, body, p, td, td.div{font-family:verdana;font-size:11pt;
				  	word-wrap:break-word;max-width:1300px;}
				  	div.footnote{font-size:9pt;}
				}
			 	
			 	@media print{
				 	body{font-family:verdana;font-size:85%;}
				 	div, td {font-family:verdana;font-size:9pt;
				 	   word-wrap:break-word;max-width:1300px;}
				 	div.newPage {page-break-before: always;}
				 	div.floatTop, div.floatBottom, div.floatMiddle {display:none;}
				 	div.footnote{font-size:9pt;}
				 	
				 	div.onlyprint {
				        position: running(onlyprint); /* Display only on print page (each) */
				        top: 0; /* Because it's header  */
				        
				        font-size:9pt;
				        border-style: solid; border-width: 1px;
				        font-style:italic;
				        width:100%
				    }
				    
				    i{font-family:verdana;}
				    
					size: auto;   /* auto is the initial value */			    
				    margin: 8mm 4mm 6mm 4mm;  /* this affects the margin in the printer settings */ 
				    
				    @top-center { content: element(onlyprint, first-except) }				        
				 }	
				 
				@page{ 
				    size: auto;   /* auto is the initial value */			    
				    margin: 8mm 4mm 6mm 6mm;  /* this affects the margin in the printer settings */ 
				    
				    @top-center { content: element(onlyprint, first-except) }
				    
				    @top-right {content: "HIGHLY CONFIDENTIAL";}				    
				} 				 
			</style>
		</head>
	</xsl:template>
	
	<xsl:template name="doctypeHtml">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;</xsl:text>	
	</xsl:template>
	
	<xsl:template match="/">
		<xsl:call-template name="doctypeHtml" />
		<html xmlns="http://www.w3.org/1999/xhtml" dir="{$textDirection}" lang="{$langOriginal}">
			<xsl:call-template name="htmlHeader" />
			
			<body class="verdana">
				<xsl:if test="$form_number='210' and $addNavigation='true'">			
					<xsl:call-template name="htmlContentTop" />
					<!-- <xsl:call-template name="htmlContentMiddle" /> -->
				</xsl:if>
							
				<xsl:apply-templates />
				
				<xsl:if test="$form_number='210' and $addNavigation='true'">
					<xsl:call-template name="htmlContentBottom" />	
				</xsl:if>
			</body>
			<br/>
		 </html>
	</xsl:template>
	
	<xsl:template name="htmlContentTop">	    
		<div class="floatTop">		
			<xsl:call-template name="htmlContentLinks"/>	
		</div>	
	</xsl:template>
	
	<xsl:template name="htmlContentLinks">
		<a href="#pt1"><b>Part 1:</b></a><xsl:call-template name="spaces"/>
		<a href="#pt1-1">1</a><xsl:call-template name="spaces"/>
		<a href="#pt1-2">2</a><xsl:call-template name="spaces"/>
		<a href="#pt1-3">3</a><xsl:call-template name="spaces"/>
		<a href="#pt1-4">4</a><xsl:call-template name="spaces"/>
		<a href="#pt1-5">5</a><xsl:call-template name="spaces"/>
		<a href="#pt1-6">6</a><xsl:call-template name="spaces"/>
		
		<xsl:call-template name="tab"/><xsl:call-template name="tab"/>
		<a href="#pt2"><b>Part 2:</b></a><xsl:call-template name="spaces"/>
		<a href="#pt2-A">A</a><xsl:call-template name="spaces"/>
		<a href="#pt2-B">B</a><xsl:call-template name="spaces"/>
		<a href="#pt2-C">C</a><xsl:call-template name="spaces"/>
		<a href="#pt2-D">D</a><xsl:call-template name="spaces"/>
		<a href="#pt2-E">E</a><xsl:call-template name="spaces"/>	
	</xsl:template>
	
	<xsl:template name="htmlContentMiddle">
		<div class="floatMiddle">
			<a href="#" title="Return to top">
				<marquee align="middle" direction="up" width="1%" height="50" 
					border="0" scrollamount="1" scrolldelay="1"
					style="font-family:Arial; font-size: 12pt; color: #0000ff;  background-color: #C0C0C0;
					opacity:0.7; filter:alpha(opacity=100); zoom: 1;"
					title="Return to top">
					<xsl:value-of select="$upTrangleSolid"/>
					<!-- <xsl:value-of select="$upArrow"/> -->
				</marquee>
			</a>
		</div>
	</xsl:template>
	
	<xsl:template name="htmlContentBottom">
		<div class="floatBottom" id="hoverShow">
			<table width="100%" border="0" cellpadding="0">
				<tr>
					<td>
						<a href="#top" title="Return to top"><b>Top</b></a><xsl:call-template name="tab"/>
						<xsl:call-template name="htmlContentLinks"/>
					</td>
					<td align="right">
						<a href="#top" title="Return to top">
						<font style="font-family:Arial; font-size: 14pt; color: #0000ff;  background-color: #C0C0C0;">
						<xsl:value-of select="$upTrangleSolid"/>
						</font>
						</a>
					</td>
				</tr>
			</table>
		</div>	
	</xsl:template>
	
	<xsl:template name="ReportTitle">		
	   <a name="top">
		<div class="reportTitle">
			<div style="font-size:large">			
			<xsl:apply-templates select="$common_table/label[@name ='PatentCooperationTreaty']"/>			
			</div>
			
			<div style="font-size:x-large;font-family:Times;">
			<xsl:apply-templates select="$common_table/label[@name ='PCT']"/>
			</div>
			
			<div style="font-size:large">			
			  	<xsl:if test="$form_number='203'">
		  			<xsl:attribute name="style">font-size:middle</xsl:attribute>
		  		</xsl:if>
  		
				<!-- INTERNATIONAL SEARCH REPORT (ISR)  -->
				<xsl:apply-templates select="$form_table/label[@name = concat($authority_type, $form_number, 'FormTitle')]"/>
			</div>
		</div>
		  <div style="text-align:center">
				<xsl:if test="($form_table/label[@name = concat($authority_type, $form_number, 'RelevantProvision')]) != ''">
					<xsl:if test="not($lang='ja')" >
						<xsl:apply-templates select="$common_table/label[@name = 'MarkLeftBracket']"/>
					</xsl:if>
					<span><xsl:apply-templates select="$form_table/label[@name = concat($authority_type, $form_number, 'RelevantProvision')]"/></span>
					<xsl:if test="not($lang='ja')" >
						<xsl:apply-templates select="$common_table/label[@name = 'MarkRightBracket']"/>
					</xsl:if>
				</xsl:if>
			</div>
		</a>
				
	</xsl:template>
		
		
	<xsl:template name="ReportHeaderPart">
		<xsl:param name="partNum" select="'1'" />
		
		<xsl:if test="$form_number='210'">
			<xsl:variable name="textAlignLeft">
				<xsl:choose>
					<xsl:when test="$lang='ar'">textAlignMiddleRight</xsl:when>
					<xsl:otherwise>textAlignMiddleLeft</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
		
			<xsl:variable name="textAlignRight">
				<xsl:choose>
					<xsl:when test="$lang='ar'">textAlignMiddleLeft</xsl:when>
					<xsl:otherwise>textAlignMiddleRight</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<div class="part">
				<div class="{$textAlignLeft}"><i><a name="pt{$partNum}">PART <xsl:value-of select="$partNum" /> </a></i></div>
				<div class="{$textAlignRight}"><i><xsl:call-template name="PctIaNumber" /></i></div>			
			</div>
		
		</xsl:if>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////// -->
	<!-- 
		INTERNATIONAL SEARCH REPORT (ISR) - PART 1	
	 -->
	<xsl:template match="search-report">
		<div class="marginBottom">
			<xsl:call-template name="ReportTitle" />
		</div>
		
		<xsl:apply-templates/>
	</xsl:template>

	<!-- 
		========================================
		doc-page (child of many elements)
		========================================
 	-->	
	<xsl:template match="doc-page">
		<xsl:call-template name="openDIVwithNodePath" />
			<xsl:apply-templates />
		<xsl:call-template name="closeDIV" />		
	</xsl:template>
	
	<!-- 
		=============================
		srep-info
		=============================
 	-->	
	<xsl:template match="srep-info">
		<!-- IA Info -->	
		<div class="contentBlock marginTop">
			<xsl:choose>
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web'))">
					<xsl:call-template name="IAInfo_AR" /> 
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="IAInfo" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
		
		<!-- ForFurtherAction -->
		<div class="footnote marginBottom">
			<xsl:if test="$form_number='210'"> <!-- FORM210 -->
				<xsl:call-template name="AddItalicFontStyleForLatinLang" />
				<b><xsl:value-of select="translate($common_table/label[@name ='ForFurtherAction'], $smallcase,$uppercase)"/>: </b>
				<xsl:value-of select="' '" />
				<xsl:value-of select="concat(translate(substring($form_table/label[@name ='ISA210Text01'],1,1), $smallcase, $uppercase),substring($form_table/label[@name ='ISA210Text01'], 2))"/>
				<xsl:value-of select="'  '" />
				<xsl:value-of select="$form_table/label[@name ='ISA210Text02']"/>
			</xsl:if>
			
			<xsl:if test="$form_number='203'"> <!-- FORM203 -->
				<div class="contentBlock marginTop" style="background-color:#F7F7FA;border-bottom-style:solid;text-align:center;">
					<b><xsl:value-of select="translate($common_table/label[@name ='ImportantDeclaration'], $smallcase,$uppercase)"/> </b>
				</div>
			</xsl:if>
		</div>
		
		<!-- FORM 210 if established -->
		<xsl:if test="$form_number='210'">	
			<xsl:call-template name="ReportHeaderPart">
				<xsl:with-param name="partNum" select="'1'"/>
			</xsl:call-template>
			
			<div class="contentBlock">	
				<xsl:call-template name="AppInfo_AddOn" />
			</div>
			
			<!--  1.	Basis of the report  -->
			<xsl:call-template name="BoxSectionHeader">
				<xsl:with-param name="anchorName" select="'pt1-1'"/>
				<xsl:with-param name="boxNo" select="'1.'"/>
				<xsl:with-param name="title" select="$common_table/label[@name ='BasisOfTheReport']"/>
				<xsl:with-param name="childName" select="'srep-basis'"/>
			</xsl:call-template>
			
			<div class="contentBlockNoTop">	
				<xsl:call-template name="BasisOfTheReport" />
			</div>
			
			<!--  2.	Certain claims were found unsearchable -->	
			<xsl:call-template name="BoxSectionHeader"> <!-- //srep-claims-info -->
				<xsl:with-param name="anchorName" select="'pt1-2'"/>
				<xsl:with-param name="boxNo" select="'2.'"/>
				<xsl:with-param name="title">
					<xsl:choose>
						<xsl:when test="not($form_table/label[@name ='ISA210Text12-UsedInFT']='')">
							<xsl:value-of select="$form_table/label[@name ='ISA210Text12-UsedInFT']" />
						</xsl:when>
						<xsl:otherwise>Certain claims were found unsearchable</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="checkBoxType">
					<xsl:choose>
						<xsl:when test="//srep-claims-info/srep-claims-not-searched">CHECKED</xsl:when>
						<xsl:otherwise>UNCHECKED</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="childName" select="'srep-claims-info'"/>
			</xsl:call-template> 
			
			<div class="contentBlockNoTop">
				<div class="indent20">
					<xsl:call-template name="ClaimsInfo" />
				</div>
			</div>

			<!--  3.	Unity of invention is lacking  -->	
			<xsl:call-template name="BoxSectionHeader"> <!--  //srep-unity-of-invention -->
				<xsl:with-param name="anchorName" select="'pt1-3'"/>
				<xsl:with-param name="boxNo" select="'3.'"/>
				<xsl:with-param name="title">
					<xsl:choose>
						<xsl:when test="not($form_table/label[@name ='ISA210Text13-UsedInFT']='')">
							<xsl:value-of select="$form_table/label[@name ='ISA210Text13-UsedInFT']" />
						</xsl:when>
						<xsl:otherwise>Unity of invention is lacking</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="checkBoxType">
					<xsl:choose>
						<xsl:when test="//srep-unity-of-invention">CHECKED</xsl:when>
						<xsl:otherwise>UNCHECKED</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="childName" select="'srep-unity-of-invention'"/>
			</xsl:call-template> 
			
			<div class="contentBlockNoTop">
				<div class="indent20">
					<xsl:call-template name="UnityOfInvention" />
				</div>
			</div>
					
			<!--  4.	Title of the invention  -->	
			<xsl:call-template name="BoxSectionHeader"> <!-- //srep-info/srep-invention-title -->
				<xsl:with-param name="anchorName" select="'pt1-4'"/>
				<xsl:with-param name="boxNo" select="'4.'"/>
				<xsl:with-param name="title">
					<xsl:choose>
						<xsl:when test="not($form_table/label[@name ='ISA210TitleOfTheInvention-UsedInFT']='')">
							<xsl:value-of select="$form_table/label[@name ='ISA210TitleOfTheInvention-UsedInFT']" />
						</xsl:when>
						<xsl:otherwise>Title of Invention</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="childName" select="'srep-invention-title'"/>
			</xsl:call-template> 
			
			<div class="contentBlockNoTop">
				<div class="indent20">
					<xsl:call-template name="InventionTitle" />
				</div>
			</div>
			
			<!--  5.	Abstract  -->
			<xsl:call-template name="BoxSectionHeader">
				<xsl:with-param name="anchorName" select="'pt1-5'"/>
				<xsl:with-param name="boxNo" select="'5.'"/>
				<xsl:with-param name="title">
					<xsl:choose>
						<xsl:when test="not($form_table/label[@name ='ISA210Abstract-UsedInFT']='')">
							<xsl:value-of select="$form_table/label[@name ='ISA210Abstract-UsedInFT']" />
						</xsl:when>
						<xsl:otherwise>Abstract</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="childName" select="'srep-abstract'"/>
			</xsl:call-template> 
			
			<div class="contentBlockNoTop">
				<div class="indent20">
					<xsl:call-template name="Abstract" />
				</div>
			</div>				
								
			<!--  6.	 Drawings  -->	
			<xsl:call-template name="BoxSectionHeader"> <!--  srep-info/srep-figure-to-publish -->
				<xsl:with-param name="anchorName" select="'pt1-6'"/>
				<xsl:with-param name="boxNo" select="'6.'"/>
				<xsl:with-param name="title">
					<xsl:choose>
						<xsl:when test="not($form_table/label[@name ='ISA210Abstract-UsedInFT']='')">
							<xsl:call-template name="capitalize-first-letter">
								<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Drawings-UsedInFT']" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>Drawings</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="childName" select="'srep-figure-to-publish'"/>
			</xsl:call-template> 
			
			<div class="contentBlockNoTop">
				<div class="indent20">
					<xsl:call-template name="FigureToPublish" />
				</div>
			</div>				
		</xsl:if>
		
		<!-- FORM 203 if not established -->
		<xsl:if test="$form_number='203'">
			<xsl:choose>
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web') )">
					<xsl:call-template name="Form203_AR"/> <!-- This "_AR" is only needed for editor. -->
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="Form203"/>
				</xsl:otherwise>
			</xsl:choose>
			
		</xsl:if>
		

	</xsl:template>

	<xsl:template name="IAInfo">
		<xsl:variable name="thinBorderLine">
			<xsl:choose>
				<xsl:when test="$lang='ar'">thinLeft</xsl:when>
				<xsl:otherwise>thinRight</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<table width="100%" border="0" cellspacing="0" style="margin:0px; cellpadding:0px;">
			<tr>
				<td width="55%" class="label {$thinBorderLine} nowrap" >
					<span><xsl:apply-templates select="$common_table/label[@name ='InternationalApplicationNo']"/></span>
				</td>
				<td class="label nowrap">
					<span><xsl:apply-templates select="$common_table/label[@name ='ApplicantOrAgentFileReference']"/></span>
				</td>
			</tr>			
			
			<tr>
				<td class="thinBottom {$thinBorderLine} nowrap">
					<span class="indent20 text-bold-nowrap">

					<xsl:apply-templates select="//application-reference/document-id">
						<xsl:with-param name="isIaNumber" select="'true'"></xsl:with-param>
						<xsl:with-param name="addDIV" select="'false'"></xsl:with-param>
						<xsl:with-param name="isBold" select="'true'"></xsl:with-param>
						<xsl:with-param name="addUrl" select="'true'" />
					</xsl:apply-templates>
					
					</span>
				</td>
				<td class="thinBottom nowrap">
					<span class="indent20"><xsl:apply-templates select="//file-reference-id" /></span>
				</td>
			</tr>
		</table>
		
		<table width="100%" border="0" cellspacing="0" style="margin:0px;cellpadding:0px;">
			<tr>
				<td width="40%" class="label {$thinBorderLine} nowrap">
					<xsl:apply-templates select="$common_table/label[@name ='InternationalFilingDate']"/>
					<xsl:value-of select="$spaceNbsp" />
					<xsl:apply-templates select="$common_table/label[@name ='DateFormat']"/>					
				</td>
				<td class="label nowrap">
					<xsl:apply-templates select="$common_table/label[@name ='EarliestPriorityDate']"/>
					<xsl:value-of select="$spaceNbsp" />
					<xsl:apply-templates select="$common_table/label[@name ='DateFormat']"/>
				</td>	
				
				<xsl:if test="$form_number='203'">			
	 				<td width="30%" class="label thinLeft nowrap">
						<xsl:apply-templates select="$common_table/label[@name ='DateOfMailing']"/>
						<xsl:value-of select="$spaceNbsp" />
						<xsl:apply-templates select="$common_table/label[@name ='DateFormat']"/>
					</td>
				</xsl:if>
			</tr>
			<tr>
				<td width="40%" class="thinBottom {$thinBorderLine} nowrap">
					<span class="indent20"/>
					
					<xsl:choose>
						<xsl:when test="//application-reference/document-id/date">
							<xsl:apply-templates select="//application-reference/document-id/date">
								<xsl:with-param name="divClass" select="'text-bold-nowrap'" />
								<xsl:with-param name="id" select="'appRefDocIdDate'"/>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="openDIVwithNodePathInline">
								<xsl:with-param name="childName" select="'application-reference/document-id/date'"/>
								<xsl:with-param name="id" select="'appRefDocIdDate'"/>
							</xsl:call-template>
							
							<xsl:call-template name="closeDIV" />
						</xsl:otherwise>
					</xsl:choose>					
				</td>
				<td class="thinBottom nowrap">
					<xsl:choose>
						<xsl:when test="//date-of-earliest-priority/date">
							<span class="indent20 text-bold-nowrap">
							<xsl:apply-templates select="//date-of-earliest-priority/date">
								<xsl:with-param name="divClass" select="'text-bold-nowrap'" />
							</xsl:apply-templates>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="openDIVwithNodePathInline">
								<xsl:with-param name="childName" select="'date-of-earliest-priority/date'"/>
								<xsl:with-param name="id" select="'priorityDate'"/>
							</xsl:call-template>
							
							<xsl:call-template name="closeDIV" />
						</xsl:otherwise>
					</xsl:choose>
				</td>				

				<xsl:if test="$form_number='203'">
					<td width="30%" class="thinBottom thinLeft nowrap">
						<xsl:choose>
							<xsl:when test="//srep-for-pub/srep-admin/date-search-report-mailed/date | //srep-info/srep-info-admin/date-search-report-mailed">
								<span class="indent20 text-bold-nowrap">
									<xsl:call-template name="getMailingDate" />
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="openDIVwithNodePathInline">
									<xsl:with-param name="childName" select="'srep-for-pub/srep-admin/date-search-report-mailed/date'"/>
									<xsl:with-param name="id" select="'reportMailingDate'"/>
								</xsl:call-template>
								
								<xsl:call-template name="closeDIV" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</xsl:if>
			</tr>
		</table>
		
		<xsl:if test="not($form_number='210')">		
			<div class="thinBottom">
				<div><span class="nowrap"><xsl:apply-templates select="$common_table/label[@name ='InternationalPatentClassificationOrBothNationalClassificationAndIPC']"/></span></div>
				<div class="indent20"><xsl:call-template name="IPCInfo"/></div>
			</div>
		</xsl:if>
		
		<table width="100%" border="0" cellspacing="0" style="margin:0px;cellpadding:0px;">
			<tr height="30">
			  <td valign="top" width="10%" class="nowrap"><span class="label"><xsl:apply-templates select="$common_table/label[@name ='Applicant']"/></span></td>				
			  <td valign="middle">
				<div class="indent20 text-bold-nowrap"><xsl:apply-templates select="//applicant-name" /></div>
			  </td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="IAInfo_AR"> <!-- This "_AR" is only needed for editor. -->
		<table width="100%" border="0" cellspacing="0" style="margin:0px; cellpadding:0px;" >
			<tr align="right">
				<td class="label nowrap">
					<xsl:apply-templates select="$common_table/label[@name ='ApplicantOrAgentFileReference']"/>
				</td>
				<td width="55%" class="label nowrap" >
					<xsl:apply-templates select="$common_table/label[@name ='InternationalApplicationNo']"/>
				</td>
			</tr>			
			
			<tr align="right">
				<td class="thinBottom nowrap">
					<span class="indent20"><xsl:apply-templates select="//file-reference-id" /></span>
				</td>
				<td class="thinBottom nowrap">
					<span class="indent20 text-bold-nowrap">

					<xsl:apply-templates select="//application-reference/document-id">
						<xsl:with-param name="isIaNumber" select="'true'"></xsl:with-param>
						<xsl:with-param name="addDIV" select="'false'"></xsl:with-param>
						<xsl:with-param name="isBold" select="'true'"></xsl:with-param>
						<xsl:with-param name="addUrl" select="'true'" />
					</xsl:apply-templates>
					
					</span>
				</td>
			</tr>
		</table>
		
		<table width="100%" border="0" cellspacing="0" style="margin:0px;cellpadding:0px;">
			<tr align="right">
				<xsl:if test="$form_number='203'">
					<td width="30%" class="label nowrap">
						<span><xsl:apply-templates select="$common_table/label[@name ='DateOfMailing']"/></span>
					</td>
				</xsl:if>
				<td class="label thinRight nowrap">
					<span><xsl:apply-templates select="$common_table/label[@name ='PriorityDate']"/></span>
				</td>	
				<td width="40%" class="label thinRight nowrap">
					<span><xsl:apply-templates select="$common_table/label[@name ='InternationalFilingDate']"/></span>
				</td>
			</tr>
			<tr align="right">
				<xsl:if test="$form_number='203'">
					<td width="30%" class="thinBottom nowrap">
						<xsl:choose>
							<xsl:when test="srep-for-pub/srep-admin/date-search-report-mailed/date | //srep-info/srep-info-admin/date-search-report-mailed">
								<span class="indent20 text-bold-nowrap">
									<xsl:call-template name="getMailingDate" />
								</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="openDIVwithNodePathInline">
									<xsl:with-param name="childName" select="'srep-for-pub/srep-admin/date-search-report-mailed/date'"/>
									<xsl:with-param name="id" select="'reportMailingDate'"/>
								</xsl:call-template>
								
								<xsl:call-template name="closeDIV" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</xsl:if>
				<td class="thinRightBottom nowrap">
					<xsl:choose>
						<xsl:when test="//date-of-earliest-priority/date">
							<span class="indent20 text-bold-nowrap">
							<xsl:apply-templates select="//date-of-earliest-priority/date">
								<xsl:with-param name="divClass" select="'text-bold-nowrap'" />
							</xsl:apply-templates>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="openDIVwithNodePathInline">
								<xsl:with-param name="childName" select="'date-of-earliest-priority/date'"/>
								<xsl:with-param name="id" select="'priorityDate'"/>
							</xsl:call-template>
							
							<xsl:call-template name="closeDIV" />
						</xsl:otherwise>
					</xsl:choose>
				</td>	
				<td width="40%" class="thinRightBottom nowrap">
					<span class="indent20"/>
					
					<xsl:choose>
						<xsl:when test="//application-reference/document-id/date">
							<xsl:apply-templates select="//application-reference/document-id/date">
								<xsl:with-param name="divClass" select="'text-bold-nowrap'" />
								<xsl:with-param name="id" select="'appRefDocIdDate'"/>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="openDIVwithNodePathInline">
								<xsl:with-param name="childName" select="'application-reference/document-id/date'"/>
								<xsl:with-param name="id" select="'appRefDocIdDate'"/>
							</xsl:call-template>
							
							<xsl:call-template name="closeDIV" />
						</xsl:otherwise>
					</xsl:choose>					
				</td>
			</tr>
		</table>
		
		<xsl:if test="not($form_number='210')">		
			<div class="thinBottom">
				<div><span class="nowrap"><xsl:apply-templates select="$common_table/label[@name ='InternationalPatentClassificationOrBothNationalClassificationAndIPC']"/></span></div>
				<div class="indent20"><xsl:call-template name="IPCInfo"/></div>
			</div>
		</xsl:if>
		
		<table width="100%" border="0" cellspacing="0" style="margin:0px;cellpadding:0px;">
			<tr height="30" align="right">
			  <td valign="middle">
				<div class="indent20 text-bold-nowrap"><xsl:apply-templates select="//applicant-name" /></div>
			  </td>
			  <td valign="top" width="10%" class="nowrap"><span class="label"><xsl:apply-templates select="$common_table/label[@name ='Applicant']"/></span></td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="AppInfo_AddOn">		
		<xsl:if test="$form_number='210'">		
			<xsl:choose>
				<xsl:when test="/search-report/srep-info/srep-established">
					<xsl:apply-templates select="/search-report/srep-info/srep-established"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="IntroTextISA210"/>
				</xsl:otherwise>
			</xsl:choose>					
			
			<div class="indent40 marginTop">
				<xsl:apply-templates select="/search-report/srep-info/srep-prior-art-docs"/>				
			</div>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="BoxSectionHeader">
		<xsl:param name="anchorName" select="''"/>
		<xsl:param name="boxNo" select="''"/>
		<xsl:param name="title" select="''"/>
		<xsl:param name="cssSectionHeader" select="'contentBlockSectionHeader2'"/>
		<xsl:param name="checkBoxType" select="''"/>
		<xsl:param name="paddingForTitle" select="'2'"/>
		<xsl:param name="titleBold" select="'true'"/>
		<xsl:param name="childName" select="''"/>	
		
	   <div class="{$cssSectionHeader}">	
 			<table cellpadding="0">
 				<tr valign="top">
 					<td class="nowrap">
 						<xsl:choose>
							<xsl:when test="boolean(string-length($anchorName) &gt;0)">
								<a name="{$anchorName}"><b><xsl:value-of select="$boxNo"/></b></a>
							</xsl:when>
							<xsl:when test="boolean(string-length($boxNo) &gt;0)">
								<b><xsl:value-of select="$boxNo"/></b>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''"/>
							</xsl:otherwise>
						</xsl:choose>				
 					</td>
 					<td valign="top" style="padding-left:{$paddingForTitle}px;">
 						<xsl:if test="string-length($childName) &gt; 0"> 
 							<xsl:call-template name="openDIVwithNodePath">
								<xsl:with-param name="childName" select="$childName"/>
							</xsl:call-template>
 						</xsl:if>
 						
 						<xsl:choose>
							<xsl:when test="$checkBoxType='CHECKED'">
								<xsl:call-template name="CheckBox_Checked"/>
							</xsl:when>
							<xsl:when test="$checkBoxType='UNCHECKED'">
								<xsl:call-template name="CheckBox_Unchecked"/>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>	
 						<span style="vertical-align:top;">
 							<xsl:choose>
								<xsl:when test="$titleBold='true'">
									<b><xsl:value-of select="$title"/></b>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$title"/>
								</xsl:otherwise>
							</xsl:choose>	
 						</span>
 						
 						<xsl:if test="string-length($childName) &gt; 0"> 
 							<xsl:call-template name="closeDIV" />
 						</xsl:if>
 					</td>
	   			</tr>
	   		</table>
	   </div>
	</xsl:template>
	
	<xsl:template match="file-reference-id">
		<!--<xsl:call-template name="getCurrentNodeInDIV" />-->
		 
		<xsl:call-template name="openDIVwithNodePath" />
			<span class="text-bold-nowrap"><xsl:value-of select="." /></span>
		<xsl:call-template name="closeDIV" /> 
	</xsl:template>

	<xsl:template match="/search-report/srep-info/application-reference">
		<xsl:call-template name="getCurrentNodeInDIV" />
	</xsl:template>

	<xsl:template match="/search-report/srep-info/date-of-earliest-priority">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="/search-report/srep-info/date-of-earliest-priority/date 
			| /search-report/srep-info/application-reference/document-id/date
			| document-id/date
			| date-opinion-completed
			| date-search-completed
			| date-search-report-mailed">
		
		<xsl:param name="divClass" />
		<xsl:param name="id" select="''"/>
		
		<xsl:variable name="dateFormatted">
			<xsl:choose>
				<xsl:when test="string-length(.)!=0">
					<xsl:call-template name="format_date_dd_Month_yyyy">
						<xsl:with-param name="date" select="." />
						<xsl:with-param name="lang" select="$lang" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="disableEditingDate" select="name(../..)='priority-application' or name(../..)='family-member'" />
		
		<xsl:choose>
			<xsl:when test="not($media = 'web')">
				<xsl:if test="not($disableEditingDate)">		
					<xsl:call-template name="openDIVwithNodePath">
						<xsl:with-param name="divClass" select="$divClass"/>
						<xsl:with-param name="id" select="$id"/>
					</xsl:call-template>
				</xsl:if>

				<xsl:value-of select="$dateFormatted"/>
				
				<xsl:if test="not($disableEditingDate)">
					<xsl:call-template name="closeDIV" />
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<span>
				<xsl:attribute name="class"><xsl:value-of select="$divClass"/></xsl:attribute>
				<xsl:value-of select="$dateFormatted"/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="applicant-name">
		<xsl:call-template name="openDIVwithNodePath" />
			<span class="text">	<xsl:apply-templates/> </span>
		<xsl:call-template name="closeDIV"/>
	</xsl:template>
	
   <xsl:template match="srep-established">
   		<xsl:call-template name="openDIVwithNodePath">
   			<xsl:with-param name="attrName" select="'srep-established'" />
   		</xsl:call-template>

		<xsl:choose>
			<xsl:when test="$form_number = '203'">
				<xsl:apply-templates select="$form_table/label[@name ='ISA203Text01']"/>
			</xsl:when>
			<xsl:when test="$form_number = '210'">
				<xsl:call-template name="IntroTextISA210"/>
			</xsl:when>
		</xsl:choose>
		
   		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<xsl:template name="IntroTextISA210">
		<xsl:if test="$form_number='210'">
			<xsl:value-of select="$form_table/label[@name ='ISA210Text03']"/>
			<xsl:apply-templates select="$form_table/label[@name ='ISA220Text03']"/>
		</xsl:if>
	</xsl:template>
	
	<!-- srep-prior-art-docs
		<xsd:complexType>
			<xsd:choice minOccurs = "0" maxOccurs = "unbounded">
				<xsd:element ref = "doc-page"/>
				<xsd:element ref = "prior-art-xml-doc"/>
			</xsd:choice>
			<xsd:attribute name = "prior-art" use = "required">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:NMTOKEN">
						<xsd:enumeration value = "yes"/>
						<xsd:enumeration value = "no"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
		</xsd:complexType>
	 -->
	<xsl:template match="srep-prior-art-docs">					
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="attrName" select="'prior-art'" />
		</xsl:call-template>
		<xsl:call-template name="BoxToCheck">
			<xsl:with-param name="check_condition" select="boolean(//srep-info/srep-prior-art-docs[@prior-art = 'yes'])" />
		</xsl:call-template>	
		<xsl:apply-templates select="$form_table/label[@name ='ISA210Text05']"/>
				
		<xsl:call-template name="closeDIV" />
	</xsl:template>	
	
	<!-- prior-art-xml-doc
		<xsd:complexType>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "file" use = "required" type = "xsd:string"/>
			<xsd:attribute name = "lang" type = "xsd:string"/>
			<xsd:attribute name = "carriers">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:NMTOKEN">
						<xsd:enumeration value = "internal-electronic"/>
						<xsd:enumeration value = "external-electronic"/>
						<xsd:enumeration value = "paper"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
			<xsd:attribute name = "status" type = "xsd:string"/>
		</xsd:complexType>
	 -->
	<xsl:template match="prior-art-xml-doc">
		<div>
			<xsl:call-template name="tab"/>
			<table>
				<xsl:variable name="lbFile" select="$common_table/label[@name ='file']"/>
				<tr><td align="right"><i><xsl:value-of select="concat(translate(substring($lbFile,1,1), $smallcase, $uppercase),substring($lbFile, 2))"/> </i></td><td align="left"><xsl:value-of select="@file" /></td></tr>
				<tr><td align="right"><i>Language: </i></td><td align="left"><xsl:value-of select="@lang" /></td></tr>
				<tr><td align="right"><i>Format: </i></td><td align="left"><xsl:value-of select="@carriers" /></td></tr>
				<tr><td align="right"><i>Status: </i></td><td align="left"><xsl:value-of select="@status" /></td></tr>
			</table>		
		</div>		
	</xsl:template>
	
	<xsl:template name="PctIaNumber">
		<xsl:apply-templates select="/search-report/srep-info/application-reference/document-id">
			<xsl:with-param name="isIaNumber" select="'true'"></xsl:with-param>
			<xsl:with-param name="addDIV" select="'false'"></xsl:with-param> <!--  no editing for IA number -->
		</xsl:apply-templates>
	</xsl:template>

	<!--
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "country"/>
				<xsd:element ref = "doc-number"/>
				<xsd:element ref = "kind" minOccurs = "0"/>
				<xsd:element ref = "name" minOccurs = "0"/>
				<xsd:element ref = "date" minOccurs = "0"/>
			</xsd:sequence>
			<xsd:attribute name = "lang" type = "xsd:string"/>
		</xsd:complexType>
	 -->
	 <!-- may consider use Mode if too much difference in formating ia number or document -->
	<xsl:template match="document-id"> 
		<xsl:param name="isIaNumber" select="'false'" />
		<xsl:param name="isBold" select="'false'" />
		<xsl:param name="simple" select="'false'" />
		<xsl:param name="addDIV" select="'true'" />
		<xsl:param name="addNum" select="'false'" />
		<xsl:param name="countryBold" select="'true'" />
		<xsl:param name="withDate" select="'true'"/>
		<xsl:param name="addUrl" select="'true'"/>

		<xsl:if test="$addDIV='true'">
			<xsl:call-template name="openDIVwithNodePath" />
		</xsl:if>
		
		<xsl:if test="$isBold='true'">
			<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
		</xsl:if>
		
		<xsl:if test="$addNum='true'">
			<xsl:if test="name(..)='family-member'">
				<xsl:value-of select="'['" />
		    		<xsl:value-of select="count(parent::*/preceding-sibling::family-member) + 1"/>       
				<xsl:value-of select="']'" />
				<xsl:value-of select="$spaceNbsp" />
			</xsl:if>
		</xsl:if>
		 
		<xsl:variable name="countryUpper" select="translate(./country, $smallcase, $uppercase)" />		
		<xsl:variable name="docNum" select="normalize-space(translate(./doc-number, ./country, ''))" />
		<xsl:variable name="date" select="normalize-space(./date)" />
		<xsl:variable name="kind" select="normalize-space(./kind)" />
		
		<xsl:variable name="docNumFormatted">
			<xsl:call-template name="FormatIANumber">
				<xsl:with-param name="document_id" select="."/>
			</xsl:call-template>			
		</xsl:variable>			
		
		<xsl:choose>
			<xsl:when test="$addUrl = 'true'"> <!-- use readyToAddUrl ? -->
				<xsl:call-template name="getHyperlinkedDocNumber">
			    	<xsl:with-param name="countryUpper" select="$countryUpper"/>
			    	<xsl:with-param name="docNum" select="$docNum"/>
			    	<xsl:with-param name="existingUrl">
			    		<xsl:choose>
							<xsl:when test="parent::patcit/@url">
								<xsl:value-of select="parent::patcit/@url" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''"/>
							</xsl:otherwise>
						</xsl:choose>
			    	</xsl:with-param>
			    	<xsl:with-param name="docNumFormatted" select="$docNumFormatted" />
			    	<xsl:with-param name="isIaNumber" select="$isIaNumber" />
			    	<xsl:with-param name="countryBold" select="'false'" />
			    	<xsl:with-param name="date" select="normalize-space(./date)" />
			    	<xsl:with-param name="kind" select="$kind"/>
    		   </xsl:call-template>  
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$isIaNumber='true'">
						<xsl:value-of select="$countryUpper" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="$countryBold='true'">
							<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
						</xsl:if>
						<xsl:value-of select="$countryUpper" />
						<xsl:if test="$countryBold='true'">
							<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
						</xsl:if>
						<xsl:value-of select="$spaceNbsp" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$docNumFormatted" />
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="(./kind) and not(''=normalize-space(./kind))">
			<xsl:value-of select="$spaceNbsp" />
			<i><xsl:value-of select="translate(./kind, $smallcase, $uppercase)" /></i>
		</xsl:if>

		<xsl:if test="(./name) and not(''=normalize-space(./name))">
			<xsl:value-of select="$spaceNbsp" />
			<span > <!-- class="{$varNeedTranslation}" NOTE: FOR NOW REMOVE THIS FOR TRANSLATION -->
				<xsl:choose>
					<xsl:when test="starts-with(name,'(')">
						<xsl:value-of select="translate(normalize-space(name), $smallcase, $uppercase)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>(</xsl:text>
						<xsl:value-of select="translate(normalize-space(name),$smallcase,$uppercase)"></xsl:value-of>
						<xsl:text>)</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</span>
		</xsl:if>

		<xsl:if test="$withDate='true' and not($isIaNumber='true') and (.//date) and not(''=normalize-space(.//date))">
			<xsl:value-of select="$spaceNbsp" />
			<xsl:variable name="theDate" select=".//date" />			
			
			<xsl:call-template name="format_date_dd_Month_yyyy">
				<xsl:with-param name="date" select="$theDate" />
				<xsl:with-param name="lang" select="$lang" />
			</xsl:call-template>				
				
			<xsl:text> (</xsl:text>
			<xsl:call-template name="FormatDateISO8601">
				<xsl:with-param name="date" select="normalize-space($theDate)"/>
			</xsl:call-template>
			<xsl:text>)</xsl:text>
		</xsl:if>

		<xsl:if test="$isBold='true'">
			<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
		</xsl:if>

		<xsl:if test="$addDIV='true'">
			<xsl:call-template name="closeDIV" />
		</xsl:if>
	</xsl:template>

    <xsl:template name="getHyperlinkedDocNumber">
    	<xsl:param name="countryUpper" />
    	<xsl:param name="docNum" />
    	<xsl:param name="existingUrl" select="''" />
    	<xsl:param name="docNumFormatted" select="''" />
    	<xsl:param name="isIaNumber" select="'false'" />
    	<xsl:param name="countryBold" select="'false'" />
    	<xsl:param name="date" />
    	<xsl:param name="kind" />
    	
   		<xsl:variable name="docNumForUrlCleaned" >
			<xsl:call-template name="getCleanedDocNumberForUrl">                        
				<xsl:with-param name="docNumer">
					<xsl:choose>
						<xsl:when test="$isIaNumber='true'">
							<xsl:value-of select="translate($docNumFormatted, '/', '')" />
						</xsl:when>
						<xsl:when test="string-length(translate($countryUpper, ' ' , ''))=0"> <!-- country file is empty -->
							<xsl:choose>
								<xsl:when test="starts-with($docNum, 'KR')"> <!-- e.g. KR 10-1063568 B1 -->
									<xsl:variable name="docNumKR">
										<xsl:choose>
											<xsl:when test="contains($docNum, 'B')">
												<xsl:value-of select="substring-before($docNum, 'B')" />
											</xsl:when>
											<xsl:when test="contains($docNum, 'A')">
												<xsl:value-of select="substring-before($docNum, 'A')" />
											</xsl:when>
											<xsl:when test="contains($docNum, 'Y')">
												<xsl:value-of select="substring-before($docNum, 'Y')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$docNum" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:call-template name="format-right-padding">
							    		<xsl:with-param name="curString" select="translate($docNumKR,'- ', '')"/> <!--  remove hyphons and spaces -->
										<xsl:with-param name="charForPadding" select="'0'"/>
										<xsl:with-param name="maxLen" select="'15'"/>
							   		</xsl:call-template>	
								</xsl:when>
								<xsl:when test="starts-with($docNum, 'JP')">					
									<xsl:variable name="numsOnly" select="translate($docNum, translate($docNum,'0123456789',''), '')" />
									<xsl:choose>
										<xsl:when test="starts-with($date, '19') ">
											<!-- Special rule for JP: "If the date of publication is before 1999, the publication number should not be included 200." (BIBDOS-6776)
											   The following removes the leading 0 after JP (e.g.JP07233473 will be JP7233473)  
											-->
											<xsl:value-of select="concat('JP', number($numsOnly))" /> 
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$docNum" />
										</xsl:otherwise>
									</xsl:choose>								
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="starts-with($docNum, 'US') and contains(substring($docNum, string-length($docNum)-1, 2), 'B')"> 
											<xsl:variable name="usDocNum" select="translate(substring-before($docNum, 'B'), 'US ','')" />
											
											<xsl:choose>
												<xsl:when test="string-length($usDocNum) = 7"> 
													<!-- US9063583	should be US09063583 need adding an 0 extra)-->
													<xsl:value-of select="concat('US', format-number($usDocNum, '00000000'))" />									
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat('US', $usDocNum)" />
												</xsl:otherwise>
											</xsl:choose>					
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$docNum" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>																
						</xsl:when>
						<xsl:when test="starts-with($docNum, $countryUpper)"><!--  docnum containing country code -->
							<xsl:choose>
								<xsl:when test="$countryUpper='JP'"> 
									<xsl:choose>
										<!-- Remove "S" from JPS5313452 -->
										<xsl:when test="string-length(translate(substring($docNum, 3,1), $numbers, '')) &gt; 0"> 
											<xsl:value-of select="concat($countryUpper, substring($docNum,4))" />									
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$docNum" />
										</xsl:otherwise>
									</xsl:choose>								
								</xsl:when>
								<xsl:when test="$countryUpper='WO'"> 
									<!-- Handle old WO number in the format of "WO + 2 digits + 5 digits" e.g. WO97-06872 or WO0147636 (7 digits:YYNNNNN) -->
									<xsl:choose>
										<xsl:when test="contains($docNum, '-') and string-length(translate($docNum, ' ' , ''))=10">
											<!--  e.g. WO97-06872 -->
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="translate(substring-before($docNum, '-'),$countryUpper,'')" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="concat($countryUpper, $year, format-number(substring-after($docNum,'-'), '000000'))" />
										</xsl:when>
										<xsl:when test="string-length($docNum)=9 and not(contains($docNum, '-'))">
											<!--  e.g. WO9706872 -->
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="substring($docNum, 3,2)" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="concat($countryUpper, $year,  format-number(substring($docNum,5), '000000'))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$docNum" />
										</xsl:otherwise>
									</xsl:choose>					
								</xsl:when>
								<xsl:when test="$countryUpper='KR'">
									<xsl:choose>
										<xsl:when test="starts-with($kind, 'B') or starts-with($kind, 'Y')">
											<xsl:value-of select="$countryUpper" /> 
											<xsl:call-template name="format-right-padding">
									    		<xsl:with-param name="curString" select="translate($docNum,'-', '')"/>
												<xsl:with-param name="charForPadding" select="'0'"/>
												<xsl:with-param name="maxLen" select="'15'"/>
									   		</xsl:call-template>
										</xsl:when>
										<xsl:otherwise> <!--  same? TODO -->
											<xsl:value-of select="$countryUpper" /> 
											<xsl:call-template name="format-right-padding">
									    		<xsl:with-param name="curString" select="translate($docNum,'-', '')"/>
												<xsl:with-param name="charForPadding" select="'0'"/>
												<xsl:with-param name="maxLen" select="'15'"/>
									   		</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$docNum" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>	<!-- Normal situation (structured)-->			
							<xsl:choose>
								<xsl:when test="$countryUpper='US' and string-length($docNum)=10"> 
									<!-- US somehow need extra 0 between US and the Number in PatentScope
									But let's limit the scope - only apply to those with yyyynnnnnn
									-->
									<xsl:value-of select="concat($countryUpper, substring($docNum, 1,4), '0', substring($docNum,5))" />									
								</xsl:when>	
								<xsl:when test="$countryUpper='US' and starts-with($kind, 'B') and string-length($docNum)=7"> 
									<!-- US 9063583	should be US 09063583 -->
									<xsl:value-of select="concat($countryUpper, format-number($docNum, '00000000'))" />									
								</xsl:when>
								<xsl:when test="$countryUpper='JP' and string-length(translate(substring($docNum, 1,1), $numbers, '')) &gt; 0"> 
									<!-- Remove "S" from JPS5313452 -->
									<xsl:variable name="docNumJPCleaned" select="substring($docNum,2)" />
									<xsl:choose>
										<xsl:when test="starts-with($docNumJPCleaned, '0') and string-length($docNumJPCleaned)=8">
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="substring($docNumJPCleaned, 1,2)" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="concat($countryUpper, $year, substring($docNumJPCleaned,3))" />
										</xsl:when>										
										<xsl:otherwise>
											<xsl:value-of select="concat($countryUpper, $docNumJPCleaned)" />
										</xsl:otherwise>
									</xsl:choose>				
								</xsl:when>	
								<xsl:when test="$countryUpper='WO'"> 
									<!-- Handle old WO number in the format of "(WO) + 2 digits + 5 digits" e.g. WO97-06872 or WO0147636 (7 digits:YYNNNNN) -->
									<xsl:choose>
										<xsl:when test="string-length($docNum)=7 and not(contains($docNum, '-'))">
											<!--  e.g. 9706872 -->
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="substring($docNum, 1,2)" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="concat($countryUpper, $year, format-number(substring($docNum,3), '000000'))" />
										</xsl:when>
										<xsl:when test="string-length(translate($docNum, ' ' , ''))=8 and contains($docNum, '-')">
											<!--  e.g. 97-06872 -->
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="substring-before($docNum, '-')" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="concat($countryUpper, $year, format-number(substring-after($docNum,'-'), '000000'))" />
										</xsl:when>										
										<xsl:otherwise>
											<xsl:value-of select="concat($countryUpper, $docNum)" />
										</xsl:otherwise>
									</xsl:choose>					
								</xsl:when>
								<xsl:when test="$countryUpper='RU'">
									<xsl:choose>
										<xsl:when test="(starts-with($kind, 'C') or starts-with($kind, 'U')) and string-length($docNum) &lt; 8">
											<xsl:value-of select="concat($countryUpper, format-number($docNum, '00000000'))" /> <!-- eg. RU02154322 -->
										</xsl:when>
										<xsl:when test="(starts-with($kind, 'C') or starts-with($kind, 'U')) and string-length($docNum) &gt; 8">
											<xsl:value-of select="concat($countryUpper, format-number($docNum, '0000000000'))" /> <!-- eg. RU0002154322 -->
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($countryUpper, $docNum)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>	
								<xsl:when test="$countryUpper='AU'">
									<xsl:choose>
										<xsl:when test="string-length($docNum) = 8"> <!-- eg. AU02154322 asusming 02 is 2002 -->
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="substring($docNum, 1, 2)" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="concat($countryUpper, $year, substring($docNum, 3))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($countryUpper, $docNum)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="contains($docNum, '-')">  <!-- e.g. 07-233473 -->
									<xsl:choose>
										<xsl:when test="$countryUpper='JP' and starts-with($date, '19')"> 
											<!-- Special JP Case: If the date of publication is before 1999, the publication number should not be included 200. (BIBDOS-6776)-->
											<xsl:choose>
												<xsl:when test="starts-with($docNum, '0')">
													<xsl:value-of select="concat($countryUpper, substring(translate($docNum,'-', ''), 2))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($countryUpper, translate($docNum,'-', ''))" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:when test="$countryUpper='KR'">
											<xsl:choose>
												<xsl:when test="starts-with($kind, 'B') or starts-with($kind, 'Y')">
													<xsl:value-of select="$countryUpper" /> 
													<xsl:call-template name="format-right-padding">
											    		<xsl:with-param name="curString" select="translate($docNum,'-', '')"/>
														<xsl:with-param name="charForPadding" select="'0'"/>
														<xsl:with-param name="maxLen" select="'13'"/>
											   		</xsl:call-template>
												</xsl:when>
												<xsl:otherwise> <!--  same? TODO -->
													<xsl:value-of select="$countryUpper" /> 
													<xsl:call-template name="format-right-padding">
											    		<xsl:with-param name="curString" select="translate($docNum,'- ', ' ')"/>
														<xsl:with-param name="charForPadding" select="'0'"/>
														<xsl:with-param name="maxLen" select="'13'"/>
											   		</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<!--  e.g. 1997-86872 or 97-86872 -->
											<xsl:variable name="year" >
												<xsl:call-template name="YY2YYYY">                        
													<xsl:with-param name="yy" select="substring-before($docNum, '-')" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="$countryUpper='US'"> <!-- extra 0 between US and the Number in PatentScope -->
													<xsl:value-of select="concat($countryUpper, $year, format-number(substring-after($docNum,'-'), '0000000') )" />								
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($countryUpper, $year, format-number(substring-after($docNum,'-'), '000000') )" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>									
								</xsl:when>						
								<xsl:otherwise>
									<xsl:choose>									
										<xsl:when test="$countryUpper='KR'">
											<xsl:call-template name="format-right-padding">
									    		<xsl:with-param name="curString" select="concat($countryUpper, $docNum)"/> 
												<xsl:with-param name="charForPadding" select="'0'"/>
												<xsl:with-param name="maxLen" select="'15'"/>
									   		</xsl:call-template>
									   	</xsl:when>
									   	<xsl:when test="$countryUpper='DE'">
									   		<xsl:value-of select="$countryUpper" />
											<xsl:call-template name="format-left-padding">
									    		<xsl:with-param name="curString" select="$docNum"/> 
												<xsl:with-param name="charForPadding" select="'0'"/>
												<xsl:with-param name="maxLen" select="'12'"/>
									   		</xsl:call-template>
									   	</xsl:when>
									   	<xsl:when test="$countryUpper='JP' and string-length($date)=8 and starts-with($date, '19')"> 
											<!-- Special JP Case: If the date of publication is before 1999, the publication number should not be included 200. (BIBDOS-6776)-->
											<xsl:choose>
												<xsl:when test="starts-with($docNum, '0')">
													<xsl:value-of select="concat($countryUpper, substring($docNum, 2))" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($countryUpper, $docNum)" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
									   	<xsl:otherwise>
									   		<xsl:value-of select="concat($countryUpper, $docNum)" />
									   	</xsl:otherwise>	
								   </xsl:choose>
								</xsl:otherwise>
							</xsl:choose>							
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>                     
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="isJapaneseEras" select="$countryUpper='JP' and not ($docNum = '') and not ($kind = '')
						and (starts-with($docNum, 'S') or starts-with($docNum, 'H') or starts-with($docNum, 'R')) 
						and (starts-with($kind, 'U') or starts-with($kind, 'Y'))" />
			
		<xsl:variable name="toolTipText">
			<xsl:choose>
				<xsl:when test="$isJapaneseEras and $existingUrl=''">
					<xsl:value-of select="'Not found.'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
										
		<xsl:variable name="urlVal">						
			<xsl:choose>
				<!-- No hyperlink to PATENTSCOPE when Japanese erea (e.g. JPS5313452, JP H05 18316 --> 
				<xsl:when test="$isJapaneseEras">
					<xsl:choose>
						<xsl:when test="not($existingUrl='')">
							<xsl:value-of select="$existingUrl" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<!--  Use PatentScope as the first choice. -->
					<xsl:choose>
						<xsl:when test="$isIaNumber='true'">
							<xsl:value-of select="concat($iaUrlRoot, $docNumForUrlCleaned)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="starts-with($kind, 'B') or contains(substring($docNum, string-length($docNum), 2), 'B') or contains(substring($docNum, string-length($docNum), 2), 'Y')">
									<xsl:value-of select="concat($gnUrlRoot, $docNumForUrlCleaned)" />
								</xsl:when>
								<xsl:otherwise>
									<!-- <xsl:value-of select="concat($pnUrlRoot, $docNumForUrlCleaned)" /> -->
									<xsl:choose>
										<xsl:when test="starts-with($docNumForUrlCleaned,'WO')"> 
											<!-- Use docId for WO -->
											<xsl:value-of select="concat($idUrlRoot, $docNumForUrlCleaned)" />									
										</xsl:when>
										<xsl:when test="starts-with($docNumForUrlCleaned,'US') and string-length($docNumForUrlCleaned)=10"> 
											<!-- Use docAN for USyynnnnnn -->
											<xsl:value-of select="concat($anUrlRoot, $docNumForUrlCleaned)" />									
										</xsl:when>
										<xsl:when test="starts-with($docNumForUrlCleaned,'DE')"> 
											<xsl:value-of select="concat($pnUrlRoot, substring($docNumForUrlCleaned, 1, 2),  format-number(substring($docNumForUrlCleaned, 3), '000000000000'))" />									
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($pnUrlRoot, $docNumForUrlCleaned)" />																						
										</xsl:otherwise>
									</xsl:choose>			
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>	
 				</xsl:otherwise>
			</xsl:choose>		
		</xsl:variable>
		
		<xsl:variable name="docNumberForDisplay">
			<xsl:call-template name="getDocNumberForDisplay">
		    	<xsl:with-param name="isIaNumber" select="$isIaNumber" />
		    	<xsl:with-param name="docNumFormatted" select="$docNumFormatted" />
		    	<xsl:with-param name="countryUpper" select="$countryUpper" /> 
		    	<xsl:with-param name="docNum" select="$docNum" /> 
		    	<xsl:with-param name="countryBold" select="$countryBold" />    	
		    </xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="isPatentScopeAvaiable" select="'true'"/> <!-- leave PatentScope to handle the validation-->		
		
		<xsl:variable name="urlVal2">
 			<xsl:choose>
				<xsl:when test="not($existingUrl='')">					
					<xsl:value-of select="concat($urlVal, '&amp;altUrl=')"/>
					<xsl:call-template name="url-encode">
		    			<xsl:with-param name="str" select="$existingUrl" /> 
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
		  			<xsl:value-of select="$urlVal" />
		  		</xsl:otherwise>
		  	</xsl:choose> 
		  	<!-- <xsl:value-of select="concat($urlVal, '&amp;altUrl=', $existingUrl)"/>-->
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="$isPatentScopeAvaiable='true' and not ($urlVal2 = '')">  <!-- and not (starts-with(translate($docNumberForDisplay, ' ', ''), 'KR20'))"> KR20 Utility model not Patent disable for now -->
				<a href="{$urlVal2}" name="{$docNumFormatted}" title="{$docNumberForDisplay}" target="_blank">    	    
		    	    <xsl:value-of select="$docNumberForDisplay"/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<span title="{$toolTipText}"> <xsl:value-of select="$docNumberForDisplay"/> </span>
			</xsl:otherwise>
		</xsl:choose>
		
    </xsl:template>
    
    <xsl:template name="url-encode">
		<xsl:param name="str"/>
		
		<xsl:variable name="hex" select="'0123456789ABCDEF'"/>
		<xsl:variable name="ascii"> !"#$%&amp;'()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:variable>
		<xsl:variable name="safe">!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~</xsl:variable>
		<xsl:variable name="latin1">&#160;&#161;&#162;&#163;&#164;&#165;&#166;&#167;&#168;&#169;&#170;&#171;&#172;&#173;&#174;&#175;&#176;&#177;&#178;&#179;&#180;&#181;&#182;&#183;&#184;&#185;&#186;&#187;&#188;&#189;&#190;&#191;&#192;&#193;&#194;&#195;&#196;&#197;&#198;&#199;&#200;&#201;&#202;&#203;&#204;&#205;&#206;&#207;&#208;&#209;&#210;&#211;&#212;&#213;&#214;&#215;&#216;&#217;&#218;&#219;&#220;&#221;&#222;&#223;&#224;&#225;&#226;&#227;&#228;&#229;&#230;&#231;&#232;&#233;&#234;&#235;&#236;&#237;&#238;&#239;&#240;&#241;&#242;&#243;&#244;&#245;&#246;&#247;&#248;&#249;&#250;&#251;&#252;&#253;&#254;&#255;</xsl:variable>
			   
		<xsl:if test="$str">
			<xsl:variable name="first-char" select="substring($str,1,1)"/>
			<xsl:choose>
				<xsl:when test="contains($safe,$first-char)">
					<xsl:value-of select="$first-char"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="codepoint">
						<xsl:choose>
							<xsl:when test="contains($ascii,$first-char)">
								<xsl:value-of select="string-length(substring-before($ascii,$first-char)) + 32"/>
							</xsl:when>
							<xsl:when test="contains($latin1,$first-char)">
								<xsl:value-of select="string-length(substring-before($latin1,$first-char)) + 160"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:message terminate="no">Warning: string contains a character that is out of range! Substituting "?".</xsl:message>
								<xsl:text>63</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="hex-digit1" select="substring($hex,floor($codepoint div 16) + 1,1)"/>
					<xsl:variable name="hex-digit2" select="substring($hex,$codepoint mod 16 + 1,1)"/>
					<xsl:value-of select="concat('%',$hex-digit1,$hex-digit2)"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="string-length($str) &gt; 1">
				<xsl:call-template name="url-encode">
					<xsl:with-param name="str" select="substring($str,2)"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
    <xsl:template name="YY2YYYY">
    	<xsl:param name="yy" />
    	
    	<xsl:variable name="yyTrimed" select="translate($yy, ' ' , '')" />
    	
    	<xsl:choose>
			<xsl:when test="string-length($yyTrimed)=2">
				<xsl:choose>
					<xsl:when test="number($yyTrimed) &gt; 78">
						<!-- 78 Same as Patent Scope -->
						<xsl:value-of select="concat('19', $yyTrimed)" />									
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('20', $yyTrimed)" />
					</xsl:otherwise>
				</xsl:choose>						
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$yyTrimed" />
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
        
    <xsl:template name="getDocNumberForDisplay">
    	<xsl:param name="isIaNumber" select="'false'" />
    	<xsl:param name="docNumFormatted" />
    	<xsl:param name="countryUpper" />
    	<xsl:param name="docNum" />
    	<xsl:param name="countryBold" select="'false'" />    	
    	
    	<xsl:choose>
   	    	<xsl:when test="$isIaNumber='true'">
				<xsl:value-of select="$docNumFormatted" />
			</xsl:when>
			<xsl:when test="string-length(translate($countryUpper, ' ' , ''))=0">
				<xsl:value-of select="$docNum" /><!-- missing country code, just use the docnum directly-->
			</xsl:when>
			<xsl:when test="starts-with($docNum, $countryUpper)">
				<xsl:value-of select="$docNum" /><!-- avoid duplicatesed country code -->
			</xsl:when>
			<xsl:otherwise>	<!--  normal cases -->	
				<xsl:if test="$countryBold='true'">
					<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
				</xsl:if>
				<xsl:value-of select="$countryUpper" />
				<xsl:if test="$countryBold='true'">
					<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
				</xsl:if>
				
				<xsl:value-of select="concat(' ', $docNum)" />
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
    
    <!--  
    	Check last 2 chars to see if Doc-Num contains kind (e.g. AU 2004-276310 A1, AU 2004-276310 C,AU 2004-276310,AU2004276310A1,AU2004276310A
    	Return: 0 - if not containing kind
    		    1 - last char is kind (e.g. AU2004276310A
    		    2 - last two chars  (e.g. AU2004276310A1)
    -->
    <xsl:template name="findKindInDocNumber">
    	<xsl:param name="string" />
    	
    	<xsl:variable name="docNumerTrimmed">
	    	<xsl:call-template name="rTrimSpaces">                        
				<xsl:with-param name="string" select="$string"/>                     
			 </xsl:call-template>
	    </xsl:variable>

    	<xsl:choose>
  			<xsl:when test="string-length(translate(substring($docNumerTrimmed, string-length($docNumerTrimmed), 1), $numbers, ''))>0">
    			<xsl:value-of select="1"/>
    		</xsl:when>
    		<xsl:when test="string-length(translate(substring($docNumerTrimmed,string-length($docNumerTrimmed)-1, 1), $numbers, ''))>0">
    			<xsl:value-of select="2"/>
    		</xsl:when>
    		<xsl:otherwise>
    			<xsl:value-of select="0"/>
    		</xsl:otherwise>
    	</xsl:choose>    
    </xsl:template>
    
    <!-- Clean the doc number for being used in the url to patent scope  
    	- removing trailing "kind" element
    	- removing spaces, dash, slashes
    	
    	e.g. AU 2004-276310 A1
    	     AU 2004-276310 C
    	     AU 2004-276310
    	     
    	     AU 2004-276310A1
    	     AU 2004-276310A
     -->
    <xsl:template name="getCleanedDocNumberForUrl">
    	<xsl:param name="docNumer"/>
    	
    	<xsl:variable name="docNumerTrimmed">
    		<xsl:call-template name="rTrimSpaces">                        
				<xsl:with-param name="string" select="$docNumer"/>                     
			</xsl:call-template>
    	</xsl:variable>
    	
    	<xsl:variable name="docNumLength" select="string-length($docNumerTrimmed)" />
    	
    	<xsl:variable name="docNumContainsKind" >
	    	<xsl:call-template name="findKindInDocNumber">                        
				<xsl:with-param name="string" select="$docNumerTrimmed"/>                     
			</xsl:call-template>
    	</xsl:variable>
    	  
    	<xsl:variable name="docNumberKindRemoved">    	
	    	<xsl:value-of select="substring($docNumerTrimmed, 1, number($docNumLength)-number($docNumContainsKind))"/>
    	</xsl:variable>
    	
    	<xsl:value-of select="translate($docNumberKindRemoved, '- ', '')" />  	
    </xsl:template>
    
	<xsl:template name="ClaimsInfo">
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="childName" select="'srep-claims-info'"/>
			<xsl:with-param name="id" select="'pt1-2'"/>
		</xsl:call-template>

		<xsl:if test="//srep-claims-info">
			<xsl:apply-templates select="//srep-claims-info" />
		</xsl:if>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>

	<xsl:template name="UnityOfInvention">
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="childName" select="'srep-unity-of-invention'"/>
			<xsl:with-param name="id" select="'pt1-3'"/>
		</xsl:call-template>

		<xsl:if test="//srep-unity-of-invention">
			<xsl:apply-templates select="//srep-unity-of-invention" />
		</xsl:if>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<!-- srep-claims-info:
	<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "srep-claims-not-searched" minOccurs = "0" maxOccurs = "unbounded"/>
			</xsd:sequence>
		</xsd:complexType> -->
	<xsl:template match="srep-claims-info">
		<div class="indet20">
			<xsl:apply-templates select="$form_table/label[@name ='ISA210Text30']"/>
		</div>
		
		<div class="indet20 marginTop">
			<table>
				<xsl:call-template name="Box2Details">
					<xsl:with-param name="itemNo" select="'1.'"/>
					<xsl:with-param name="isChecked" select="boolean(srep-claims-not-searched/@reason='subject-matter-not-searched-by-isa')"/>
					<xsl:with-param name="becauseText" select="$form_table/label[@name ='ISA210Text31']"/>
				</xsl:call-template>
				
				<xsl:call-template name="Box2Details">
					<xsl:with-param name="itemNo" select="'2.'"/>
					<xsl:with-param name="isChecked" select="boolean(srep-claims-not-searched/@reason='no-meaningful-search')"/>
					<xsl:with-param name="becauseText" select="$form_table/label[@name ='ISA210Text32']"/>
				</xsl:call-template>
				
				<xsl:call-template name="Box2Details">
					<xsl:with-param name="itemNo" select="'3.'"/>
					<xsl:with-param name="isChecked" select="boolean(srep-claims-not-searched/@reason='dependent-claims-incorrectly-drafted')"/>
					<xsl:with-param name="becauseText" select="$form_table/label[@name ='ISA210Text33']"/>
				</xsl:call-template>
				
				<!-- NOTE: The following cases have not been handled in PDF (2015-02-03) -->
	<!-- 			<xsl:if test="boolean(@reason='limited-to-claim-fees-paid')">
					<xsl:call-template name="Box2Details">
						<xsl:with-param name="itemNo" select="'x.'"/>
						<xsl:with-param name="isChecked" select="boolean(@reason='limited-to-claim-fees-paid')"/>
						<xsl:with-param name="becauseText" select="concat('because they are ', translate(@reason, '-', ' '))"/>
					</xsl:call-template>
				</xsl:if>
				
				<xsl:if test="boolean(@reason='limited-to-first-claims')">
					<xsl:call-template name="Box2Details">
						<xsl:with-param name="itemNo" select="'x.'"/>
						<xsl:with-param name="isChecked" select="boolean(@reason='limited-to-first-claims')"/>
						<xsl:with-param name="becauseText" select="concat('because they are ', translate(@reason, '-', ' '))"/>
					</xsl:call-template>
				</xsl:if>
				
				<xsl:if test="boolean(@reason='not-subject-of-isr')">
					<xsl:call-template name="Box2Details">
						<xsl:with-param name="itemNo" select="'x.'"/>
						<xsl:with-param name="isChecked" select="boolean(@reason='not-subject-of-isr')"/>
						<xsl:with-param name="becauseText" select="concat('because they are ', translate(@reason, '-', ' '))"/>
					</xsl:call-template>
				</xsl:if> -->
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="Box2Details">
		<xsl:param name="itemNo" select="''"/>
		<xsl:param name="isChecked" select="false"/>
		<xsl:param name="becauseText" select="''"/>
		
		<tr valign="top">
			<td><xsl:value-of select="$itemNo"/></td>
			<td>
				<xsl:call-template name="BoxToCheck">
					<xsl:with-param name="check_condition" select="boolean($isChecked)" />
				</xsl:call-template>
			</td>
			<td>
				<div>
					<span>
						<xsl:apply-templates select="$common_table/label[@name ='ClaimsNos']"/>: 
					</span>
					
					<xsl:if test="boolean($isChecked)">
						<b>
							<xsl:choose>
								<xsl:when test="$itemNo = '1.'">
									<xsl:apply-templates select="srep-claims-not-searched[@reason='subject-matter-not-searched-by-isa']/claim-num" />
								</xsl:when>
								<xsl:when test="$itemNo = '2.'">
									<xsl:apply-templates select="srep-claims-not-searched[@reason='no-meaningful-search']/claim-num" />
								</xsl:when>
								<xsl:when test="$itemNo = '3.'">
									<xsl:apply-templates select="srep-claims-not-searched[@reason='dependent-claims-incorrectly-drafted']/claim-num" />
								</xsl:when>
							</xsl:choose>
						</b>
					</xsl:if>
				</div>
				
				<xsl:choose>
					<xsl:when test="contains($becauseText, '=')">
						<xsl:apply-templates select="$becauseText"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$becauseText"/>
					</xsl:otherwise>
				</xsl:choose>
								
				<xsl:if test="boolean($isChecked)">
					<xsl:choose>
						<xsl:when test="$itemNo = '1.'">
							<xsl:apply-templates select="srep-claims-not-searched[@reason='subject-matter-not-searched-by-isa']/claim-remark" />
						</xsl:when>
						<xsl:when test="$itemNo = '2.'">
							<xsl:apply-templates select="srep-claims-not-searched[@reason='no-meaningful-search']/claim-remark" />
						</xsl:when>
						<xsl:when test="$itemNo = '3.'">
							<xsl:apply-templates select="srep-claims-not-searched[@reason='dependent-claims-incorrectly-drafted']/claim-remark" />
						</xsl:when>
					</xsl:choose>
				</xsl:if>
			</td>
		</tr>	
	</xsl:template>
	
	<xsl:template match="claim-num">
		<span class="{$varNeedTranslation}">
			<xsl:apply-templates />
		</span>
	</xsl:template>
	
	<xsl:template match="claim-remark">	
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
			<xsl:apply-templates select="./p" mode="SQUARE_BRACKED"/>
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<!-- srep-unity-of-invention	
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "p" minOccurs = "0" maxOccurs = "unbounded"/>
				<xsd:element ref = "srep-search-fees"/>
				<xsd:element ref = "srep-protest-remark" minOccurs = "0"/>
				<xsd:element ref = "srep-earlier-lack-of-unity" minOccurs = "0" maxOccurs = "unbounded"/>
				<xsd:element ref = "sisr-limited-to-invention" minOccurs = "0"/>
				<xsd:element ref = "sisr-review-fee" minOccurs = "0"/>
			</xsd:sequence>
			<xsd:attribute name = "number-of-inventions" type = "xsd:string"/>
		</xsd:complexType> -->
	<xsl:template match="srep-unity-of-invention">
		
		
		<xsl:if test="@number-of-inventions">
<!-- 			<xsl:call-template name="openDIVwithNodePathInline">
				<xsl:with-param name="attrName" select="'number-of-inventions'" />
			</xsl:call-template>	 -->
			
<!-- <div> 			
	<i><xsl:value-of select="'Number of inventions: '" /></i><xsl:value-of select="@number-of-inventions"/> 
	 </div>	
-->
	
<!-- 			<xsl:call-template name="closeDIV" /> -->
		</xsl:if>
		
		<xsl:apply-templates select="$form_table/label[@name ='ISA210Text35']"/>
		
		<!-- Only "P" -->
		<xsl:if test="./p">
			<div>
			<!-- <i><xsl:value-of select="'Observations: '" /></i>  -->
			<xsl:apply-templates select="./*[(self::p)]" mode="SQUARE_BRACKED"/>
			</div>
		</xsl:if>
		
		<xsl:call-template name="srep-search-fees" />
		
		<!-- All but "P" e.g. Remark-->
<!-- 		<xsl:apply-templates select="./*[not(self::p)]"/> -->		
<!-- 		<xsl:apply-templates select="./*[not(self::p) and not(self::srep-search-fees)]"/> -->
		<xsl:call-template name="srep-protest-remark" />
		
	</xsl:template>
	

	
	<!-- 
	public static final String I = "i";  
		public static final String U = "u";  
		public static final String SUP = "sup"; 
		public static final String SUB = "sub";
		public static final String BR = "br";
		public static final String PRE = "pre";
		public static final String DL = "dl";
		public static final String UL = "ul";
		public static final String OL = "ol";
		public static final String IMG = "img"; 
		
		//PCT Special
		public static final String O = "o";
		public static final String SMALLCAPS = "smallcaps";
		public static final String CROSSREF = "crossref";
		public static final String FIGREF = "figref";
		public static final String PATCIT = "patcit";
		public static final String NPLCIT = "nplcit";
		public static final String BIO_DEPOSIT = "bio-deposit"; 
		public static final String CHEMISTRY = "chemistry";
		public static final String MATHS = "maths";
		public static final String TABLES = "tables";
		public static final String TABLE_EXTERNAL_DOC = "table-external-doc";
	 -->
	<xsl:template match="p">
		<xsl:call-template name="openDIVwithNodePath"/>
		<p class="{$varNeedTranslation}">
			<xsl:apply-templates />
		</p>
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<xsl:template match="p" mode="SQUARE_BRACKED">
		<xsl:call-template name="openDIVwithNodePath"/>
		
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&lt;table cellpadding="5" &gt;</xsl:text>
		</xsl:if>
			<tr valign="top">
				<td style="white-space: nowrap">
					<xsl:if test="string-length(@num) &gt;0">
						<xsl:value-of select="'['"/>
						
						<xsl:choose>
							<xsl:when test="@id and string-length(@id) !=0">
								<a name="{@id}"><xsl:value-of select="@num"/></a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@num"/>
							</xsl:otherwise>
						</xsl:choose>							
							
						<xsl:value-of select="']'"/>
					</xsl:if>
				</td>
				<td class="{$varNeedTranslation}">
					<xsl:apply-templates />
				</td>
			</tr>
		<xsl:if test="position()=last()">
			<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
		</xsl:if>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>	
	
	<xsl:template match="p" mode="SQUARE_BRACKED_AR">
		<xsl:call-template name="openDIVwithNodePath"/>
		
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&lt;table cellpadding="5" &gt;</xsl:text>
		</xsl:if>
			<tr valign="top" class="{$varNeedTranslation}">
				<td>
					<xsl:apply-templates />
				</td>
				<td style="white-space: nowrap">
					<xsl:if test="string-length(@num) &gt;0">
						<xsl:value-of select="'['"/>
						<xsl:value-of select="@num"/>
						<xsl:value-of select="']'"/>
					</xsl:if>
				</td>
			</tr>
		<xsl:if test="position()=last()">
			<xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>
		</xsl:if>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>	
	
	<xsl:template match="br">
		<!-- <br><xsl:apply-templates /></br> -->

 	 	<xsl:call-template name="br-trimed" />
	</xsl:template>
	
	<!-- trim the leading <br/> and remove duplicate br-tags from running text -->
	<xsl:template name="br-trimed">
		<xsl:if test="not(preceding-sibling::node()[not(self::text() and normalize-space(.) = '')][1][self::br])">  
		      <xsl:copy>
		          <xsl:apply-templates select="@*|node()" />
		      </xsl:copy>
	   </xsl:if>	      
   </xsl:template>
	
	<xsl:template match="b">
		<b><xsl:apply-templates /></b>
	</xsl:template>
	
	<xsl:template match="i">
		<i><xsl:apply-templates /></i>
	</xsl:template>
	
	<xsl:template match="o">
		<o><xsl:apply-templates /></o>
	</xsl:template>
	
	<xsl:template match="u">
		<u><xsl:apply-templates /></u>
	</xsl:template>
	
	<xsl:template match="sup | sup2">
		<sup><xsl:apply-templates /></sup>
	</xsl:template>
	
	<xsl:template match="sub | sub2">
		<sub><xsl:apply-templates /></sub>
	</xsl:template>
	
<!-- 	<xsl:template match="text()">
		<xsl:value-of select="." disable-output-escaping="yes"/>
	</xsl:template> -->
	
	<xsl:template match="@*|node()" mode="NUMBER-LISTED" priority="-2">
	    <xsl:copy>	   
	      <xsl:apply-templates select="@*|node()" />
	    </xsl:copy>
   </xsl:template>  
	
	<xsl:template match="text()">
        <xsl:value-of select="translate(., $softHyphen, '')"/>
    </xsl:template>
    
	<xsl:template match="xhtml-text">
		<xsl:copy-of select="."/>
	</xsl:template>
	
	<xsl:output cdata-section-elements="xhtml-text" />
			
	<xsl:template match="xhtml-text" mode="NUMBER-LISTED">
		<xsl:copy-of select="."/>
	</xsl:template>
	
	<xsl:template match="pre">
		<xsl:value-of select="." disable-output-escaping="yes"/>
	</xsl:template>
	
	<xsl:template match="dl">
		<dl><xsl:apply-templates /></dl>
	</xsl:template>
	
	<xsl:template match="ul">
		<ul><xsl:apply-templates /></ul>
	</xsl:template>
	
	<xsl:template match="ol">
		<ol><xsl:apply-templates /></ol>
	</xsl:template>
	
	<!-- Note: strikethrough is not a valid tag in DTD. But exists in some XML from EP-->
	<xsl:template match="strikethrough"> 
	   <span class="strikethrough">
	   		<xsl:apply-templates />
	   </span>	   
	</xsl:template>
	
	<!-- ** ToDO: The following need to be edited -->
	<xsl:template match="smallcaps">
		<xsl:variable name="txt"><xsl:value-of select="." disable-output-escaping="yes"/></xsl:variable>
		<xsl:call-template name ="smallCaps">
			<xsl:with-param name="inString" select="$txt"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="crossref">
   		<xsl:variable name="refId" select="./@idrefs"/>

		<a href='#{$refId}'><xsl:value-of select="//p[@id=$refId]/@num" /></a>
		
		<xsl:apply-templates />	   
	</xsl:template>
	
	<xsl:template match="figref">
		<figref><xsl:apply-templates /></figref>
	</xsl:template>
	<xsl:template match="bio-deposit">
		<bio-deposit><xsl:apply-templates /></bio-deposit>
	</xsl:template>	
	<xsl:template match="chemistry">
		<chemistry><xsl:apply-templates /></chemistry>
	</xsl:template>	
	<xsl:template match="maths">
		<maths><xsl:apply-templates /></maths>
		
		<!-- 
		<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi><mo>+</mo><mn>3</mn></math>
		 -->
	</xsl:template>
	
	<!-- 
		We need to handle both situations (use "useMM" parameter):
		1) image with "mm" - we need to add "mm"
		2) without "mm" - normal pixel size 
		
		Note: Chinese cases assumes "mm" but not adding "mm" in the XML.
		
		Keep the original size for jpg and gif	
	 -->
	<xsl:template match="img">
		<xsl:call-template name="imageFormat">						
			<xsl:with-param name="height">
				<xsl:choose>
					<xsl:when test="@img-format='jpg' or @img-format='gif' or @img-format='png' or @img-format='apng' or @img-format='svg' or @img-format='bmp'">
						<xsl:value-of select="number(translate(@he, 'mm',''))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="round(number(translate(@he, 'mm',''))*number($dpi) div number('25.4'))" />
					</xsl:otherwise>
				</xsl:choose>				
			</xsl:with-param>
			<xsl:with-param name="width">
				<xsl:choose>
					<xsl:when test="@img-format='jpg' or @img-format='gif' or @img-format='png' or @img-format='apng' or @img-format='svg' or @img-format='bmp'">
						<xsl:value-of select="number(translate(@wi, 'mm',''))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="round(number(translate(@wi, 'mm',''))*number($dpi) div number('25.4'))" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
			<xsl:with-param name="fileName" select="@file" />
			<xsl:with-param name="fileExtension" select="@img-format" />
			<xsl:with-param name="inline" select="@inline" />
			<xsl:with-param name="useMM">
				<xsl:choose>
					<xsl:when test="$langOriginal='zh' or $srepOffice='JP'">true</xsl:when>
					<xsl:when test="not ($media = 'web')">true</xsl:when>
					<xsl:when test="boolean(contains(@wi, 'mm') or contains(@he, 'mm'))">true</xsl:when>						
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>	
	
	<!-- 
	 A4 size 
	  pixcels:
		"a4Height"= "number('3508')" 
		"a4Width" = "number('2480')"
	  
	  millimeter:
	    "max-width"  = "210"
		"max-height" = "297"
	 -->
	<xsl:template name="imageFormat">
		<xsl:param name="fileName"/>
		<xsl:param name="fileExtension"/>
		<xsl:param name="width"/>
		<xsl:param name="height"/>
		<xsl:param name="inline"/>
		<xsl:param name="useMM" select="'false'"/>
		
		<!--  remove "mm" or other characters -->
		<xsl:variable name="he" select="translate($height, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" />
		<xsl:variable name="wi" select="translate($width, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" />
		
		<xsl:if test="not($inline = 'yes')">
			<xsl:text disable-output-escaping="yes">&#x3C;div&#x3E;</xsl:text>
		</xsl:if>
		<xsl:text disable-output-escaping="yes">&#x3C;img </xsl:text>
		<xsl:choose>
       		<xsl:when test="(0.001>$he) and (0.001>$wi)"> <!-- special case: set default if no size provided-->
       			<xsl:text disable-output-escaping="yes">height="700"</xsl:text>
       		</xsl:when>
       		<xsl:otherwise> 
       			<xsl:choose>
					<xsl:when test="(@img-format='jpg' or @img-format='gif' or @img-format='png' or @img-format='apng' or @img-format='svg' or @img-format='bmp') and ($useMM='true')">
						<xsl:choose>
							<xsl:when test="$wi>$max-width">style="width:<xsl:value-of select="$max-width"/>mm;"</xsl:when>
							<xsl:when test="$he>$max-height">style="height:<xsl:value-of select="$he"/>mm;"</xsl:when>
							<xsl:otherwise>style="width:<xsl:value-of select="$wi"/>mm;height:<xsl:value-of select="$he"/>mm;"</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>width="<xsl:value-of select="$wi"/>" height="<xsl:value-of select="$he"/>"</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>						
		<xsl:choose>
			<xsl:when test="($media = 'web') and not ($imageRoot = 'none')"> 
			  src="<xsl:value-of select="$imageUrlRoot"/><xsl:value-of select="substring-before($fileName, '.')"/>.<xsl:value-of select="$fileExtension"/>"</xsl:when>
			<xsl:otherwise> src="<xsl:value-of select='$fileName'/>" </xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$inline='yes'"> </xsl:when>
			<xsl:otherwise> class="newline" </xsl:otherwise>
		</xsl:choose>		
		<xsl:text disable-output-escaping="yes">/&#x3E;</xsl:text>		
		<xsl:if test="not($inline = 'yes')">
			<xsl:text disable-output-escaping="yes">&#x3C;/div&#x3E;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<!-- <xsd:element name = "tables">
		<xsd:complexType>
			<xsd:choice>
				<xsd:element ref = "img"/>
				<xsd:element ref = "table"/>
			</xsd:choice>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "num" use = "required" type = "xsd:string"/>
		</xsd:complexType>
	</xsd:element> -->	
	<xsl:template match="tables">
		<xsl:apply-templates />
	</xsl:template>	
	<xsl:template match="table">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="table-external-doc">
		<table-external-doc><xsl:apply-templates /></table-external-doc>
	</xsl:template>	
	
	<!-- 
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "srep-fee-1" minOccurs = "0"/>
				<xsd:element ref = "srep-fee-2" minOccurs = "0"/>
				<xsd:element ref = "srep-fee-3" minOccurs = "0"/>
				<xsd:element ref = "srep-fee-4" minOccurs = "0"/>
			</xsd:sequence>
		</xsd:complexType>
	 -->
<!--     <xsl:template match="srep-search-fees">	
		<xsl:call-template name="openDIVwithNodePath" />
			<xsl:apply-templates />
		<xsl:call-template name="closeDIV" />
	</xsl:template> -->
	
	<xsl:template name="srep-search-fees">	
<!-- 		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="childName" select="'srep-search-fees'" />
		</xsl:call-template> -->
		
			<table>
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="itemNo" select="'1. '"/>
					<xsl:with-param name="isChecked" select="boolean(//srep-fee-1)"/>
					<xsl:with-param name="itemTitle">
						<xsl:value-of select="$form_table/label[@name ='ISA210Text36']"/>
					</xsl:with-param>
					<xsl:with-param name="itemTitleEndingColon" select="false"/>
					<xsl:with-param name="itemTitlePendingTextIfSelected" select="''"/>
					<xsl:with-param name="moreInfo" select="''"/>
				</xsl:call-template>
				
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="itemNo" select="'2. '"/>
					<xsl:with-param name="isChecked" select="boolean(//srep-fee-2)"/>
					<xsl:with-param name="itemTitle">
						<xsl:value-of select="$form_table/label[@name ='ISA210Text37']"/>
					</xsl:with-param>
					<xsl:with-param name="itemTitleEndingColon" select="false"/>
					<xsl:with-param name="itemTitlePendingTextIfSelected" select="''"/>
					<xsl:with-param name="moreInfo" select="''"/>
				</xsl:call-template>
				
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="itemNo" select="'3. '"/>
					<xsl:with-param name="isChecked" select="boolean(//srep-fee-3)"/>
					<xsl:with-param name="itemTitle">
						<xsl:value-of select="$form_table/label[@name ='ISA210Text38']"/>
					</xsl:with-param>
					<xsl:with-param name="itemTitleEndingColon" select="true"/>
					<xsl:with-param name="itemTitlePendingTextIfSelected">					
						<!-- <xsl:apply-templates select="" /> -->
						<!-- TODO Make it generic! -->
						<xsl:variable name="fee3ClaimNum">
						<xsl:for-each select="//srep-fee-3/claim-num">
							<xsl:value-of select="." />
							<xsl:choose>
								<xsl:when test="position() = last()">
									<xsl:text> </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>, </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						</xsl:variable>
						
						<xsl:if test="string-length($fee3ClaimNum) &gt; 0">
							<xsl:value-of select="$fee3ClaimNum" />
						</xsl:if>
					</xsl:with-param>
					<xsl:with-param name="moreInfo">
						<xsl:apply-templates select="//srep-fee-3/*[not(self::claim-num)]" />
					</xsl:with-param>
				</xsl:call-template>
				
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="itemNo" select="'4. '"/>
					<xsl:with-param name="isChecked" select="boolean(//srep-fee-4)"/>
					<xsl:with-param name="itemTitle">
						<xsl:value-of select="$form_table/label[@name ='ISA210Text39']"/>
					</xsl:with-param>
					<xsl:with-param name="itemTitleEndingColon" select="true"/>
					<xsl:with-param name="itemTitlePendingTextIfSelected">
						<xsl:variable name="fee4ClaimNum">
						<xsl:for-each select="//srep-fee-4/claim-num">
							<xsl:value-of select="." />
							<xsl:choose>
								<xsl:when test="position() = last()">
									<xsl:text> </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>, </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						</xsl:variable>
						
						<xsl:if test="string-length($fee4ClaimNum) &gt; 0">
							<xsl:value-of select="$fee4ClaimNum" />
						</xsl:if>
					</xsl:with-param>
					<xsl:with-param name="moreInfo">
						<xsl:apply-templates select="//srep-fee-4/*[not(self::claim-num)]" />
					</xsl:with-param>
				</xsl:call-template>
			
			</table>
			
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>

	<!-- srep-protest-remark
		<xsd:complexType>
			<xsd:attribute name = "protest-remark" use = "required">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:NMTOKEN">
						<xsd:enumeration value = "no-protest"/>
						<xsd:enumeration value = "protest-fee-paid"/>
						<xsd:enumeration value = "protest-fee-not-paid"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
		</xsd:complexType>
	 -->
	<xsl:template name="srep-protest-remark">
		<div style="margin-top:6px;">
		<xsl:call-template name="openDIVwithNodePath" />
			<table>
				<tr valign="top">
					<td class="nowrap"><b><xsl:apply-templates select="$common_table/label[@name ='RemarkOnProtest']"/></b></td>
					<td>
						<table>
							<xsl:call-template name="BoxGeneral">
								<xsl:with-param name="isChecked" select="boolean(//srep-protest-remark/@protest-remark='protest-fee-paid')"/>
								<xsl:with-param name="itemTitle">
									<xsl:apply-templates select="$form_table/label[@name ='ISA210Text40']"/>
								</xsl:with-param>
							</xsl:call-template>
							
							<xsl:call-template name="BoxGeneral">
								<xsl:with-param name="isChecked" select="boolean(//srep-protest-remark/@protest-remark='protest-fee-not-paid')"/>
								<xsl:with-param name="itemTitle">
									<xsl:apply-templates select="$form_table/label[@name ='ISA210Text41']"/>
								</xsl:with-param>
							</xsl:call-template>	
							
							<xsl:call-template name="BoxGeneral">
								<xsl:with-param name="isChecked" select="boolean(//srep-protest-remark/@protest-remark='no-protest')"/>
								<xsl:with-param name="itemTitle">
									<xsl:apply-templates select="$form_table/label[@name ='ISA210Text42']"/>
								</xsl:with-param>
							</xsl:call-template>								
						</table>
					</td>
				</tr>
			</table>			
		<xsl:call-template name="closeDIV" />
		</div>
	</xsl:template>
	
	<!-- srep-earlier-lack-of-unity
		<xsd:complexType>
			<xsd:attribute name = "conclusion-agreed" default = "yes">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:token">
						<xsd:enumeration value = "yes"/>
						<xsd:enumeration value = "no"/>
						<xsd:enumeration value = "not-available"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
			<xsd:attribute name = "idref" type = "xsd:IDREF"/>
		</xsd:complexType>
	 -->
	<xsl:template match="srep-earlier-lack-of-unity">
		<xsl:if test="@conclusion-agreed">
			<div>
				<xsl:text>Conclusion agreed: </xsl:text>
				<xsl:value-of select="@conclusion-agreed"/>
			</div>				
		</xsl:if>
		<xsl:if test="@idref">
			<div>
				<i><xsl:value-of select="'Earlier search element: '"/></i>
				<xsl:value-of select="@idref"/>
			</div>				
		</xsl:if>
	</xsl:template>
	
	<!-- sisr-limited-to-invention
		<xsd:complexType>
			<xsd:simpleContent>
				<xsd:extension base = "xsd:string">
					<xsd:attribute name = "limited-to-invention" use = "required">
						<xsd:simpleType>
							<xsd:restriction base = "xsd:token">
								<xsd:enumeration value = "yes"/>
								<xsd:enumeration value = "no"/>
							</xsd:restriction>
						</xsd:simpleType>
					</xsd:attribute>
				</xsd:extension>
			</xsd:simpleContent>
		</xsd:complexType>
	 -->
	<xsl:template match="sisr-limited-to-invention">
		<xsl:if test="@limited-to-invention">
			<div>
				<i><xsl:text>Limited to invention: </xsl:text></i>
				<xsl:value-of select="@limited-to-invention" />
			</div>
		</xsl:if>
	</xsl:template>
	
	<!-- sisr-review-fee
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "amount-total"/>
			</xsd:sequence>
			<xsd:attribute name = "currency" use = "required" type = "xsd:string"/>
		</xsd:complexType>
	 -->
	<xsl:template match="sisr-review-fee">
		<!-- <xsl:call-template name="openDIVwithNodePath" /> -->
		<xsl:if test="amount-total">
		   <div>
			<i><xsl:text>Amount Total: </xsl:text></i>			
			<xsl:if test="@currency">
				<i><xsl:value-of select="@currency" /></i>
				<xsl:value-of select="' '" />
			</xsl:if>
			<xsl:value-of select="amount-total" />
			</div>
		</xsl:if>
		<!-- <xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<xsl:template name="InventionTitle">		
<!-- 		<xsl:apply-templates select="/search-report/srep-info/srep-invention-title"/> -->
	
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="childName" select="'//srep-invention-title'" />
			<xsl:with-param name="id" select="'pt1-4'"/>
		</xsl:call-template>
					
		<table>
			<tr valign="top">
				<td class="nowrap">
					<xsl:call-template name="BoxToCheck">
						<xsl:with-param name="check_condition" select="boolean(//srep-info/srep-invention-title/@title-approval = 'yes')" />
					</xsl:call-template>
				</td>
				<td>					
					<xsl:call-template name="capitalize-first-letter" >
						<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Text15']"/>
					</xsl:call-template>
				</td>
			</tr> 
			<tr valign="top">
				<td class="nowrap">
					<xsl:call-template name="BoxToCheck">
						<xsl:with-param name="check_condition" select="boolean(//srep-info/srep-invention-title/@title-approval = 'no')" />
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="capitalize-first-letter" >
						<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Text16']"/>
					</xsl:call-template>
				</td>
			</tr> 
			
			<!-- RULE: only show it if not approved -->
			<xsl:if test="boolean(//srep-info/srep-invention-title/@title-approval = 'no')">
				<tr>
					<td></td>
					<td>
						<div class="indent marginTop maginBottom">
							<b class="text-uppercase text-big"><xsl:apply-templates select="//srep-info/srep-invention-title/invention-title" /></b>
						</div>
						<br/>
					</td>
				</tr>
			</xsl:if>
		</table>

		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<!--  NOTE: NOT USED -->
	<!-- srep-invention-title 
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "invention-title" minOccurs = "0"/>
			</xsd:sequence>
			<xsd:attribute name = "title-approval" default = "yes">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:NMTOKEN">
						<xsd:enumeration value = "yes"/>
						<xsd:enumeration value = "no"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
		</xsd:complexType>
	 -->
<!-- 	<xsl:template match="srep-invention-title">	
		<xsl:call-template name="openDIVwithNodePath" />
			<xsl:call-template name="CheckBox_Checked"/>
			<xsl:choose>
				<xsl:when test="./@title-approval='yes'">
					<xsl:call-template name="AddItalicFontStyleForLatinLang" />
					<xsl:call-template name="capitalize-first-letter" >
						<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Text15']"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="AddItalicFontStyleForLatinLang" />
					<xsl:call-template name="capitalize-first-letter" >
						<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Text16']"/>
					</xsl:call-template>
					
					<div class="indent">
						<b><xsl:apply-templates select="invention-title" /></b>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template> -->
	
	<!-- invention-title
	<xsd:complexType mixed = "true">
			<xsd:choice minOccurs = "0" maxOccurs = "unbounded">
				<xsd:element ref = "b"/>
				<xsd:element ref = "i"/>
				<xsd:element ref = "u"/>
				<xsd:element ref = "o"/>
				<xsd:element ref = "sup"/>
				<xsd:element ref = "sub"/>
			</xsd:choice>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "lang" type = "xsd:string"/>
		</xsd:complexType> -->
	<xsl:template match="invention-title">
		<span class="{$varNeedTranslation}">
		<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template name="Abstract">
<!-- 		<xsl:apply-templates select="//srep-abstract"/> -->
		
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="childName" select="'//srep-abstract'" />
			<xsl:with-param name="id" select="'pt1-5'"/>
		</xsl:call-template>
		
		<table>
			<tr valign="top">
				<td class="nowrap">
					<xsl:call-template name="BoxToCheck">
						<xsl:with-param name="check_condition" select="boolean(//srep-info/srep-abstract/@abs-approval = 'yes' )" />
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="capitalize-first-letter" >
						<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Text18']"/>
					</xsl:call-template>
				</td>
			</tr> 
			<tr valign="top">
				<td class="nowrap">
					<xsl:call-template name="BoxToCheck">
						<xsl:with-param name="check_condition" select="boolean(//srep-info/srep-abstract/@abs-approval = 'no')" />
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="capitalize-first-letter" >
						<xsl:with-param name="inputString" select="$form_table/label[@name ='ISA210Text19']"/>
					</xsl:call-template>
				</td>
			</tr> 
			
			<!-- RULE: only show it if not approved -->
			<xsl:if test="boolean(//srep-info/srep-abstract/@abs-approval = 'no')">
				<tr>
					<td></td>
					<td>
						<div class="indent marginTop maginBottom text-big">
							<xsl:apply-templates select="//srep-info/srep-abstract/abstract" />
						</div>
						<br/>
					</td>
				</tr>
			</xsl:if>
		</table>

		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<!-- 
	<xsd:complexType>
			<xsd:choice>
				<xsd:element ref = "doc-page" maxOccurs = "unbounded"/>
				<xsd:sequence>
					<xsd:element ref = "abst-problem"/>
					<xsd:element ref = "abst-solution"/>
				</xsd:sequence>
				<xsd:element ref = "p" maxOccurs = "unbounded"/>
			</xsd:choice>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "lang" type = "xsd:string"/>
			<xsd:attribute name = "status" type = "xsd:string"/>
		</xsd:complexType>	
	 -->
	<xsl:template match="abstract">	
		<!-- <xsl:call-template name="openDIVwithNodePath" /> -->
		
		<xsl:choose>
			<xsl:when test="doc-page">
				<b>DocPage:</b>
				<xsl:apply-templates select="doc-page"/>
			</xsl:when>
			<xsl:when test="abst-problem | abst-solution">
				<xsl:if test="abst-problem">
					<div><b>Problems:</b>
						<xsl:apply-templates select="abst-problem"/>
					</div>
				</xsl:if>
				
				<xsl:if test="abst-solution">
				<div><b>Solutions:</b>
					<xsl:apply-templates select="abst-solution"/>
				</div>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise><!-- default to "p" -->
			    <xsl:apply-templates select = "*[not(doc-page | abst-problem | abst-solution )]"/>
			</xsl:otherwise>			
		</xsl:choose>
		<!-- <xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<xsl:template match="abst-problem | abst-solution">		
		<xsl:value-of select="." disable-output-escaping="yes"/>
	</xsl:template>
	
	<xsl:template name="FigureToPublish">		
<!-- 		<xsl:apply-templates select="/search-report/srep-info/srep-figure-to-publish" /> -->

		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="childName" select="'//srep-figure-to-publish'" />
			<xsl:with-param name="id" select="'pt1-6'"/>
		</xsl:call-template>

		<table>
			<tr valign="top">
				<td>
					<div>
						<xsl:text>a.</xsl:text>
					</div>
				</td>
				<td colspan="2">
					<xsl:choose>
						<xsl:when test="//srep-info/srep-figure-to-publish/figure-to-publish/fig-number ">
							<xsl:call-template name="capitalize-first-letter" >
								<xsl:with-param name="inputString">
									<xsl:apply-templates select="$form_table/label[@name ='ISA210Text21a']"/>
								</xsl:with-param>
							</xsl:call-template>
							<span class="{$varNeedTranslation}">
								<span class="text-bold-underline">	
									<xsl:call-template name="tab"/>							
									<xsl:for-each select="//srep-info/srep-figure-to-publish/figure-to-publish/fig-number">
										<xsl:value-of select="."/>
										<xsl:if test="position() != last()">
											<xsl:apply-templates select="$common_table/label[@name ='MarkComma']"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:call-template name="tab"/>
								</span>
							</span>
							<xsl:apply-templates select="$form_table/label[@name ='ISA210Text21b']"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="capitalize-first-letter" >
								<xsl:with-param name="inputString">
									<xsl:apply-templates select="$form_table/label[@name ='ISA210Text21']"/>
								</xsl:with-param>
							</xsl:call-template>							
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr valign="top">
				<td>
					<div>
					</div>
				</td>
				<td class="indent20">
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="//srep-info/srep-figure-to-publish/@figinfo='by-applicant'"/>
						</xsl:call-template>
				</td>
				<td>		
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text22']"/>
				</td>
			</tr>
			<tr valign="top">
				<td >
					<div>
					</div>
				</td>
				<td class="indent20">
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="//srep-info/srep-figure-to-publish/@figinfo='none-suggested'"/>
						</xsl:call-template>
				</td>
				<td>		
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text23']"/>
		
				</td>
			</tr>
			<tr valign="top">
				<td>
					<div>
					</div>
				</td>
				<td class="indent20">
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="//srep-info/srep-figure-to-publish/@figinfo='by-examiner'"/>
						</xsl:call-template>
				</td>
				<td>					
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text24']"/>
				</td>
			</tr>
			<tr valign="top">
				<td>
					<div>
						<xsl:text>b.</xsl:text>
					</div>
				</td>
				<td colspan="2">
					<div>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="//srep-info/srep-figure-to-publish/@figinfo='none'"/>
						</xsl:call-template>
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text25']"/>
					</div>
				</td>
			</tr>
		</table>
		
		<xsl:call-template name="closeDIV" />

	</xsl:template>

	<!-- figure-to-publish
		<xsd:element ref = "fig-number" maxOccurs = "unbounded"/>
	 -->
	<xsl:template match="figure-to-publish">
		<xsl:value-of select="./fig-number" />
	</xsl:template>
	
	<!-- srep-info-admin
	<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "authorized-officer" minOccurs = "0"/>
				<xsd:element ref = "srep-office" minOccurs = "0"/>
				<xsd:element ref = "date-search-report-mailed" minOccurs = "0"/>
				<xsd:element ref = "date-opinion-completed" minOccurs = "0"/>
			</xsd:sequence>
		</xsd:complexType>
 	-->
	<xsl:template name="ISAInfo"> <!-- match="srep-info-admin">  -->		
		<table width="100%" border="0" cellspacing="0" style="table-layout: fixed;">
			<tr valign="top">
				<td valign="top" style="max-width:50%">
					<xsl:call-template name="ISAAddressBook" />
				</td>
				<xsl:if test="not($form_number='203')" >
					<td class="{$clsThinDivider}">
						<div><xsl:call-template name="CompletionDate" /></div>
						<div class="newPara thinTop"><xsl:call-template name="MailingDate" /></div>
					</td>	
				</xsl:if>			
				<td class="{$clsThinDivider}"><xsl:call-template name="AuthorizedOfficer" /></td>
			</tr>
		</table>		
	</xsl:template>
	
   <xsl:template name="ISAInfo_AR"> <!-- match="srep-info-admin">  -->		
		<table width="100%" border="0" cellspacing="0" style="table-layout: fixed;">
			<tr valign="top">
				<td style="max-width:50%"><xsl:call-template name="AuthorizedOfficer" /></td>
				<xsl:if test="not($form_number='203')" >
					<td class="{$clsThinDivider}">
						<div><xsl:call-template name="CompletionDate" /></div>
						<div class="newPara thinTop"><xsl:call-template name="MailingDate" /></div>
					</td>	
				</xsl:if>			
				<td class="{$clsThinDivider}" valign="top">
					<xsl:call-template name="ISAAddressBook" />
				</td>
			</tr>
		</table>		
	</xsl:template>
	
   <xsl:template name="ISAAddressBook">
		<div class="label">
			<xsl:call-template name="AddItalicFontStyleForLatinLang" />
			
			<xsl:choose>				
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web'))">
					<xsl:value-of select="concat(':', $common_table/label[@name ='NameAndMailingAddressOfTheISA'])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($common_table/label[@name ='NameAndMailingAddressOfTheISA'], ':')"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<xsl:choose>
			<xsl:when test="//srep-info-admin/srep-office/addressbook">
				<xsl:apply-templates select="//srep-info-admin/srep-office/addressbook" />
			</xsl:when>
			<xsl:when test="//srep-admin/srep-office/addressbook">
				<xsl:apply-templates select="//srep-admin/srep-office/addressbook" />
			</xsl:when>
		</xsl:choose>
   </xsl:template>
      
  <xsl:template name="AddItalicFontStyleForLatinLang">
  		<xsl:param name="otherStyleAttributes" />
  		<xsl:if test="$lang!='zh' and $lang!='ja' and $lang!='ko'">
  			<xsl:attribute name="style">font-style:italic;<xsl:value-of select="$otherStyleAttributes" /></xsl:attribute>
  		</xsl:if>
  </xsl:template>
  
  <xsl:template name="CompletionDate">
		<div class="label">
			<xsl:call-template name="AddItalicFontStyleForLatinLang" />
			
			<xsl:choose>
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web'))">
					<xsl:value-of select="concat(':',$common_table/label[@name ='DateOfTheActualCompletionOfTheInternationalSearch'])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($common_table/label[@name ='DateOfTheActualCompletionOfTheInternationalSearch'], ':')"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div class="text" style="padding-left:10px;">
			<b>
			<xsl:choose>
			  <xsl:when test="//srep-for-pub/srep-admin/date-search-completed/date">
					<xsl:apply-templates select="//srep-for-pub/srep-admin/date-search-completed" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="//srep-info-admin/date-opinion-completed" />
				</xsl:otherwise>
			  </xsl:choose>
			</b>
		</div>
   </xsl:template>
   
    <xsl:template name="MailingDate">
		<div class="label">
			<xsl:call-template name="AddItalicFontStyleForLatinLang">
				<xsl:with-param name="otherStyleAttributes" select="'margin-top:6px;'"/>
			</xsl:call-template>
			
			<xsl:choose>
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web'))">
					<xsl:value-of select="concat(':', $common_table/label[@name ='DateOfMailingOfTheInternationalSearchReport'])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($common_table/label[@name ='DateOfMailingOfTheInternationalSearchReport'], ':')"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div style="padding-left:10px;">
			<b>
				<xsl:call-template name="getMailingDate" />	
			</b>
		</div>
   </xsl:template>
   
   <xsl:template name="getMailingDate">
   		<xsl:choose>
			<xsl:when test="//srep-for-pub/srep-admin/date-search-report-mailed/date">
				<xsl:apply-templates select="//srep-for-pub/srep-admin/date-search-report-mailed">
					<xsl:with-param name="divClass" select="'text-bold-nowrap'" />
					<xsl:with-param name="id" select="'reportMailingDate'"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="//srep-info/srep-info-admin/date-search-report-mailed">
					<xsl:with-param name="divClass" select="'text-bold-nowrap'" />
					<xsl:with-param name="id" select="'reportMailingDate'"/>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>		
   </xsl:template>
   
  <xsl:template name="AuthorizedOfficer">
		<div class="label">
			<xsl:call-template name="AddItalicFontStyleForLatinLang" />
			
			<xsl:choose>
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web'))">
					<xsl:value-of select="concat(':', $common_table/label[@name ='AuthorizedOfficer'])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($common_table/label[@name ='AuthorizedOfficer'], ':')"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div>
			<xsl:choose>
				<xsl:when test="//srep-admin/examiners/authorized-officer">
					<xsl:apply-templates select="//srep-admin/examiners/authorized-officer" />
				</xsl:when>
				<xsl:when test="//srep-info-admin/authorized-officer">
					<xsl:apply-templates select="//srep-info-admin/authorized-officer" />
				</xsl:when>
			</xsl:choose>
		</div>
   </xsl:template>

	<xsl:template match="authorized-officer">
   		<xsl:call-template name="openDIVwithNodePath" />
   			<div style="padding-left:10px;">
   				<b><xsl:value-of select="./name" /></b>
   			</div>
				
			<xsl:if test="./phone">
				<div>
					<xsl:call-template name="AddItalicFontStyleForLatinLang" />
					<xsl:value-of select="$common_table/label[@name ='TelNo']"/>
					<xsl:value-of select="' '" />
					<b><xsl:value-of select="./phone" /></b>
				</div>
			</xsl:if>
			<xsl:if test="./fax">
				<div>
					<xsl:call-template name="AddItalicFontStyleForLatinLang" />
					<xsl:value-of select="$common_table/label[@name ='FaxNo']"/>
					<xsl:value-of select="' '" />
					<b><xsl:value-of select="./fax" /></b>
				</div>
			</xsl:if>
   		<xsl:call-template name="closeDIV" />
   </xsl:template>
   
	<!-- srep-office
	<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "addressbook"/>
			</xsd:sequence>
		</xsd:complexType> 

  <!ELEMENT addressbook ((%name_group; , address , phone* , fax* , email* , url* , ead* , dtext?) | text)>
  <!ENTITY % name_group "((name | (prefix? , (last-name | orgname) , first-name? , middle-name? , first-last-name? , second-last-name? , suffix? , iid? , role? , orgname? , department? , synonym*)) , registered-number?)">
 -->
 	<xsl:template match="addressbook">
		<xsl:call-template name="openDIVwithNodePath" />
			<b>
				<div>
					<xsl:choose>
						<xsl:when test="./name">
							<xsl:value-of select="./name" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="./prefix"> 
								<xsl:value-of select="concat(./prefix, ' ')" />
							</xsl:if>
							
							<xsl:value-of select="./orgname" />
							<xsl:value-of select="./last-name" />
							
							<xsl:if test="./prefix"> 
								<xsl:value-of select="concat(./prefix, ' ')" />
							</xsl:if>
							
						</xsl:otherwise>
					</xsl:choose>						
				</div>
				
				<xsl:choose>
					<xsl:when test="./address/country ='CN' and $langOriginal='zh'">
						<xsl:variable name="countryName">
							<xsl:call-template name="LookupCountryText">
								<xsl:with-param name="country" select="./address/country"/>
								<xsl:with-param name="countryLang" select="$langOriginal"/>
							</xsl:call-template>
						</xsl:variable>
						
						<xsl:if test="not(starts-with(./address/address-1, $countryName))">
							<xsl:value-of select="$countryName" />
						</xsl:if>
						
						<xsl:call-template name="FormatAddress">
							<xsl:with-param name="address_arg" select="."/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="FormatAddress">
							<xsl:with-param name="address_arg" select="."/>
						</xsl:call-template>
						<xsl:if test="./address/country and string-length(./address/country) > 0">
							<div>
								<xsl:call-template name="LookupCountryText">
									<xsl:with-param name="country" select="./address/country"/>
									<xsl:with-param name="countryLang" select="$langOriginal"/>
								</xsl:call-template>
							</div>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</b>
			<xsl:if test="./phone">
				<div>
					<xsl:call-template name="AddItalicFontStyleForLatinLang" />
					<xsl:value-of select="$common_table/label[@name ='TelNo']"/>
					<xsl:value-of select="' '" />
					<b><xsl:value-of select="./phone" /></b>
				</div>
			</xsl:if>
			<xsl:if test="./fax">
				<div>
					<xsl:call-template name="AddItalicFontStyleForLatinLang" />
					<xsl:value-of select="$common_table/label[@name ='FaxNo']"/>
					<xsl:value-of select="' '" />
					<b><xsl:value-of select="./fax" /></b>
				</div>
			</xsl:if>
				
		<xsl:call-template name="closeDIV" />
	</xsl:template>
		
	<xsl:template name="FormatAddress">
		<xsl:param name="address_arg"/>
		<xsl:param name="country" select="$address_arg/address/country"/>
		<xsl:choose>
			<xsl:when test="$address_arg/address/text">
				<xsl:value-of select="$address_arg/address/text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$address_arg/address/*[not(name(.)='city' or name(.)='state' or name(.)='postcode' or name(.)='country')]">
					<xsl:if test="./text() != ''">
						<xsl:variable name="tmpAddr">
							<xsl:choose>
								<xsl:when test="./text() = 'p.b. 5818'"> <!-- CORRECTION OF EP CASES -->
									<xsl:value-of select="'P.B. 5818'"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="."/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:value-of select="$tmpAddr"/>
						<xsl:if test="./following-sibling::*/text() != ''">
							<xsl:choose>
								<xsl:when test="$country='CN'">
									<xsl:text>  </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>, </xsl:text>
								</xsl:otherwise>	
							</xsl:choose>		
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<xsl:choose>
					<xsl:when test="$country='AU' or $country='CA' or $country='CN' or $country='GB' or $country='KR' or $country='JP' or $country='US'">
						<xsl:if test="$address_arg/address/city/text() != ''">
							<xsl:value-of select="$address_arg/address/city"/>
							<xsl:if test="./following-sibling::*/text() != ''">
								<xsl:choose>
									<xsl:when test="$country='CN'">
										<xsl:text>  </xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>, </xsl:text>
									</xsl:otherwise>	
								</xsl:choose>					
							</xsl:if>
						</xsl:if>
						<xsl:if test="$address_arg/address/state/text() != ''">
							<xsl:value-of select="$address_arg/address/state"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="$address_arg/address/postcode/text() != ''">
							<xsl:value-of select="$address_arg/address/postcode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="$address_arg/address/postcode/text() != ''">
							<xsl:value-of select="$address_arg/address/postcode"/>
							<xsl:if test="./following-sibling::*/text() != ''">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$address_arg/address/city/text() != ''">
							<xsl:value-of select="$address_arg/address/city"/>
							<xsl:if test="./following-sibling::*/text() != ''">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$address_arg/address/state/text() != ''">
							<xsl:value-of select="$address_arg/address/state"/>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="name_group">
		<xsl:call-template name="openDIVwithNodePath" />
		<xsl:choose>
			<xsl:when test="name">
				<xsl:value-of select="name" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="last-name or orgname">
					<xsl:if test="prefix">
						<xsl:value-of select="prefix"></xsl:value-of>
					</xsl:if>
					<xsl:value-of select="$spaceNbsp" />
					<xsl:choose>
						<xsl:when test="last-name">
							<xsl:value-of select="last-name" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="orgname" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="first-name or middle-name">
					<xsl:value-of select="', '" />
					<xsl:if test="first-name">
						<xsl:value-of select="first-name"></xsl:value-of>
					</xsl:if>
					<xsl:if test="first-name and middle-name">
						<xsl:value-of select="$spaceNbsp" />
						<xsl:value-of select="middle-name"></xsl:value-of>
					</xsl:if>
				</xsl:if>

				<xsl:if test="first-last-name">
					<xsl:value-of select="first-last-name"></xsl:value-of>
				</xsl:if>
				<xsl:if test="second-last-name">
					<xsl:value-of select="second-last-name"></xsl:value-of>
				</xsl:if>
				<xsl:if test="suffix">
					<xsl:value-of select="$spaceNbsp" />
					<xsl:value-of select="suffix"></xsl:value-of>
				</xsl:if>
				<xsl:if test="iid">
					<xsl:value-of select="$spaceNbsp" />
					<xsl:value-of select="iid"></xsl:value-of>
				</xsl:if>
				<xsl:if test="role">
					<xsl:value-of select="$spaceNbsp" />
					<xsl:value-of select="role"></xsl:value-of>
				</xsl:if>
				<xsl:if test="orgname">
					<xsl:value-of select="$spaceNbsp" />
					<xsl:value-of select="orgname"></xsl:value-of>
				</xsl:if>
				<xsl:if test="department">
					<xsl:value-of select="$spaceNbsp" />
					<xsl:value-of select="department"></xsl:value-of>
				</xsl:if>
				<xsl:if test="synonym">
					<xsl:value-of select="$spaceNbsp" />
					<xsl:value-of select="synonym"></xsl:value-of>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	 
<!-- 	<xsl:template match="orgname">
		<xsl:call-template name="getCurrentNodeWithChildrenInDIV" >
			<xsl:with-param name="LabelText" select="'Office: '"></xsl:with-param>
		</xsl:call-template>
	</xsl:template> -->

	<xsl:template match="address">
		<xsl:call-template name="openDIVwithNodePath" />
			<xsl:if test="address-1">
				<span>
					<xsl:variable name="addr1">
						<xsl:choose>
							<xsl:when test="address-1 = 'p.b. 5818'"> <!-- CORRECTION OF EP CASES -->
								<xsl:value-of select="translate(address-1, 'pb', 'PB')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="address-1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="$addr1"/>
										
					<xsl:if test="address-2">
						<xsl:value-of select="', '"/>
						<xsl:value-of select="address-2"/>
					</xsl:if>
					<xsl:if test="address-3">
						<xsl:value-of select="', '"/>
						<xsl:value-of select="address-3"/>
					</xsl:if>
					<xsl:if test="address-4">
						<xsl:value-of select="', '"/>
						<xsl:value-of select="address-4"/>
					</xsl:if>
					<xsl:if test="address-5">
						<xsl:value-of select="', '"/>
						<xsl:value-of select="address-5"/>
					</xsl:if>
				</span>
			</xsl:if>
			<xsl:if test="room">
				<span><xsl:value-of select="room" /></span>
			</xsl:if>
			<xsl:if test="address-floor">
				<span><xsl:value-of select="address-floor" /></span>
			</xsl:if>
			<xsl:if test="building">
				<span><xsl:value-of select="building" /></span>
			</xsl:if>
			<xsl:if test="street">
				<span><xsl:value-of select="street" /></span>
			</xsl:if>
			<xsl:if test="city">
				<span>, <xsl:value-of select="city" /></span>
			</xsl:if>
			<xsl:if test="county">
				<span>, <xsl:value-of select="country" /></span>
			</xsl:if>
			<xsl:if test="state">
				<span>, <xsl:value-of select="state" /></span>
			</xsl:if>
			<xsl:if test="postcode">
				<span>, <xsl:value-of select="postcode" /></span>
			</xsl:if>
			<xsl:if test="country">
				<span>, <xsl:value-of select="country" /></span>
			</xsl:if>			
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<xsl:template match="phone|fax|email|dtext">
		<xsl:value-of select="." />
	</xsl:template>
	
	<!--
	
   <xsl:template match="//srep-request-received-date">
		<xsl:call-template name="openDIVwithNodePath" />
			<i>
			<xsl:choose>
				<xsl:when test="name()='srep-request-received-date'">
					 <xsl:text>Date request received:</xsl:text> 
					<xsl:value-of select="$common_table/label[@name ='DateOfReceipt']"/>:
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Date: </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			</i>
			<xsl:call-template name="format_short_date">
				<xsl:with-param name="date" select="."></xsl:with-param>
				<xsl:with-param name="lang" select="$lang"></xsl:with-param>
			</xsl:call-template>
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	-->
	
	<xsl:template name="OtherInfo">
		<H4>Other Infomation</H4>
		<xsl:apply-templates select="srep-other-info"/>
	</xsl:template>
	
	<xsl:template match="srep-other-info">
		<xsl:apply-templates />
	</xsl:template>	
	
	<xsl:template match="srep-information">
		<xsl:value-of select="@srep-code"></xsl:value-of>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="srep-request-received-date">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template name="EarlierSearches">
		<b>Earlier Searches:</b>
		<xsl:for-each select="earlier-search">
			<xsl:apply-templates />
		</xsl:for-each>
	</xsl:template>
		
	<!-- earlier-search
	<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "application-reference" minOccurs = "0"/>
				<xsd:element ref = "date-search-completed" minOccurs = "0"/>
			</xsd:sequence>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "office" use = "required" type = "xsd:string"/>
			<xsd:attribute name = "srep-type" use = "required">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:NMTOKEN">
						<xsd:enumeration value = "international-type"/>
						<xsd:enumeration value = "isr"/>
						<xsd:enumeration value = "sisr"/>
						<xsd:enumeration value = "national"/>
						<xsd:enumeration value = "national-supplementary"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
			<xsd:attribute name = "declaration-of-no-search" use = "required">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:NMTOKEN">
						<xsd:enumeration value = "yes"/>
						<xsd:enumeration value = "no"/>
						<xsd:enumeration value = "not-determined"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
		</xsd:complexType>
	 -->
	<xsl:template match="earlier-search">
		<xsl:apply-templates /><!-- *** NEED WORK  -->
	</xsl:template>
	
	<xsl:template name="BasisOfTheReport">
		<xsl:apply-templates select="/search-report/srep-info/srep-basis" />
	</xsl:template>
 		   		
	<!-- Child Elements of "srep-basis":
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "translation-of-appl"/>
				<xsd:element ref = "sequence-list-basis" minOccurs = "0"/>
				<xsd:element ref = "srep-rectification-of-obvious-mistake" minOccurs = "0"/>
				<xsd:element ref = "srep-earlier-search-or-declaration-considered" minOccurs = "0" maxOccurs = "unbounded"/>
			</xsd:sequence>
		</xsd:complexType>
	 -->
	<xsl:template match="srep-basis">
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="id" select="pt1-1"/>
		</xsl:call-template>
		
		<div class="indent20">
			<table cellpadding="0">
				<tr valign="top">
					<td><xsl:value-of select="'a. '" /></td>
					<td>
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text07']"/>
						<div class="indent20">
							<xsl:apply-templates select="translation-of-appl"/>
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td><xsl:value-of select="'b. '" /></td>
					<td>
						<xsl:call-template name="srep-rectification-of-obvious-mistake" />
					</td>
				</tr>
				<tr valign="top">
					<td><xsl:value-of select="'c. '" /></td>
					<td>
						<xsl:call-template name="material-of-sequence-list" />			
					</td>
				</tr>	
			</table>
		</div>

		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
<!-- 	<xsl:template name="BasisOfTheReport_a_Label">
		<div class="indent20">
			<xsl:value-of select="'a. '" />
			With regard to the language, this international search was carried out on the basis of		
			<xsl:apply-templates select="$form_table/label[@name ='ISA210Text07']"/>
			<xsl:value-of select="' '" />
		</div>	
	</xsl:template> -->
		
	<xsl:template match="translation-of-appl">
			<table cellpadding="0">
				<tr valign="top">
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(not(@translation='yes'))" />
						</xsl:call-template>							
					</td>
					<td><!-- the international application in the language in which it was filed. -->
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text08']"/>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(@translation='yes')" />
						</xsl:call-template>	
					</td>
					<td>
						<!-- a translation from the original language into the following language //-->
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text09a']"/>
						
						<u><b>
							<xsl:choose>
								<xsl:when test="@lang and (string-length(@lang) &gt; 0) and boolean(@translation='yes')">
									<xsl:call-template name="LookupLanguageText">
										<xsl:with-param name="language_name" select="substring(translate(@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),1,2)"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>				
									<xsl:call-template name="spaces">
										<xsl:with-param name="count" select="40"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</b></u>
						
						<!-- which is the language of a translation furnished for the purposes of  -->
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text09b']"/>
<!-- 						<xsl:call-template name="closeDIV"/>	 -->			
						<!-- (under Rules 12.3 and 23.1(b))  -->
					</td>
				</tr>
			</table>
	</xsl:template>	

	
	<xsl:template name="srep-rectification-of-obvious-mistake">
			<table cellpadding="0">
				<tr valign="top">
					<td valign="top">
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-rectification-of-obvious-mistake)" />
						</xsl:call-template>	
					</td>
					<td valign="top">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210Text10']"/>
					</td>
				</tr>
			</table>
	</xsl:template>
	
	<!-- material-of-sequence-list
	<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "sequence-listing-material-type"/>
				<xsd:element ref = "sequence-listing-material-format"/>
				<xsd:element ref = "sequence-listing-filing-time"/>
			</xsd:sequence>
		</xsd:complexType>
	 -->
	<xsl:template name="material-of-sequence-list">
		  <!-- 1.c 
			With regard to any nucleotide and/or amino acid sequence disclosed in the
	       international application...
	        -->
	       <table cellpadding="0">				
				<tr valign="top">
					<td>					
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//material-of-sequence-list/*/@*='yes')" />
						</xsl:call-template>
					</td>
 					<td>
 						<xsl:choose>
							<xsl:when test="boolean(//material-of-sequence-list/*/@*='yes')" >
								<xsl:value-of select="'1. '" />
		 		   			</xsl:when>
		 		   			<xsl:otherwise>
		 		   				<xsl:value-of select="''" />
		 		   			</xsl:otherwise>
	 		   			</xsl:choose>
	 		   		</td>
	 		   		<td>	
	 		   			<xsl:choose>
							<xsl:when test="($version_indicator &lt; 201501) or ($version_indicator = '')">
								<xsl:apply-templates select="$form_table/label[@name ='ISA210Text27']"/>
		 		   			</xsl:when>
		 		   			<xsl:otherwise>
		 		   				<xsl:apply-templates select="$form_table/label[@name ='ISA210-WithRegardToNucleotideAndAminoAcidSequence']"/>
		 		   			</xsl:otherwise>
	 		   			</xsl:choose>
 					</td>
				</tr>
			</table>
			
			<!-- Only show the details if the parent is checkedd  -->
			<xsl:if test="boolean(//material-of-sequence-list/*/@*='yes')">
				<!-- 1.c.1 details -->
				<div class="indent">
					<xsl:choose>
						<xsl:when test="($version_indicator &lt; 201501) or ($version_indicator = '')">
							<xsl:call-template name="Box1-c"/>
	 		   			</xsl:when>
	 		   			<xsl:otherwise>
	 		   				<xsl:call-template name="Box1-c-FormVersion201501"/>
	 		   			</xsl:otherwise>
			   		</xsl:choose>
	 		   	</div>
	 		   	
	 		   	<!-- 1.c.2 and 1.c.3 -->
	 		   	<div class="indent20">	
					<table cellpadding="0">
						<tr valign="top">
							<td>2. </td>
							<td>
								<!--  In addition, in the case of .. -->
								<div>
									<table cellpadding="0">
										<tr valign="top">
											<td align="left" style="marging-left:0px">
												<xsl:call-template name="BoxToCheck">
													<xsl:with-param name="check_condition" select="boolean(//srep-basis/sequence-list-basis/presentation-of-statements)" />
												</xsl:call-template>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="($version_indicator &lt; 201501) or ($version_indicator = '')">
														<xsl:apply-templates select="$form_table/label[@name ='ISA210Text28']"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="$form_table/label[@name ='ISA210-InAdditionInTheCaseThatMoreThanOneVersion']"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
	
	 					<tr valign="top">
							<td>3. </td>
							<td>		
								<!--  Additional comments: -->
								<div>
									<xsl:apply-templates select="$common_table/label[@name ='AdditionalComments']"/>
									<xsl:apply-templates select="$common_table/label[@name ='MarkColon']"/>
								</div>
								<div class="marginBottom">
									<table cellpadding="0">
									<xsl:apply-templates select="//srep-basis/sequence-list-basis/additional-info" mode="SQUARE_BRACKED"/>
									</table>
								</div>
											
							</td>
						</tr>
					</table>
				</div>
			</xsl:if>			
	</xsl:template>
	
	<!-- NOT HANDLED IN PDF ? 
		Note: since "sequence-listing" attribute in "sequence-listing-material-type" is default to true, 
	
	  if it is not specified to "no", "material-of-sequence-list" will always be checked
	  
	  <!ATTLIST sequence-listing-material-type  sequence-listing   (yes | no )  'yes'
                                            table              (yes | no )  #REQUIRED >
	
	-->
	<xsl:template match="sequence-listing-material-type">	
		<xsl:if test="@table='yes'">
			<div class="indent">
				<tr>
					<td>
						<span>
							<xsl:call-template name="AddItalicFontStyleForLatinLang" />	
							<xsl:text>Type of material: </xsl:text><!-- TODO: TO BE DEFINED -->
						</span>	
					</td>
					<td>
						<xsl:if test="@sequence-listing='yes'">
							<xsl:text>Sequence listing</xsl:text>
						</xsl:if>
					
						<xsl:if test="@table='yes'">
							<xsl:if test="@sequence-listing ='yes'"><xsl:text>, </xsl:text></xsl:if>
							<xsl:text>Table</xsl:text>
						</xsl:if>			
					</td>
				</tr>
			</div>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="Box1-c">
		<div class="indent30">	
	       <table cellpadding="0">
				<xsl:if test="boolean(//material-of-sequence-list/*/@*='yes')">
					<xsl:call-template name="sequence-listing-material-format"/>
					<xsl:call-template name="sequence-listing-filing-time"/>			
				</xsl:if>
			</table>
		</div>
	</xsl:template>
	
	<!-- 
	NOTE: There are version issue here!!
	
	<xsl:when test="(($version_indicator &lt; 201501) or ($version_indicator = ''))
		or ($lang != 'zh' and $lang != 'en' and $lang != 'fr' and $lang != 'de' and $lang != 'es' and $lang != 'ko')">
		
	TODO	
	 -->
	<xsl:template name="Box1-c-FormVersion201501">	
		<!--  Box No. I c.1. a -->
		<div class="indent30">
 			<table cellpadding="0" >
				<tr valign="top">
					<td>a. </td>
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="//material-of-sequence-list/sequence-listing-filing-time/@in-application = 'yes' "/>
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210-FormingPartOfTheInternationalApplicationAsFiled']"/>
					</td>
				</tr>
			</table> 
			
			<table cellpadding="0" class="indent30">
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="(//material-of-sequence-list/sequence-listing-filing-time/@in-application = 'yes' )
														and (//material-of-sequence-list/sequence-listing-material-format/@electronic = 'yes')"/>
					<xsl:with-param name="itemTitle">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210-InTheFormOfAnnexCST25']"/>
					</xsl:with-param>
				</xsl:call-template>
			
			
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="(//material-of-sequence-list/sequence-listing-filing-time/@in-application = 'yes')
																and (//material-of-sequence-list/sequence-listing-material-format/@paper = 'yes')"/>
					<xsl:with-param name="itemTitle">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210-OnPaperOrImageFile']"/>
					</xsl:with-param>
				</xsl:call-template>
			</table>
		</div>
		
		<!--  Box No. I c.1. b -->
		<div class="indent30">
			<table cellpadding="0" >
				<tr valign="top">
					<td>b.</td>
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="(//material-of-sequence-list/sequence-listing-filing-time/@together-with-application = 'yes')
																			and (//material-of-sequence-list/sequence-listing-material-format/@electronic = 'yes')"/>

						</xsl:call-template>
					</td>
					<td><xsl:apply-templates select="$form_table/label[@name ='ISA210-FurnishedTogetherWithTheIAUnderPCTRule13ter1']"/></td>
				</tr>
			</table>
		</div>
		
		<!--  Box No. I c.1. c -->
		<div class="indent30">
			<table cellpadding="0" >
				<tr valign="top">
					<td>c. </td>
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="//material-of-sequence-list/sequence-listing-filing-time/@furnished-for-search = 'yes' "/>
						</xsl:call-template>
					</td>
					<td colspan="1">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210-FurnishedSubsequentToTheInternationalFilingDate']"/>
					</td>
				</tr>
			</table>
			
			<table cellpadding="0" class="indent30">
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="(//material-of-sequence-list/sequence-listing-filing-time/@furnished-for-search = 'yes')
															and (//material-of-sequence-list/sequence-listing-material-format/@electronic = 'yes')"/>
					<xsl:with-param name="itemTitle">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210-InTheFormOfAnnexCST25-Rule13ter1a']"/>
					</xsl:with-param>
				</xsl:call-template>
			
			
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="(//material-of-sequence-list/sequence-listing-filing-time/@furnished-for-search = 'yes')
															and (//material-of-sequence-list/sequence-listing-material-format/@paper = 'yes')"/>
					<xsl:with-param name="itemTitle">
						<xsl:apply-templates select="$form_table/label[@name ='ISA210-OnPaperOrImageFile-Rule13ter1bAndAI713']"/>
					</xsl:with-param>
				</xsl:call-template>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="sequence-listing-material-format">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
			<tr>
				<td>a.</td>
				<td colspan="2">
					<span>
						<xsl:call-template name="AddItalicFontStyleForLatinLang" />
						<xsl:value-of select="'('"/>
						<xsl:apply-templates select="$common_table/label[@name ='Means']"/>
						<xsl:text>): </xsl:text>
					</span>
				</td>
			</tr>
			
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="isChecked" select="boolean(//material-of-sequence-list/sequence-listing-material-format[@paper='yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:apply-templates select="$common_table/label[@name ='OnPaper']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="isChecked" select="boolean(//material-of-sequence-list/sequence-listing-material-format[@electronic='yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:apply-templates select="$common_table/label[@name ='InElectronicForm']"/>
				</xsl:with-param>
			</xsl:call-template>
			
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<xsl:template name="sequence-listing-filing-time">
<!-- 			<xsl:call-template name="openDIVwithNodePath"/> -->
				<tr>
					<td>b.</td>
					<td colspan="2">
						<span>
							<xsl:call-template name="AddItalicFontStyleForLatinLang" />
							<xsl:text disable-output-escaping="yes">    (</xsl:text>
							<xsl:apply-templates select="$common_table/label[@name ='Time_submitted']"/>
							<xsl:text>): </xsl:text>
						</span>					
					</td>
				</tr>
				
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="boolean(//material-of-sequence-list/sequence-listing-filing-time[@in-application='yes'])"/>
					<xsl:with-param name="itemTitle">
						<xsl:apply-templates select="$common_table/label[@name ='InTheInternationalApplicationAsFiled']"/>
					</xsl:with-param>
				</xsl:call-template>
				
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="boolean(//material-of-sequence-list/sequence-listing-filing-time[@together-with-application='yes'])"/>
					<xsl:with-param name="itemTitle">
						<xsl:choose>
							<xsl:when test="$lang='ko'">
								<xsl:apply-templates select="$form_table/label[@name ='TogetherWithTheInternationalApplicationInElectronicForm-ISA237-KO']"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="$common_table/label[@name ='TogetherWithTheInternationalApplicationInElectronicForm']"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
				
				<xsl:call-template name="BoxGeneral">
					<xsl:with-param name="isChecked" select="boolean(//material-of-sequence-list/sequence-listing-filing-time[@furnished-for-search='yes'])"/>
					<xsl:with-param name="itemTitle">
						<xsl:apply-templates select="$common_table/label[@name ='SubsequentlyToThisAuthorityForThePurposesOfSearch']"/>
					</xsl:with-param>
				</xsl:call-template>
				
				<!-- NOT DEFINED IN PDF  -->
				<xsl:if test="@amendment='yes'"> 
					<xsl:call-template name="BoxGeneral">
						<xsl:with-param name="isChecked" select="boolean(//material-of-sequence-list/sequence-listing-filing-time[@amendment='yes'])"/>
						<xsl:with-param name="itemTitle">
							<xsl:text> in amendment (TO BE DEFINED) </xsl:text> 
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				
<!-- 			<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
<!-- 	<xsl:template match="presentation-of-statements">
		<xsl:call-template name="openDIVwithNodePath" />
		
		<xsl:call-template name="closeDIV" />
		
		<b><xsl:value-of select="name()" /></b>
		<xsl:apply-templates />
	</xsl:template> -->
	
	<xsl:template match="srep-declaration/srep-declaration-subject-matter">
		<xsl:if test="@scientific-theories= 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text03']"/></div></xsl:if>
		<xsl:if test="@mathematic-theories='yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text04']"/></div></xsl:if>
		<xsl:if test="@plant-varieties = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text05']"/></div></xsl:if>
		<xsl:if test="@animal-varieties= 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text06']"/></div></xsl:if>
		<xsl:if test="@bio-processes = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text07']"/></div></xsl:if>
		<xsl:if test="@business = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text08']"/></div></xsl:if>
		<xsl:if test="@mental-act= 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text09']"/></div></xsl:if>
		<xsl:if test="@games= 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text10']"/></div></xsl:if>
		<xsl:if test="@treatment-human = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text11']"/></div></xsl:if>
		<xsl:if test="@treatment-animal = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text12']"/></div></xsl:if>
		<xsl:if test="@diagnostic-methods = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text13']"/></div></xsl:if>
		<xsl:if test="@presentation-information= 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text14']"/></div></xsl:if>
		<xsl:if test="@computer-program = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text15']"/></div></xsl:if>		
	</xsl:template>
	
	<xsl:template match="srep-declaration/srep-declaration-compliance">
		<xsl:if test="@description = 'no'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$common_table/label[@name ='TheDescription']"/></div></xsl:if>
		<xsl:if test="@claims = 'no'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$common_table/label[@name ='TheClaims']"/></div></xsl:if>
		<xsl:if test="@drawings = 'no'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$common_table/label[@name ='TheDrawings']"/></div></xsl:if>
	</xsl:template>
	
	<xsl:template match="srep-declaration/srep-declaration-sequence-listing">
		<xsl:choose>
			<xsl:when test="($version_indicator &lt; 201501) or ($version_indicator = '')">
				<xsl:if test="@paper = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text18']"/></div></xsl:if>
				<xsl:if test="@electronic = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text19']"/></div></xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@electronic = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203-furnishASequenceListingInTheFormOfAnnexCST25']"/></div></xsl:if>
				<xsl:if test="@paper = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203-furnishASequenceListingOnPaper']"/></div></xsl:if>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="@late-furnishing-fee = 'yes'"><div class="indent20"><xsl:call-template name="CheckBox_Checked"/><xsl:apply-templates select="$form_table/label[@name ='ISA203Text20']"/></div></xsl:if>
	</xsl:template>
	
	<xsl:template match="additional-info">
		<xsl:call-template name="openDIVwithNodePath" />
			<xsl:apply-templates select="./p" />
		<xsl:call-template name="closeDIV" />
	</xsl:template>
		
	<!-- srep-earlier-search-or-declaration-considered
		<xsd:complexType>
			<xsd:attribute name = "taken-into-account" default = "yes">
				<xsd:simpleType>
					<xsd:restriction base = "xsd:token">
						<xsd:enumeration value = "yes"/>
						<xsd:enumeration value = "no"/>
						<xsd:enumeration value = "not-available"/>
					</xsd:restriction>
				</xsd:simpleType>
			</xsd:attribute>
			<xsd:attribute name = "idref" type = "xsd:IDREF"/>
		</xsd:complexType>
	 -->
	<xsl:template match="srep-earlier-search-or-declaration-considered">
		<br/>
		<xsl:call-template name="openDIVwithNodePath">
			<xsl:with-param name="attrName" select="'@*'"></xsl:with-param>
		</xsl:call-template>
			<xsl:text>This supplementary international search report has been established taking due account of the international search report, or the delaration under Article 17(2)(a) that no international search report
			 will be established, and the written opinion established under Rule 43bis.1.</xsl:text>
			 
			 <!--  The idref attribute refers to the corresponding earliersearch element, @idref TO DO-->
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	
	<!-- /////////////////////////////////////////////////////////////////// -->
	<!-- 
		INTERNATIONAL SEARCH REPORT (ISR) - PART 2	
	 -->	
	<!-- 
		==============================
		srep-for-pub
		=============================
		Child Elements of srep-for-pub	
		<xsd:complexType>
			<xsd:choice>
				<xsd:element ref = "doc-page" maxOccurs = "unbounded"/>
				<xsd:sequence>
					<xsd:element ref = "classification-ipc" minOccurs = "0"/>
					<xsd:element ref = "classifications-ipcr" minOccurs = "0"/>
					<xsd:element ref = "classification-national" minOccurs = "0"/>
					<xsd:element ref = "srep-fields-searched"/>
					<xsd:element ref = "srep-citations"/>
					<xsd:element ref = "srep-incomplete-search" minOccurs = "0"/>
					<xsd:element ref = "srep-declaration" minOccurs = "0"/>
					<xsd:element ref = "srep-admin" minOccurs = "0"/>
					<xsd:element ref = "srep-patent-family" minOccurs = "0"/>
					<xsd:element ref = "srep-earlier-search" minOccurs = "0" maxOccurs = "unbounded"/>
					<xsd:element ref = "sisr-scope" minOccurs = "0"/>
				</xsd:sequence>
			</xsd:choice>
		</xsd:complexType>	
	 -->
 	
	<xsl:template match="srep-for-pub">
		<!-- FORM 210 -->
		<xsl:if test="$form_number='210'">
		
		<div>
			<xsl:call-template name="ReportHeaderPart">
				<xsl:with-param name="partNum" select="'2'"/>
			</xsl:call-template>	
			
			<div class="contentBlock">	
				<xsl:call-template name="openDIVwithNodePath">
					<xsl:with-param name="childName" select="'classifications-ipcr'" />
				</xsl:call-template>
						
				<H4><a name="pt2-A">A. 
					<xsl:call-template name="uppercaser">
						<xsl:with-param name="string" select="$common_table/label[@name ='ClassificationOfSubjectMatter']" />
					</xsl:call-template>
				   </a>
				</H4>
				<xsl:call-template name="closeDIV" />
							
				<xsl:call-template name="IPCInfo"/>				
			</div>
			
			<xsl:if test="//srep-fields-searched">
				<div class="contentBlockNoTop">
					<xsl:call-template name="openDIVwithNodePath">
					<xsl:with-param name="childName" select="'srep-fields-searched'" />
					</xsl:call-template>
				
					<H4><a name="pt2-B">B. <xsl:value-of select="translate($common_table/label[@name ='FieldsSearched'], $smallcase, $uppercase)" /></a></H4><!-- FIELDS SEARCHED -->
					<xsl:call-template name="closeDIV" />
					
					<xsl:apply-templates select= "srep-fields-searched" />
				</div>
			</xsl:if>
			
			<xsl:if test="//srep-citations">
				<div class="contentBlockNoTop">
<!-- 					<xsl:call-template name="openDIVwithNodePath">
					<xsl:with-param name="childName" select="'srep-citations'" />
					</xsl:call-template> -->
					
					<H4><a name="pt2-C">C. <xsl:value-of select="translate($common_table/label[@name ='DocumentsConsideredToBeRelevant'], $smallcase, $uppercase)" /></a></H4> <!-- DOCUMENTS CONSIDERED TO BE RELEVANT -->
<!-- 					<xsl:call-template name="closeDIV" /> -->
					
					<xsl:apply-templates select="srep-citations" />
					
					<div class="contentBlockOnlyTop" style="margin-top:3px;">
						<xsl:call-template name="Form210Legend"/>
					</div>	
				</div>
			</xsl:if>
			
			<xsl:if test="//srep-patent-family">
				<div class="contentBlockNoTop">
<!-- 					<xsl:call-template name="openDIVwithNodePath">
						<xsl:with-param name="childName" select="'srep-patent-family'" />
					</xsl:call-template> -->
					
					<H4 ><a name="pt2-D">D. <xsl:value-of select="translate($common_table/label[@name ='InformationOnPatentFamilyMembers'], $smallcase, $uppercase)" /></a></H4> <!-- INFORMATION ON PATENT FAMILY MEMBER -->
<!-- 					<xsl:call-template name="closeDIV" /> -->
					
					<xsl:apply-templates select="srep-patent-family" />					
				</div>
			</xsl:if>
		</div>
		</xsl:if>
		
		<div class="contentBlock" style="margin-top:6px;">
			<xsl:choose>
				<xsl:when test="$lang='ar' and ($forceRightToLeft='true' or not($media = 'web'))">
					<xsl:call-template name="ISAInfo_AR"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="ISAInfo"/>
				</xsl:otherwise>
			</xsl:choose>
	 	</div>
	</xsl:template>
	
	<!-- 
	http://www.wipo.int/ipcpub/#viewmode=f&symbol=C10L0003000000&refresh=page
	 -->
	<xsl:template match="classifications-ipcr">
		<xsl:param name="isEditNode" select="'true'"/>
		
		<xsl:if test="$isEditNode='true'">
			<xsl:call-template name="openDIVwithNodePath" />
		</xsl:if>
		
		<xsl:if test="./classification-ipcr">
			<xsl:call-template name="tab"/>
			<xsl:apply-templates select="classification-ipcr">
				<xsl:sort select="@sequence" data-type="number"/>
			</xsl:apply-templates>
		</xsl:if>

		<xsl:if test="$isEditNode='true'">
			<xsl:call-template name="closeDIV" />
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="classification-ipcr">
		<xsl:param name="addUrl" select="'true'" />

		<xsl:if test="./section">
			<xsl:variable name="version-date" select="./ipc-version-indicator/date" />
			<xsl:variable name="ipcSymbol">
				<xsl:value-of select="./section" />
				<xsl:value-of select="./class" />
				<xsl:value-of select="./subclass" />
				<xsl:value-of select="' '" />
				<xsl:value-of select="./main-group" />
				
				<xsl:if test="./subgroup and string-length(translate(./subgroup, ' ', '')) &gt; 0">
					<xsl:value-of select="'/'" />
					<xsl:value-of select="./subgroup" />
				</xsl:if>
			</xsl:variable>
			
			<i>
				<b>
					<xsl:choose>
						<xsl:when test="$addUrl='true'" >						
							<xsl:variable name="url">
								<xsl:call-template name="ipcUrl">
									<xsl:with-param name="version" select="$version-date"/>
									<xsl:with-param name="section"  select="./section"/>
									<xsl:with-param name="class" select="./class"/>
									<xsl:with-param name="subclass" select="./subclass"/>
									<xsl:with-param name="mainGroup" select="./main-group" />
									<xsl:with-param name="subGroup" select="./subgroup" />
								</xsl:call-template>
							</xsl:variable>
							<a href="{$url}" target="_blank">
								<xsl:value-of select="$ipcSymbol" />
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$ipcSymbol" />
						</xsl:otherwise>
					</xsl:choose>						
				</b>
				
				<!-- Display the date if it is not starting with '9999' -->
				<xsl:if test="$version-date and (string-length($version-date) &gt; 0) 
								and not(starts-with($version-date, '9999'))">
					<xsl:value-of select="' ('" />				
					<xsl:choose>
						<xsl:when test="string-length($version-date) > 4">
							<xsl:value-of select="substring($version-date,1,4)" />
							<xsl:text>.</xsl:text>
							<xsl:value-of select="substring($version-date,5,2)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$version-date" />
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="')'" />
				</xsl:if>
				
				<xsl:variable name="classficationVal" select="translate(./classification-value, $uppercase, $smallcase)" />
				<xsl:value-of select="$classficationVal" />				

				<xsl:if test="not(position()=last())">
					<xsl:value-of select="'; '" />
				</xsl:if>
			</i>
		</xsl:if>
		
		<xsl:if test="./text">
			<i>				
				<xsl:call-template name="showIpcTexts">
					<xsl:with-param name="ipcText" select="./text" />
					<xsl:with-param name="addUrl" select="'true'" />
					<xsl:with-param name="spaceAsSeparator">
						<xsl:choose>
			        	   <xsl:when test="not(contains(./text, ',')) 
			        	        and not(contains(./text, ';')) 
			        	    	and not (contains(./text, $semiColonNonLatin))
				              and not (contains(./text, $fullWidthComma))
				              and not (contains(./text, $smallComma))
			        	   	and contains(./text, ' ') and string-length(translate(./text, translate(./text, $alpha, ''), '')) &gt; 2">
					           <xsl:value-of select="'true'"/>
				           </xsl:when> 
				           <xsl:otherwise>
				           		<xsl:value-of select="'false'"/>
				           </xsl:otherwise>
				          </xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:if test="not(position()=last())">
					<xsl:value-of select="'; '" />
				</xsl:if>
			</i>
		</xsl:if>
	</xsl:template>		
	
	<xsl:template name="ipcUrl">
		<xsl:param name="version"/>
		
		<!-- either: formated ipc symbol -->
		<xsl:param name="symbol" />
		
		<!-- or: elements of the symbol -->
		<xsl:param name="section" />
		<xsl:param name="class" />
		<xsl:param name="subclass" />
		<xsl:param name="mainGroup" />
		<xsl:param name="subGroup" />
		
		<!-- or: ipc text (should be only one IPC!)-->
		<xsl:param name="ipcText" select="''"/>
		
		<xsl:variable name="versionDate">
			<xsl:choose>
				<xsl:when test="contains($ipcText, '(') and contains($ipcText, ')')">  <!-- e.g. H04W 4/02(2009.01)i -->
					<xsl:variable name="retrievedDate" select="translate(substring-before(substring-after($ipcText, '('), ')'), '.-', '')" /> <!-- e.g. 200901 -->
					
					<xsl:choose>
						<xsl:when test="string-length($retrievedDate)=6">
							<xsl:value-of select="concat($retrievedDate, '01')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'20120101'"/>
						</xsl:otherwise>
					</xsl:choose>				
				</xsl:when>
				<xsl:when test="$version and not(starts-with($version, '9999'))">
					<xsl:value-of select="$version"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'20120101'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="ipcSymbol">		
			<xsl:choose>
				<xsl:when test="symbol">
					<xsl:value-of select="$symbol"/>
				</xsl:when>
				<xsl:when test="string-length($ipcText) &gt; 3">
					<xsl:call-template name="formatIpcSymbol">
						<xsl:with-param name="ipcText"  select="$ipcText"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="formatIpcSymbol">
						<xsl:with-param name="section"  select="$section"/>
						<xsl:with-param name="class" select="$class"/>
						<xsl:with-param name="subclass" select="$subclass"/>
						<xsl:with-param name="mainGroup" select="$mainGroup" />
						<xsl:with-param name="subGroup" select="$subGroup" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
				
		<xsl:value-of select="$ipcUrlRoot"/>
		<xsl:value-of select="'&amp;version='" />
		<xsl:value-of select="$versionDate" />
		<xsl:if test="string-length($versionDate)='6'"><xsl:value-of select="'01'" /></xsl:if> <!-- default version date for those missing -->
		<xsl:value-of select="'&amp;symbol='"/>
		<xsl:value-of select="$ipcSymbol" />
	</xsl:template>
	
	<xsl:template name="formatIpcSymbol">
	<!-- 
		Section : 	A to H				(1)     
		Class: 	01 to 99       			(2)
		Subclass: 	A to Z				(1)
	    Main group: 	1 to 9999		(4)
		Subgroup:	00 to 999999		(6)
		
		total length 				=   14 
	 -->
		<xsl:param name="section" />
		<xsl:param name="class" />
		<xsl:param name="subclass" />
		<xsl:param name="mainGroup" />
		<xsl:param name="subGroup" />
		<xsl:param name="ipcText" />
		
		<xsl:variable name="partialSymbol">
			<xsl:choose>
				<xsl:when test="string-length($section)!=0">
					<xsl:value-of select="$section"/>
					<xsl:value-of select="$class"/>
					<xsl:value-of select="$subclass"/>
					<xsl:value-of select="format-number($mainGroup, '0000')" />
					<xsl:value-of select="$subGroup" />				
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="formatIpcTextSymbol">
						<xsl:with-param name="ipcText" select="$ipcText" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>						
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="string-length($partialSymbol) &gt; 4">
				<xsl:call-template name="format-right-padding">
		    		<xsl:with-param name="curString" select="$partialSymbol"/>
					<xsl:with-param name="charForPadding" select="'0'"/>
					<xsl:with-param name="maxLen" select="'14'"/>
		   		</xsl:call-template>			
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$partialSymbol" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="formatIpcTextSymbol">
	<!-- e.g. H04N 7/26(2006.01)i； to be formated -->
		<xsl:param name="ipcText" select="''"/> 
		
		<xsl:variable name="ipcTxt" select="translate($ipcText, ' ', '')"/>
		<xsl:if test="string-length($ipcTxt) &gt; 3">
			<xsl:value-of select="substring($ipcTxt, 1, 4)" /> <!-- e.g. H04N -->
			
			<xsl:if test="string-length($ipcTxt) &gt; 4"> <!-- e.g.  7/26(2006.01)i； -->
				<xsl:variable name="ipcGroup">
					<xsl:choose>
						<xsl:when test="contains($ipcTxt,'(')">
							<xsl:value-of select="substring(substring-before($ipcTxt, '('), 5)" /><!-- e.g. 7/26 -->							
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring($ipcTxt, 5)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					
				<xsl:variable name="mainGroup">
					<xsl:choose>
						<xsl:when test="contains($ipcGroup,'/')">
							<xsl:value-of select="translate(substring-before($ipcGroup, '/'),'*-;_', '')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate($ipcGroup,'*-;_','')" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:variable name="subGroup">
					<xsl:choose>
						<xsl:when test="contains($ipcGroup,'/')">
							<xsl:value-of select="translate(substring-after($ipcGroup, '/'),'*-;_','')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				
				<xsl:if test="string-length($mainGroup) &gt; 0">
					<xsl:value-of select="format-number($mainGroup, '0000')" />
					
					<xsl:call-template name="format-right-padding">
			    		<xsl:with-param name="curString" select="$subGroup"/>
						<xsl:with-param name="charForPadding" select="'0'"/>
						<xsl:with-param name="maxLen" select="'6'"/>
			   		</xsl:call-template>
		   		</xsl:if>		
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="format-left-padding">
		<xsl:param name="curString" />
		<xsl:param name="charForPadding" />
		<xsl:param name="maxLen" />
		
		<xsl:call-template name="format-padding">
		   	<xsl:with-param name="curString" select="$curString"/>
			<xsl:with-param name="charForPadding" select="$charForPadding"/>
			<xsl:with-param name="maxLen" select="$maxLen"/>
			<xsl:with-param name="isRightPadding" select="'false'"/>
	    </xsl:call-template>
	</xsl:template>
	
	<xsl:template name="format-right-padding">
		<xsl:param name="curString" />
		<xsl:param name="charForPadding" />
		<xsl:param name="maxLen" />
		
 		<xsl:call-template name="format-padding">
	    	<xsl:with-param name="curString" select="$curString"/>
			<xsl:with-param name="charForPadding" select="$charForPadding"/>
			<xsl:with-param name="maxLen" select="$maxLen"/>
			<xsl:with-param name="isRightPadding" select="'true'"/>
	    </xsl:call-template> 
	</xsl:template>
	
	<xsl:template name="format-padding">
		<xsl:param name="curString" />
		<xsl:param name="charForPadding" />
		<xsl:param name="maxLen" />
		<xsl:param name="isRightPadding" select="'false'"/>
		
		<xsl:choose>
			<xsl:when test="string-length($curString) &lt; $maxLen">
       			<xsl:call-template name="format-padding">
       				<xsl:with-param name="curString">
       					<xsl:choose>
							<xsl:when test="$isRightPadding='true'">
       							<xsl:value-of select="concat($curString, $charForPadding)" />
       						</xsl:when>
       						<xsl:otherwise>
       							<xsl:value-of select="concat($charForPadding, $curString)" />
       						</xsl:otherwise>
       					</xsl:choose>	
       				</xsl:with-param>
					<xsl:with-param name="charForPadding" select="$charForPadding"/>
					<xsl:with-param name="maxLen" select="$maxLen"/>
					<xsl:with-param name="isRightPadding" select="$isRightPadding"/>
       			</xsl:call-template>
       		</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$curString"/>
			</xsl:otherwise>
         </xsl:choose>
	</xsl:template>
	
	<!-- Separate the IPCs and add URL   -->
	<xsl:template name="showIpcTexts">
		<xsl:param name="ipcText" select="''" />
		<xsl:param name="addUrl" select="'true'" />
		<xsl:param name="spaceAsSeparator" select="'false'" /> <!-- only set at the very first top level call -->
		
		<xsl:variable name="sep" select="';'"/>
		<xsl:variable name="ipcTxt">
			 <xsl:choose>
		        <xsl:when test="contains($ipcText, $semiColonNonLatin)">
		           <xsl:value-of select="translate($ipcText, $semiColonNonLatin, $semiColon)"/>
	           </xsl:when>
	            <xsl:when test="contains($ipcText, $fullWidthComma)">
		           <xsl:value-of select="translate($ipcText, $fullWidthComma, $semiColon)"/>
	           </xsl:when>
	           <xsl:when test="contains($ipcText, $smallComma)">
		           <xsl:value-of select="translate($ipcText, $smallComma, $semiColon)"/>
	           </xsl:when>
	           <xsl:when test="contains($ipcText, ',')">
		           <xsl:value-of select="translate($ipcText, ',', $semiColon)"/>
	           </xsl:when>
	           <xsl:when test="$spaceAsSeparator='true' and contains($ipcText, ' ')">
		           <xsl:value-of select="translate($ipcText, ' ', $semiColon)"/>
	           </xsl:when>
	           <xsl:otherwise>
	           		<xsl:value-of select="$ipcText"/>
	           </xsl:otherwise>
	        </xsl:choose>
	    </xsl:variable>
		
	    <xsl:choose>
	        <xsl:when test="not(contains($ipcTxt, $sep))">
	           <xsl:call-template name="showOneIpcText">
					<xsl:with-param name="ipcText" select="$ipcTxt" />
					<xsl:with-param name="addUrl" select="$addUrl" />
				</xsl:call-template>
	        </xsl:when>
	        <xsl:otherwise>
	            <xsl:call-template name="showOneIpcText">
					<xsl:with-param name="ipcText" select="substring-before($ipcTxt, $sep)" />
					<xsl:with-param name="addUrl" select="$addUrl" />
				</xsl:call-template>

				<xsl:value-of select="'; '" />
				
	            <xsl:call-template name="showIpcTexts">
	                <xsl:with-param name="ipcText" select="substring-after($ipcTxt, $sep)" />
					<xsl:with-param name="addUrl" select="$addUrl" />
	            </xsl:call-template>
	        </xsl:otherwise>
	    </xsl:choose>
	</xsl:template>
	
	<xsl:template name="showOneIpcText">
		<xsl:param name="ipcText" select="''" />
		<xsl:param name="addUrl" select="'true'" />
		
		<xsl:if test="string-length($ipcText) &gt; 3">
			<xsl:choose>
				<xsl:when test="$addUrl='true'" >						
					<xsl:variable name="url">
						<xsl:call-template name="ipcUrl">
							<xsl:with-param name="ipcText"  select="$ipcText"/>
						</xsl:call-template>
					</xsl:variable>
				
					<a href="{$url}" target="_blank">
						<xsl:value-of select="$ipcText"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$ipcText"/>
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:if>
		
		<xsl:if test="string-length($ipcText) &lt; 4">
			<xsl:value-of select="$ipcText"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="IPCInfo">	
		<div><xsl:apply-templates select="//search-report/srep-for-pub/classifications-ipcr" /></div>
		<div class="indent20"><xsl:apply-templates select="//search-report/srep-for-pub/classification-ipc" /></div>
		<div class="indent20"><xsl:apply-templates select="//search-report/srep-for-pub/classification-national" /></div>
		<div class="indent20"><xsl:apply-templates select="$form_table/label[@name ='ISA210Text59']"/></div>
	</xsl:template>

	<!--
	<!ELEMENT classification-national (country , edition? , main-classification , further-classification* , (additional-info | linked-indexing-code-group | unlinked-indexing-code)* , text?)>
	<!ATTLIST classification-national  id ID  #IMPLIED  scheme-name CDATA #IMPLIED> 
	
	<!ELEMENT classification-ipc (edition , main-classification , further-classification* , (additional-info | linked-indexing-code-group | unlinked-indexing-code)* , text?)>
	<!ATTLIST classification-ipc  id ID  #IMPLIED >
 	-->
	<xsl:template match="classification-national | classification-ipc">
		<xsl:param name="addUrl" select="'true'" />
		
		<xsl:call-template name="openDIVwithNodePath" />
		
		<xsl:if test="./@scheme-name">		
			<xsl:value-of select="concat(./@scheme-name, ': ')" />
		</xsl:if>
		<xsl:for-each select=".">
			<xsl:if test="./main-classification">
				<xsl:variable name="ipcSymbol" select="./main-classification" />
				<i>
					<b>
						<xsl:choose>
							<xsl:when test="$addUrl='true'" >
								<xsl:variable name="url">
									<xsl:call-template name="ipcUrl">
										<xsl:with-param name="symbol" select="$ipcSymbol"/>
									</xsl:call-template>
								</xsl:variable>
								<a href="{$url}" target="_blank">
									<xsl:value-of select="$ipcSymbol" />
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$ipcSymbol" />
							</xsl:otherwise>
						</xsl:choose>						
					</b>
				</i>		
				<xsl:value-of select="'; '" />
			</xsl:if>
			<xsl:for-each select="./further-classification">
				<i>
					<b>
						<xsl:choose>
							<xsl:when test="$addUrl='true'" >
								<xsl:variable name="url2">
									<xsl:call-template name="ipcUrl">
										<xsl:with-param name="symbol" select="."/>
									</xsl:call-template>
								</xsl:variable>
								<a href="{$url2}" target="_blank">
									<xsl:value-of select="." />
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="." />
							</xsl:otherwise>
						</xsl:choose>						
					</b>
				</i>
				<xsl:if test="not(position()=last())">	
					<xsl:value-of select="'; '" />
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>
		
	<!-- srep-fields-searched
		<xsd:complexType>
			<xsd:sequence>
				<xsd:element ref = "minimum-documentation"/>
				<xsd:element ref = "other-documentation" minOccurs = "0" maxOccurs = "unbounded"/>
				<xsd:element ref = "database-searched" minOccurs = "0"/>
			</xsd:sequence>
		</xsd:complexType>
	 -->
	<xsl:template match="srep-fields-searched">
		<xsl:call-template name="openDIVwithNodePath" />
		
		<div class="contentBlockTopOnlyNoPaddingNoMargin">
			<xsl:call-template name="minimum-documentation" />
		</div>
		
		<div class="contentBlockTopOnlyNoPaddingNoMargin">
			<xsl:call-template name="other-documentation" />
		</div>
		
		<div class="contentBlockTopOnlyNoPaddingNoMargin">
			<xsl:call-template name="database-searched" />
		</div>

		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<xsl:template name="minimum-documentation">
		<div class="indent20">
			<xsl:value-of select="$form_table/label[@name ='ISA210Text44']"/>:<!-- Minimum documentation searched: -->
			<div>
				<xsl:apply-templates select="//minimum-documentation/classifications-ipcr">
					<xsl:with-param name="isEditNode" select="'false'"/>
				</xsl:apply-templates>
			</div>
			<div class="indent20"><xsl:apply-templates select="//minimum-documentation/classification-national" /></div>
		</div>
	</xsl:template>
	
	<xsl:template name="other-documentation">
	    <div class="indent20">
			<xsl:value-of select="$form_table/label[@name ='ISA210Text45']"/>:<!-- Documentation searched other than minimum documentation: -->
			
			<div class="indent20">
				<xsl:if test="//srep-fields-searched/other-documentation">
					<xsl:for-each select="//srep-fields-searched/other-documentation">
						<div>
							<xsl:apply-templates select="." />
						</div>
					</xsl:for-each>	
				</xsl:if>			
			</div>
		</div>
	</xsl:template>	
	
	<xsl:template name="database-searched">
		<div class="indent20">
			<xsl:value-of select="$form_table/label[@name ='ISA210Text46']"/>:<!-- Electronic database consulted during the international search: -->
			<div class="indent20">
				<xsl:apply-templates select="//srep-fields-searched/database-searched" />
			</div>
		</div>
	</xsl:template>
	
	<!-- srep-citations
		<xsd:complexType>
			<xsd:choice>
				<xsd:element ref = "text"/>
				<xsd:element ref = "citation" maxOccurs = "unbounded"/>
			</xsd:choice>
		</xsd:complexType>
	 -->
	<xsl:template match="srep-citations">
		<xsl:call-template name="openDIVwithNodePath" />
		
		<xsl:choose>
			<xsl:when test="text">
				<xsl:value-of select="." />				
			</xsl:when>
			<xsl:otherwise>
				<table border="0" width="100%" cellspacing="0">
					<tr>
						<td class="thinTopRightBottom" valign="middle" style="min-width:30px;">
							<xsl:value-of select="' '"/>
						</td>
						<td class="thinTopRightBottom" valign="middle" align="middle" width="43px;" style="white-space:nowrap;">
							<xsl:apply-templates select="$common_table/label[@name ='Category']"/>
							<xsl:apply-templates select="$common_table/label[@name ='MarkAsterisk']"/>
						</td>
						<td class="thinTopRightBottom" align="center" valign="middle">
							<xsl:apply-templates select="$form_table/label[@name ='ISA210Text47']"/>
						</td>
						<td class="thinTopBottom" align="center" valign="middle">
							<xsl:apply-templates select="$form_table/label[@name ='ISA210RelevantToClaimNo']"/>
						</td>
					</tr>
					<xsl:apply-templates select="citation"/>
				</table>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<!-- citation
	<xsd:complexType>
			<xsd:sequence>
				<xsd:choice>
					<xsd:element ref = "patcit"/>
					<xsd:element ref = "nplcit"/>
				</xsd:choice>
				<xsd:sequence minOccurs = "0" maxOccurs = "unbounded">
					<xsd:element ref = "rel-passage" minOccurs = "0" maxOccurs = "unbounded"/>
					<xsd:element ref = "category" minOccurs = "0" maxOccurs = "unbounded"/>
					<xsd:element ref = "rel-claims" minOccurs = "0" maxOccurs = "unbounded"/>
				</xsd:sequence>
				<xsd:element ref = "corresponding-docs" minOccurs = "0" maxOccurs = "unbounded"/>
				<xsd:element ref = "classification-ipc" minOccurs = "0"/>
				<xsd:element ref = "classifications-ipcr" minOccurs = "0"/>
				<xsd:element ref = "classification-national" minOccurs = "0"/>
				<xsd:element ref = "doi" minOccurs = "0"/>
			</xsd:sequence>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "cited-phase"></xsd:attribute>
			<xsd:attribute name = "cited-by"></xsd:attribute>
		</xsd:complexType>
	 -->
	<!-- ELEMENT citation ((patcit | nplcit) , 
	      (rel-passage* , category* , rel-claims*)* , 
	       corresponding-docs* , classification-ipc? , classifications-ipcr? , 
	       classification-national? , doi?)>
	 -->
	<xsl:template match="citation">
			<tr valign="top">
			    <td class="thinRight" valign="top" align="center" width="10px;">
			    	<xsl:if test="position()=last()">
						<xsl:attribute name="class">thinRight</xsl:attribute>
					</xsl:if>
					
			    	<div style="text-align:center;vertical-align:top;padding:2px;">
			    		<xsl:call-template name="openDIVwithNodePath" />
						<xsl:value-of select="concat('(', position(), ')')" />
						<xsl:call-template name="closeDIV" />
					</div>
					
				</td>
				<td class="thinRight" valign="top" width="30px;">
					<xsl:if test="position()=last()">
						<xsl:attribute name="class">thinRight</xsl:attribute>
					</xsl:if>
					
					<div style="text-align:center; vertical-align:top;margin:2px;">
						<xsl:choose>
							<xsl:when test="$newCitationLayout='true'">							
								<xsl:for-each select="./category">
									<xsl:value-of select="."/>
									<xsl:if test="not(position() = last())">
										<div style="height:6px;" />
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./category">
									<xsl:value-of select="."/>
								</xsl:for-each>							
							</xsl:otherwise>
						</xsl:choose>	
					</div>				
				</td>
				<td class="thinRight" width="78%" valign="top">
					<xsl:if test="position()=last()">
						<xsl:attribute name="class">thinRight</xsl:attribute>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="./patcit">
							<xsl:apply-templates select="./patcit" />
						</xsl:when>
						<xsl:when test="./nplcit">
							<xsl:apply-templates select="./nplcit"/>
						</xsl:when>
					</xsl:choose>
				</td>
				<td style="max-width:200px;word-wrap:normal;">
					<div style="text-align:center; vertical-align:top;">
					<xsl:choose>
							<xsl:when test="$newCitationLayout='true'">							
								 <xsl:if test="./rel-claims">
									<span class="{$varNeedTranslation}" >
										<xsl:for-each select="./rel-claims">
											<xsl:value-of select="."/>
											<xsl:if test="not(position() = last())">
												<div style="height:6px;" />
											</xsl:if>
										</xsl:for-each>
									</span>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="./rel-claims">
								<span class="{$varNeedTranslation}">
									<xsl:for-each select="./rel-claims">
										<xsl:value-of select="."/>
										<xsl:choose>
											<xsl:when test="position() = last()">
												<xsl:text/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>, </xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</span>
							</xsl:if>						
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</td>
			</tr>
				
			<xsl:for-each select="./nplcit/rel-passage">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:for-each select="./patcit/rel-passage">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:for-each select="./rel-passage">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			
			<xsl:for-each select="./corresponding-docs">
				<tr>
					<td class="thinRight"/>
					<td class="thinRight">
						<div style="text-align:center;">
							<xsl:for-each select="./category">
								<xsl:value-of select="."/>
							</xsl:for-each>
						</div>
					</td>
					<td class="thinRight">
						<div>
							<xsl:text>&amp; </xsl:text>
							<xsl:choose>
								<xsl:when test="./patcit">
									<xsl:apply-templates select="./patcit"/>
								</xsl:when>
								<xsl:when test="./nplcit">
									<xsl:apply-templates select="./nplcit"/>
								</xsl:when>
							</xsl:choose>
						</div>
					</td>
					<td >
						<div style="text-align:center;">
							<xsl:if test="./rel-claims">
								<span class="{$varNeedTranslation}">
									<xsl:for-each select="./rel-claims">
										<xsl:value-of select="."/>
										<xsl:choose>
											<xsl:when test="position() = last()">
												<xsl:text/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>, </xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</span>
							</xsl:if>
						</div>
					</td>
				</tr>
				
				<xsl:for-each select="./nplcit/rel-passage">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				
				<xsl:for-each select="./patcit/rel-passage">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				
				<xsl:for-each select="./rel-passage">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:for-each>
			
			<xsl:if test="./@has-equivalent = 'no'">
				<tr>
					<td class="thinRight"/>
					<td class="thinRight"/>
					<td class="thinRight">
						<div class="indent">
							<span class="{$varNeedTranslation}">
								<xsl:apply-templates select="$common_table/label[@name ='NoPatentFamily']"/>
							</span>
						</div>
					</td>
					<td />
				</tr>
			</xsl:if>
					
			<xsl:if test="position()!=last()">
				<td class="thinRight thinDashedBottom" />
				<td class="thinRight thinDashedBottom" />
				<td class="thinRight thinDashedBottom" />
				<td class="thinRight thinDashedBottom" />
			</xsl:if>
	</xsl:template>
	
	<!-- patcit
		<xsd:complexType>
			<xsd:choice>
				<xsd:element ref = "text"/>
				<xsd:sequence>
					<xsd:element ref = "document-id"/>
					<xsd:element ref = "rel-passage" minOccurs = "0" maxOccurs = "unbounded"/>
				</xsd:sequence>
			</xsd:choice>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "num" type = "xsd:string"/>
			<xsd:attribute name = "dnum" type = "xsd:string"/>
			<xsd:attribute name = "dnum-type" type = "xsd:string"/>
			<xsd:attribute name = "file" type = "xsd:string"/>
			<xsd:attribute name = "url" type = "xsd:string"/>
		</xsd:complexType>
	 -->
	<xsl:template match="patcit">
		<xsl:param name="relPassageInNewLine" select="'false'" />
		
		<xsl:choose>
			<xsl:when test="@url and $media='web' and $usePatentScopeUrl='false'">
				<a href="{@url}" name="{@id}" title="{@dnum}" target="_blank">
					<xsl:choose>
						<xsl:when test="text">
							<span class="{$varNeedTranslation}"><xsl:value-of select="." /></span>			
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="document-id" />
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="text">
						<xsl:choose>
							<xsl:when test="@dnum"> <!-- use it for the URL --> 
								<xsl:call-template name="getHyperlinkedDocNumber">
							    	<xsl:with-param name="countryUpper" select="''"/>
							    	<xsl:with-param name="docNum" select="@dnum"/>
							    	<xsl:with-param name="existingUrl">
							    		<xsl:choose>
											<xsl:when test="parent::patcit/@url">
												<xsl:value-of select="parent::patcit/@url" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="''"/>
											</xsl:otherwise>
										</xsl:choose>
							    	</xsl:with-param>
							    	<xsl:with-param name="kind">							    		
							    		<xsl:choose>
											<xsl:when test="string-length(@dnum) &gt; 2"> <!-- e.g.  dnum="US 9475263 B1" The first two is country code -->
												<xsl:variable name="dnumCountryRemoved" select="substring(@dnum, 3)" />
												<xsl:choose>
													<xsl:when test="contains($dnumCountryRemoved,'B')"> 
														<xsl:value-of select="'B'"/>														
													</xsl:when>
													<xsl:when test="contains($dnumCountryRemoved, 'A')">
														<xsl:value-of select="'A'"/>
													</xsl:when>
													<xsl:when test="contains($dnumCountryRemoved, 'Y')">
														<xsl:value-of select="'Y'"/>
													</xsl:when>							
													<xsl:otherwise>
														<xsl:value-of select="''"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="''"/>
											</xsl:otherwise>
										</xsl:choose>
							    	</xsl:with-param>
							    	<xsl:with-param name="date">
							    		<!-- <patcit dnum="JP 07-233473 A" id="patcit0003">
									           <text>JP 07-233473 A (HITACHI LTD) 1995.09.05 ....</text>
									         </patcit>
									         
									         "If the date of publication is before 1999, the publication number should not be included 200."
									         
									         Let's handle the above JP case first and will take care of others as needed									        
										 -->							    		
							    		<xsl:choose>
											<xsl:when test="starts-with(@dnum, 'JP') and starts-with(./text, @dnum)"> 
												<!-- Try to retrieve date from the text, e.g. 1995.09.05 .. part -->
												<xsl:variable name="dnumRemoved" select="normalize-space(substring-after(./text, ')'))" />
												 <xsl:choose>
													<xsl:when test="not(string-length($dnumRemoved) &lt; 10)"> 													
														 <xsl:variable name="dateCandidate" select="translate(substring($dnumRemoved, 1,10), '.-', '')" />
														 <xsl:choose>
															 <xsl:when test="number($dateCandidate)">
																<xsl:value-of select="$dateCandidate"/>
															</xsl:when>															
															<xsl:otherwise>
																<xsl:value-of select="''"/>
															</xsl:otherwise>
														</xsl:choose>						
													</xsl:when>													
													<xsl:otherwise>
														<xsl:value-of select="''"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="''"/>
											</xsl:otherwise>
										</xsl:choose>
							    	</xsl:with-param>
				    		   </xsl:call-template>
				    		   <span class="{$varNeedTranslation}">
				    		   		<xsl:call-template name="stringReplace">
										<xsl:with-param name="output" select="." />
										<xsl:with-param name="from" select="@dnum" />
										<xsl:with-param name="to" select="''" />
									</xsl:call-template>
				    		   </span>
				    		 </xsl:when>
				    		 <xsl:otherwise>
								<span class="{$varNeedTranslation}"><xsl:value-of select="." /></span>
							 </xsl:otherwise>
						</xsl:choose>		
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="document-id" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="nplcit"> <!-- rel-passage processed separately! -->
		<xsl:apply-templates select="*[not(self::rel-passage)]"/>
	</xsl:template>
	
	<!-- rel-passage
	<xsd:complexType>
			<xsd:choice>
				<xsd:element ref = "text"/>
				<xsd:sequence>
					<xsd:element ref = "passage" maxOccurs = "unbounded"/>
					<xsd:sequence minOccurs = "0" maxOccurs = "unbounded">
						<xsd:element ref = "category"/>
						<xsd:element ref = "rel-claims" minOccurs = "0"/>
					</xsd:sequence>
				</xsd:sequence>
			</xsd:choice>
		</xsd:complexType>
	
	<!ELEMENT rel-passage (text | (passage+ , (category , rel-claims?)*))> 
	 -->
	<xsl:template match="rel-passage">
		<xsl:param name="relPassageInNewLine" select="'false'"/>
				
		<xsl:if test="$relPassageInNewLine='true'">
			<xsl:text disable-output-escaping="yes">&lt;div&gt;</xsl:text>
		</xsl:if>
		
		<tr valign="top">
			<td class="thinRight" valign="top" align="center" width="10px;"/>
			<td class="thinRight" valign="top" width="30px;">
				<xsl:if test="position()=last()">
					<xsl:attribute name="class">thinRight</xsl:attribute>
				</xsl:if>
				<xsl:if test="./category">							
					<div style="text-align:center;">				
						<xsl:for-each select="./category">
							<xsl:value-of select="."/>
							<br/>
						</xsl:for-each>				
					</div>
				</xsl:if>
				<xsl:if test="$newCitationLayout='true' and (position() = last())">
					<div style="height:6px;" />
				</xsl:if>
			</td>
			<td class="thinRight">
				<xsl:if test="position()=last()">
					<xsl:attribute name="class">thinRight</xsl:attribute>
				</xsl:if>
				<div class="indent20">
					<xsl:choose>
						<xsl:when test="text">
							<span class="{$varNeedTranslation}">
								<xsl:value-of select="text" />
							</span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="passage" />
						</xsl:otherwise>
					</xsl:choose>
				</div>				
			</td>
			<td>
				<div style="text-align:center;">
					<xsl:if test="./rel-claims">
						<span class="{$varNeedTranslation}">
							<xsl:for-each select="./rel-claims">
								<xsl:value-of select="."/>
								<xsl:choose>
									<xsl:when test="position() = last()">
										<xsl:text/>
									</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</span>
					</xsl:if>
				</div>
			</td>
		</tr>
	
	    <xsl:if test="$relPassageInNewLine='true'">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>		
	</xsl:template>
	
	<xsl:template match="passage">
		<div class="{$varNeedTranslation}"><xsl:value-of select="." /></div>
	</xsl:template>
	
	<xsl:template match="category">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="rel-claims">
		<span class="{$varNeedTranslation}">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="corresponding-docs">
		<xsl:apply-templates />
	</xsl:template>
		
	<!-- e.g. http://blog.apastyle.org/apastyle/digital-object-identifier-doi/ -->
	<xsl:template match="doi">
		<div>
			<a href="{concat($doiUrlRoot,.)}" name="{.}" title="{.}" target="_blank">
				<xsl:text>DOI:&#160;</xsl:text>
				<xsl:apply-templates />
				<xsl:text>&#160;</xsl:text>
				<xsl:if test="$media = 'web'">
					<img width="13" height="13" src="{$ssLink}" alt="external link" />
				</xsl:if>
			</a>				
		</div>
	</xsl:template>
	
	<xsl:template match="srep-incomplete-search">
		<b><xsl:value-of select="name()" /></b>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="srep-declaration">
		<b><xsl:value-of select="name()" /></b>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="srep-admin">
		<div>
		<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="srep-patent-family">
		<xsl:variable name="thinBorderLine">
			<xsl:choose>
				<xsl:when test="$lang='ar'">thinLeft</xsl:when>
				<xsl:otherwise>thinRight</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table border="0" width="100%" cellspacing="0" cellpadding="4px">
			<tr>
				<th class="thinTopBottom {$thinBorderLine}" width="25%"><xsl:value-of select="$common_table/label[@name ='PatentDocumentCitedInSearchReport']"/></th>
				<th class="thinTopBottom {$thinBorderLine}" width="25%"><xsl:value-of select="$common_table/label[@name ='PublicationDate2']"/>
					<xsl:if test="not($lang='ja' or $lang='ko' or $lang='pt')">
						<br/><xsl:apply-templates select="$common_table/label[@name ='DateFormat']"/>
					</xsl:if>
				</th>
				<th class="thinTopBottom {$thinBorderLine}" width="25%"><xsl:value-of select="$common_table/label[@name ='PatentFamilyMembers']"/></th>
				<th class="thinTopBottom" width="25%"><xsl:value-of select="$common_table/label[@name ='PublicationDate2']"/>
					<xsl:if test="not($lang='ja' or $lang='ko' or $lang='pt')">
						<br/><xsl:apply-templates select="$common_table/label[@name ='DateFormat']"/>
					</xsl:if>
				</th>
			</tr>
			<xsl:for-each select="patent-family">
			<tr valign="top">
				<!-- Patent document -->
				<td cellpadding="0px" valign="top" style="padding-left: 10px;padding-right: 10px;white-space:nowrap;">
					<xsl:if test="not(position() = last())">
						<xsl:attribute name="class"><xsl:value-of select="'thinDashedBottom'"/></xsl:attribute>
					</xsl:if>
					<table border="0" width="100%" cellspacing="0" valign="top">
						<tr valign="top">
						<xsl:apply-templates select="priority-application/document-id" mode="PATENT_FAMYLY_TABLE_TD">
								<xsl:with-param name="withDate" select="'false'"/>
						</xsl:apply-templates>
						</tr>
					</table>
				</td>
				
				<!-- Publication date -->
				<td valign="top" align="center" style="padding-left: 10px;padding-right: 10px;white-space:nowrap;" >
					<xsl:if test="not(position() = last())">
						<xsl:attribute name="class"><xsl:value-of select="'thinDashedBottom'"/></xsl:attribute>
					</xsl:if>
					
					<xsl:apply-templates select="priority-application/document-id/date" />
				</td>
				
				<!-- Patent family member(s) -->				
				<td cellpadding="0px" valign="top"  style="padding-left: 10px;padding-right: 10px;white-space:nowrap;">
					<xsl:if test="not(position() = last())">
						<xsl:attribute name="class"><xsl:value-of select="'thinDashedBottom'"/></xsl:attribute>
					</xsl:if>
									    			    
					<xsl:choose>
						<xsl:when test="family-member">
							<table border="0" width="100%" cellspacing="0" valign="top">	
								<xsl:for-each select="family-member">
								    <tr valign="top">
										<xsl:apply-templates select="document-id" mode="PATENT_FAMYLY_TABLE_TD">
											<xsl:with-param name="withDate" select="'false'"/>
										</xsl:apply-templates>
									</tr>
									<xsl:if test="./rel-passage">
										<tr>
											<td class="{$varNeedTranslation}">
												<xsl:value-of select="./rel-passage/passage"/>
											</td>
										</tr>
									</xsl:if>	
								</xsl:for-each>
							</table>
							
						</xsl:when>
						<xsl:when test="text">
						   <table border="0" width="100%" cellspacing="0" valign="top">	
							   <tr valign="top" align="center">
								   	<td style="white-space:nowrap;">
										<xsl:attribute name="colspan">3</xsl:attribute>
										<xsl:call-template name="openDIVwithNodePath">
											<xsl:with-param name="childName" select="'text'"/>
										</xsl:call-template>
										<span class="{$varNeedTranslation}"><xsl:value-of select="text" /></span>
										<xsl:call-template name="closeDIV" />
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:otherwise>						
						</xsl:otherwise>
					</xsl:choose>				
								
				</td>
				
				<!-- Publication date -->
				<td cellpadding="0px" valign="top" align="center" style="padding-left: 10px;padding-right: 10px;">
					<xsl:if test="not(position() = last())">
						<xsl:attribute name="class"><xsl:value-of select="'thinDashedBottom'"/></xsl:attribute>
					</xsl:if>
					
					<xsl:choose>
						<xsl:when test="family-member">
						<table border="0" width="90%" cellspacing="0" valign="top">						  
							<xsl:for-each select="family-member">
								<tr valign="top">
									<td align="center" style="white-space:nowrap;">
									<xsl:apply-templates select="./document-id/date" />
									</td>	
								</tr>
							</xsl:for-each>
						</table>
						</xsl:when>
						<xsl:otherwise>						
						</xsl:otherwise>
					</xsl:choose>				
				</td>	
			</tr>
			</xsl:for-each>			
		</table>
	</xsl:template>
		
	<xsl:template match="document-id" mode="PATENT_FAMYLY_TABLE_TD"> 
		<xsl:param name="isIaNumber" select="'false'" />
		<xsl:param name="isBold" select="'false'" />
		<xsl:param name="simple" select="'false'" />
		<xsl:param name="addDIV" select="'true'" />
		<xsl:param name="addNum" select="'false'" />
		<xsl:param name="countryBold" select="'false'" />
		<xsl:param name="withDate" select="'false'"/>
        
        <xsl:variable name="countryUpper" select="translate(./country, $smallcase, $uppercase)" />
        <xsl:variable name="docNum" select="normalize-space(./doc-number)" />
        <xsl:variable name="date" select="normalize-space(./date)" />
        <xsl:variable name="kind" select="normalize-space(./kind)" />
        
       <td style="white-space:nowrap;">
			<xsl:call-template name="openDIVwithNodePath" />			
			<xsl:choose>
				<xsl:when test="$isIaNumber='true'">
					<xsl:value-of select="$countryUpper" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$countryBold='true'">
						<xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
					</xsl:if>
					
					<xsl:variable name="isDocNumNoneValue">
						<xsl:call-template name="isNoneText">
							<xsl:with-param name="docNum" select="$docNum" />
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:choose>
						<xsl:when test="$isDocNumNoneValue='true' or translate($docNum, '1234567890', '') = $docNum">
							<span class="{$varNeedTranslation}"><xsl:value-of select="$docNum"/></span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="getHyperlinkedDocNumber">
						    	<xsl:with-param name="countryUpper" select="$countryUpper"/>
						    	<xsl:with-param name="docNum" select="$docNum"/>
						    	<xsl:with-param name="isIaNumber" select="$isIaNumber" />
						    	<xsl:with-param name="countryBold" select="$countryBold" />
						    	<xsl:with-param name="date" select="$date"/>
						    	<xsl:with-param name="kind" select="$kind"/>
						    	
						    	<!--  try to use the existing URL in Citation section -->
						    	<xsl:with-param name="existingUrl">
						    		<xsl:choose>
										<xsl:when test="//srep-citations/citation/patcit[starts-with(@dnum, concat($countryUpper, $docNum))]">
											<xsl:value-of select="//srep-citations/citation/patcit[starts-with(@dnum, concat($countryUpper, $docNum))]/@url" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''"/>
										</xsl:otherwise>
									</xsl:choose>
						    	</xsl:with-param>
						    	
			    		  	 </xsl:call-template>  
						</xsl:otherwise>
					</xsl:choose>					
					
					<xsl:if test="$countryBold='true'">
						<xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>		
			<xsl:call-template name="closeDIV" />
      </td>
     <!-- 
	  <td align="right"  width="60%" style="white-space:nowrap;">
			<xsl:call-template name="openDIVwithNodePath" />			
			<xsl:choose>
				<xsl:when test="translate($docNum, $uppercase, $smallcase)= 'none'">
					<xsl:value-of select="$common_table/label[@name ='None']"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$docNum" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="closeDIV" />
	 </td>
	 -->
	
	<td align="right"  width="20%" style="white-space:nowrap;">
			<xsl:call-template name="openDIVwithNodePath" />

		<xsl:if test="(./kind) and not(''=normalize-space(./kind))">
			<xsl:value-of select="translate(./kind, $smallcase, $uppercase)" />
		</xsl:if>

		<xsl:call-template name="closeDIV" />
	</td>
	</xsl:template>
	
	<xsl:template name="isNoneText">
		<xsl:param name="docNum" select="''" />
		<xsl:variable name="noneInLang" select="translate($common_table/label[@name ='None'], $uppercase, $smallcase)" />
		
		<xsl:variable name="isNone">
			<xsl:choose>
				<xsl:when test="$docNum= ''">
					<xsl:value-of select="'false'"/>
				</xsl:when>				
				<xsl:when test="starts-with(translate($docNum, $uppercase, $smallcase),'non')">
					<xsl:value-of select="'true'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="translate($docNum, $uppercase, $smallcase)= $noneInLang">
							<xsl:value-of select="'true'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'false'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:value-of select="$isNone"/>
	</xsl:template>
	
	<xsl:template match="srep-earlier-search">
		<b><xsl:value-of select="name()" /></b>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="sisr-scope">
		<b><xsl:value-of select="name()" /></b>
		<xsl:apply-templates />
	</xsl:template>
	
<!-- 
	==============================
	office-specific-srep-data
	=============================
	<xsd:complexType>
			<xsd:attribute name = "office" use = "required" type = "xsd:string"/>
			<xsd:attribute name = "office-dtd" use = "required" type = "xsd:string"/>
			<xsd:attribute name = "file" use = "required" type = "xsd:string"/>
			<xsd:attribute name = "id" type = "xsd:ID"/>
			<xsd:attribute name = "lang" type = "xsd:string"/>
			<xsd:attribute name = "status" type = "xsd:string"/>
		</xsd:complexType>
 -->
	<xsl:template match="office-specific-srep-data">
		<!--hr/-->
		<h2><xsl:value-of select="name()" /></h2>
		<xsl:apply-templates />
	</xsl:template>
 
   <xsl:template match="author">
   		<xsl:value-of select="normalize-space(.)" />
   		<xsl:call-template name="addCommaAsNeeded">                        
			<xsl:with-param name="string" select="."></xsl:with-param>                     
		</xsl:call-template>
   </xsl:template>
   
   <xsl:template match="online">
   		<xsl:apply-templates select="./*[not(self::srchdate or self::issn or self::isbn or self::doi or self::refno)]"/>

		<xsl:apply-templates select=".//refno" />
		<xsl:apply-templates select=".//doi" />
		<xsl:apply-templates select=".//isbn" /> 
		<xsl:apply-templates select=".//issn" />
		 
   		<xsl:apply-templates select="./srchdate"/>
   </xsl:template>
   
   <xsl:template match="online-title">
   		<xsl:text>&quot;</xsl:text>
   		<xsl:value-of select="normalize-space(.)" />
   		<xsl:text>&quot;</xsl:text>
   		<xsl:call-template name="addCommaAsNeeded">                        
			<xsl:with-param name="string" select="."></xsl:with-param>                     
		</xsl:call-template>
   </xsl:template>
   
   <xsl:template match="sertitle">
   		<xsl:if test=".//sertitle and string-length(.//sertitle) &gt; 0">
	   		<i><xsl:value-of select="normalize-space(.)" /></i>
	   		<xsl:call-template name="addCommaAsNeeded">                        
				<xsl:with-param name="string" select="."></xsl:with-param>                     
			</xsl:call-template>
		</xsl:if>
   </xsl:template>
     	
    <xsl:template match="avail">
    	<div>
			<xsl:if test="name(..)='online'">
				<xsl:apply-templates select="$common_table/label[@name ='RetrievedFromTheInternet']"/>
				<xsl:value-of select="':'" />
				<br/>
				<xsl:text>URL:</xsl:text>
			</xsl:if>    	
	   		<xsl:value-of select="normalize-space(.)" />
   		</div>
   </xsl:template>
   
   <xsl:template match="pubdate"> 
   		<xsl:choose>
			<!-- if <pubdate>2012</pubdate>, show 2012, instead of showing 2012(2012) 
			     If the text in <pubdate> contains less than 5 bytes (e.g., <pubdate>2012</pubdate>), display the text as it is.
				 Needs to be checked if the text is date formart such as YYYYMMDD, MMDDYYYY, DDMMYYYY (to be developed later).						
			-->
			<xsl:when test="string-length(./text()) &gt; 5">                 
				<xsl:call-template name="FormatDate">                       
					<xsl:with-param name="date" select="normalize-space(.)"></xsl:with-param>                     
					<xsl:with-param name="show_date" select="'1'"></xsl:with-param>                     
					<xsl:with-param name="lang" select="$lang"></xsl:with-param>  
					<xsl:with-param name="text" select="'1'"></xsl:with-param>                
				</xsl:call-template>
				(<xsl:call-template name="format_date_yyyy-mm-dd">
					<xsl:with-param name="date" select="normalize-space(.)"></xsl:with-param>                                      
					<xsl:with-param name="lang" select="$lang"></xsl:with-param> 
				</xsl:call-template>),
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="./text()"/><xsl:value-of select="', '"/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:template>    
	
	 <xsl:template match="pp">
	 	<xsl:choose>
		 	<xsl:when test="./ppf">
		 		<xsl:choose>
					<xsl:when test="name(./following-sibling::*[1]) = 'ppl'">
						<xsl:apply-templates select="$common_table/label[@name ='Pages']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$common_table/label[@name ='Page']"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text> 
			 	<xsl:value-of select="normalize-space(./ppf)" />
			 	<xsl:if test="./ppl"> 
				 	<xsl:value-of select="'-'" />
				 	<xsl:value-of select="normalize-space(./ppl)" />
			 	</xsl:if>
				<xsl:if test="name(./ppf/following-sibling::*[1]) = 'ppf'">
					<xsl:text>, </xsl:text>
				</xsl:if>
		 	</xsl:when>
		 	<xsl:otherwise>
		 		<xsl:apply-templates />
		 	</xsl:otherwise>
	 	</xsl:choose>
	 	
	 	<xsl:call-template name="addCommaAsNeeded">
	 		<xsl:with-param name="string" select="current()" />                     
		</xsl:call-template> 
	 </xsl:template>
	 
	<xsl:template match="location">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="srchdate"> 
		<div>
			<xsl:text>[</xsl:text>
			<xsl:apply-templates select="$common_table/label[@name ='RetrievedOn']"/>
			<xsl:value-of select="$spaceNbsp" />		                 
			<xsl:call-template name="format_date_yyyy-mm-dd">
				<xsl:with-param name="date" select="normalize-space(.)"></xsl:with-param>                                      
				<xsl:with-param name="lang" select="$lang"></xsl:with-param> 
			</xsl:call-template>
			<xsl:text>]</xsl:text>
		</div>
	</xsl:template>    
	
	<xsl:template match="refno">
		<div><xsl:value-of select="normalize-space(.)" /></div>
	</xsl:template>
	
	<xsl:template match="issn">
		<div>		
			<xsl:variable name="issnNumber" select="normalize-space(.)" />
			<xsl:variable name="issnNumberDisplay" select="concat('ISSN:', $issnNumber)" />
			
			<xsl:choose>
				<xsl:when test="string-length($issnNumber) &gt;3">
					<a target="_blank" title="{$issnNumberDisplay}" name="" href="{concat($issnUrlRoot, $issnNumber)}">  
						<xsl:value-of select="$issnNumberDisplay" />
						<xsl:text>&#160;</xsl:text>
						  
						<xsl:if test="$media = 'web'">
							<img width="13" height="13" src="{$ssLink}" alt="" />
						</xsl:if>               
					</a>        
			    </xsl:when>
			    <xsl:otherwise>
			    	<xsl:value-of select="$issnNumberDisplay" />
			    </xsl:otherwise>
		   </xsl:choose>
		</div>
	</xsl:template>
	
	<!-- ISBN current 13 digits. Old ISBN 10 digits  
	e.g. isbn: 978-3-540-23957-4
			  9783540239574
			  354023957X
	So minimum length is 10
	-->
	<xsl:template match="isbn">
		<div>
			<xsl:variable name="isbnNumber" select="translate(normalize-space(.), '-', '')" />
			<xsl:variable name="isbnNumberDisplay" select="concat('ISBN: ', $isbnNumber)" />

			<xsl:value-of select="$isbnNumberDisplay" />
			
<!-- 			<xsl:choose>
				<xsl:when test="string-length($isbnNumber) &gt; 9">
					<a target="_blank" title="{$isbnNumberDisplay}" name="" href="{concat($isbnUrlRoot, $isbnNumber)}">  
						<xsl:value-of select="$isbnNumberDisplay" /> 
						<xsl:text>&#160;</xsl:text>
						<img width="13" height="13" src="{$ssLink}" alt="" />                
					</a>        
			    </xsl:when>
			    <xsl:otherwise>
			    	<xsl:value-of select="$isbnNumberDisplay" />
			    </xsl:otherwise>
		   </xsl:choose>  -->

		</div>
	</xsl:template>
	
	<xsl:template match="vid">
		<xsl:choose>
			<xsl:when test="$lang='zh'">
				<xsl:apply-templates select="$common_table/label[@name ='Vol']"/>
				<xsl:value-of select="(.)"/>
				<xsl:apply-templates select="$common_table/label[@name ='Vol-2']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$common_table/label[@name ='Vol']"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="(.)"/>
			</xsl:otherwise>
		</xsl:choose>	
		
		<xsl:call-template name="addCommaAsNeeded">                        
			<xsl:with-param name="string" select="current() " />                     
		</xsl:call-template>     	
	</xsl:template>
	
	<xsl:template match="ino">
		<xsl:choose>
			<xsl:when test="$lang='zh'">
				<xsl:apply-templates select="$common_table/label[@name ='No2']"/>
				<xsl:value-of select="(.)"/>
				<xsl:apply-templates select="$common_table/label[@name ='No2-2']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$common_table/label[@name ='No2']"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="(.)"/>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:call-template name="addCommaAsNeeded">                        
			<xsl:with-param name="string" select="current()" />                     
		</xsl:call-template>  
	</xsl:template>
				
 	<xsl:template match="article">	      
		<xsl:param name="date" select="normalize-space(.//pubdate)"></xsl:param>      
		
		<xsl:call-template name="openDIVwithNodePath" />    
		<xsl:choose>         
			<xsl:when test="./text">            
				<xsl:value-of select="normalize-space(./text)"></xsl:value-of>            
				<xsl:if test="parent::nplcit/@url">               
					<xsl:text> 
					</xsl:text>               
					(<a href="{parent::nplcit/@url}">                     
							<xsl:value-of select="parent::nplcit/@url"></xsl:value-of>                  
					 </a>).
				</xsl:if>         
			</xsl:when>         
			<xsl:otherwise>            
				<xsl:apply-templates select=".//author"/> 
				
				<xsl:if test="./atl">    
					<xsl:variable name="sAtl">           
						<xsl:call-template name="trimQuotation">
							<xsl:with-param name="sText" select="normalize-space(./atl)"/>
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:variable name="nLen" select="string-length($sAtl)"/>   
					
					<!-- make it like "xxx title", -->            
					<xsl:choose>
						<xsl:when test="substring($sAtl,$nLen)=','">
							<xsl:text>&quot;</xsl:text>                   
							<xsl:call-template name="rtrim">                        
								<xsl:with-param name="string" select="$sAtl"></xsl:with-param>                     
							</xsl:call-template>
							<xsl:text>&quot;,&#160;</xsl:text>            
						</xsl:when>						                  
<!-- 						<xsl:when test="not(substring($sAtl,$nLen)=',')">
							<xsl:text>&quot;</xsl:text>                     
							<xsl:value-of select="$sAtl"></xsl:value-of>  
							<xsl:text>&quot;</xsl:text>                   
							<xsl:call-template name="addCommaAsNeeded">                        
								<xsl:with-param name="string" select="$sAtl"></xsl:with-param>                     
							</xsl:call-template>                  
						</xsl:when>	 -->	                  
						<xsl:otherwise>  
							<xsl:text>&quot;</xsl:text>                   
							<xsl:value-of select="$sAtl"></xsl:value-of>                     
							<xsl:text>&quot;,&#160;</xsl:text>                  
						</xsl:otherwise>               
					</xsl:choose>            
				</xsl:if>             
			     
				<xsl:if test="./subname">               
					<xsl:apply-templates select="./subname"/>            
				</xsl:if>
				            
				<xsl:choose>
					<!-- book | serial -->					               
					<xsl:when test=".//book-title">                  
						<i> <xsl:text>&quot;</xsl:text>                  
							<xsl:value-of select="normalize-space(.//book-title)"></xsl:value-of> 
							<xsl:text>&quot;</xsl:text>                    
							<xsl:call-template name="addCommaAsNeeded">                        
								<xsl:with-param name="string" select=".//book-title"></xsl:with-param>                     
							</xsl:call-template>                     
							<!-- <xsl:text>&#160;</xsl:text>  -->                  
						</i>  
						<xsl:if test=".//book/location">
							<xsl:apply-templates select=".//book/location"/>
						</xsl:if>	             
					</xsl:when>               
					<xsl:otherwise>
						<!-- serial -->
						<xsl:if test=".//sertitle and string-length(.//sertitle) &gt; 0">
							<i><xsl:value-of select="normalize-space(.//sertitle)"/></i>
							<xsl:value-of select="','"/>
						</xsl:if>
							<xsl:if test=".//book/location">
								<xsl:if test=".//sertitle and string-length(.//sertitle) &gt; 0">                           
									<xsl:call-template name="addCommaAsNeeded">                              
										<xsl:with-param name="string" select="normalize-space(.//sertitle)"></xsl:with-param>                           
									</xsl:call-template>  
								</xsl:if>
								<xsl:apply-templates select=".//book/location"/>
							</xsl:if>	
					  
							<xsl:if test=".//vid ">
								<xsl:if test=".//book/location">                           
									<xsl:call-template name="addCommaAsNeeded">                              
										<xsl:with-param name="string" select="normalize-space(.//book/location)"></xsl:with-param>                           
									</xsl:call-template>  
								</xsl:if>
								<xsl:apply-templates select=".//vid"/>
							</xsl:if>
							
							<xsl:if test=".//ino">
								<xsl:apply-templates select=".//ino"/>
							</xsl:if>                  
					</xsl:otherwise>            
				</xsl:choose>
				<!-- end book-title | sertitle -->
				            
				<xsl:if test=".//edition">               
					<xsl:call-template name="rtrim">                  
						<xsl:with-param name="string" select="normalize-space(.//edition)"></xsl:with-param>               
					</xsl:call-template> 
					<xsl:value-of select="', '"/>           
				</xsl:if> 
				
				<xsl:if test=".//pubdate">
					<xsl:choose>               
						<xsl:when test=".//pubdate/sdate | .//pubdate/edate">                  
							<xsl:call-template name="FormatDate">
								<xsl:with-param name="date" select="normalize-space(./pubdate/sdate)"></xsl:with-param>                     
								<xsl:with-param name="text" select="1"></xsl:with-param>                     
								<xsl:with-param name="lang" select="$lang"></xsl:with-param>                  
							</xsl:call-template>                  
							<xsl:if test=".//pubdate/edate">                                 
								<xsl:call-template name="FormatDate">                        
									<xsl:with-param name="date" select="normalize-space(./pubdate/edate)"></xsl:with-param>                        
									<xsl:with-param name="text" select="1"></xsl:with-param>                        
									<xsl:with-param name="lang" select="$lang"></xsl:with-param>                     
								</xsl:call-template>                  
							</xsl:if>               
						</xsl:when>               
						<xsl:when test=".//pubdate/text()">   
							<!-- if <pubdate>2012</pubdate>, show 2012, instead of showing 2012(2012) 
							     If the text in <pubdate> contains less than 5 bytes (e.g., <pubdate>2012</pubdate>), display the text as it is.
								 Needs to be checked if the text is date formart such as YYYYMMDD, MMDDYYYY, DDMMYYYY (to be developed later).						
							-->   
							<xsl:choose>  
								<xsl:when test="string-length(.//pubdate/text()) &gt; 5">          
									<xsl:call-template name="FormatDate">                       
										<xsl:with-param name="date" select="normalize-space(.//pubdate)"></xsl:with-param>                     
										<xsl:with-param name="show_date" select="'1'"></xsl:with-param>                     
										<xsl:with-param name="lang" select="$lang"></xsl:with-param>  
										<xsl:with-param name="text" select="'1'"></xsl:with-param>                
									</xsl:call-template>
									(<xsl:call-template name="format_date_yyyy-mm-dd">
										<xsl:with-param name="date" select="normalize-space(.//pubdate)"></xsl:with-param>                                      
										<xsl:with-param name="lang" select="$lang"></xsl:with-param> 
									</xsl:call-template>),
								</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select=".//pubdate/text()"/><xsl:value-of select="','"/>
							</xsl:otherwise>
							</xsl:choose>							
						</xsl:when> 
					</xsl:choose> 
				</xsl:if>
				
				<xsl:if test=".//imprint">               
					<xsl:choose>                  
						<xsl:when test=".//address/text">                     
							<xsl:value-of select="normalize-space(.//imprint/address/text)"></xsl:value-of>                  
						</xsl:when>                  
						<xsl:otherwise>                     
							<xsl:if test=".//address/city">                        
								<xsl:value-of select=".//address/city"></xsl:value-of>                        
								<xsl:call-template name="addCommaAsNeeded">                           
									<xsl:with-param name="string" select="normalize-space(.//address/city)"></xsl:with-param>                        
								</xsl:call-template>                     
							</xsl:if>                     
							<xsl:if test=".//address/state">                        
								<xsl:value-of select="normalize-space(.//address/state)"></xsl:value-of>                     
							</xsl:if>                  
						</xsl:otherwise>               
					</xsl:choose>            
				</xsl:if>            
				<xsl:if test=".//imprint/name and string-length(.//imprint/name) &gt; 0">               
					<!-- <xsl:text>: </xsl:text> -->               
					<xsl:value-of select="normalize-space(.//imprint/name)"></xsl:value-of>               
					<xsl:call-template name="addCommaAsNeeded">                  
						<xsl:with-param name="string" select="normalize-space(.//imprint/name)"></xsl:with-param>               
					</xsl:call-template>            
				</xsl:if>            

				<xsl:apply-templates select="location"/>
				
				<xsl:if test=".//refno">
					<xsl:apply-templates select=".//refno" />
				</xsl:if>
				
				<xsl:if test=".//doi">
					<xsl:apply-templates select=".//doi" />
				</xsl:if>
				            
				<xsl:if test=".//isbn"> 
					<xsl:apply-templates select=".//isbn" /> 
				</xsl:if>  
				          
				<xsl:if test=".//issn"> 
					<xsl:apply-templates select=".//issn" /> 
				</xsl:if>  
				          
				<xsl:if test="parent::nplcit/@url">               
					<xsl:text>&#160;</xsl:text>               
					(<a herf="{parent::nplcit/@url}">                     
							<xsl:value-of select="parent::nplcit/@url"></xsl:value-of>                  
					</a>).           
				</xsl:if>         
			</xsl:otherwise>
			<!-- end article subelements (not <text>) -->
		</xsl:choose>   
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>

	<!-- 
	ELEMENT book (text | (author* , (book-title+ | conference) , 
	      (subtitle? , subname* , edition? , imprint? , vid? , ino? , descrip? , series? , 
	      notes? , absno? , location* , pubid? , bookno? , class* , keyword* , cpyrt? , 
	      doi? , issn? , isbn* , refno*)))>
	 -->
 	<xsl:template match="book">	      
		<xsl:call-template name="openDIVwithNodePath" />    
		<xsl:choose>         
			<xsl:when test="./text">            
				<xsl:value-of select="normalize-space(./text)"></xsl:value-of>            
				<xsl:if test="parent::nplcit/@url">               
					<xsl:text> 
					</xsl:text>               
					(<a href="{parent::nplcit/@url}">                     
							<xsl:value-of select="parent::nplcit/@url"></xsl:value-of>                  
					 </a>).
				</xsl:if>         
			</xsl:when>         
			<xsl:otherwise>            
				<xsl:apply-templates select=".//author"/> 
				
				<xsl:choose>         
					<xsl:when  test="./book-title"> 
						<xsl:apply-templates select="./book-title"/>           
					</xsl:when>         
					<xsl:when test="./conference">
						<xsl:choose>         
							<xsl:when  test="./conference/text"> 
								<xsl:value-of select="./conference/text" />      
							</xsl:when>         
							<xsl:when test="./conference/conftitle">
								<xsl:value-of select="./conference/conftitle" /> 
							</xsl:when>
						</xsl:choose>  
					</xsl:when>
				</xsl:choose>            
			     
				<xsl:if test="./subname">               
					<xsl:apply-templates select="./subname"/>            
				</xsl:if>
				
				<!-- subtitle -->
				<xsl:if test="./subtitle and string-length(./subtitle) &gt; 0">
				<i>                     
					<xsl:value-of select="normalize-space(./subtitle)" />   
				</i>
				</xsl:if>
					  
				<xsl:if test=".//vid ">
					<xsl:apply-templates select=".//vid"/> 
				</xsl:if>
				
				<xsl:if test=".//ino">				
					<xsl:apply-templates select=".//ino"/>
				</xsl:if>
							
				<xsl:if test=".//edition">               
					<xsl:call-template name="rtrim">                  
						<xsl:with-param name="string" select="normalize-space(.//edition)"></xsl:with-param>               
					</xsl:call-template>            
				</xsl:if> 
				
				<xsl:if test=".//imprint">               
					<xsl:choose>                  
						<xsl:when test=".//address/text">                     
							<xsl:value-of select="normalize-space(.//imprint/address/text)"></xsl:value-of>                  
						</xsl:when>                  
						<xsl:otherwise>                     
							<xsl:if test=".//address/city">                        
								<xsl:value-of select=".//address/city"></xsl:value-of>                        
								<xsl:call-template name="addCommaAsNeeded">                           
									<xsl:with-param name="string" select="normalize-space(.//address/city)"></xsl:with-param>                        
								</xsl:call-template>                     
							</xsl:if>                     
							<xsl:if test=".//address/state">                        
								<xsl:value-of select="normalize-space(.//address/state)"></xsl:value-of>                     
							</xsl:if>                  
						</xsl:otherwise>               
					</xsl:choose>            
				</xsl:if>            
				<xsl:if test=".//imprint/name">               
					<!-- <xsl:text>: </xsl:text> -->               
					<xsl:value-of select="normalize-space(.//imprint/name)"></xsl:value-of>               
					<xsl:call-template name="addCommaAsNeeded">                  
						<xsl:with-param name="string" select="normalize-space(.//imprint/name)"></xsl:with-param>               
					</xsl:call-template>            
				</xsl:if>            
<!-- 				<xsl:if test=".//imprint/pubdate">               
					<xsl:text> 
					</xsl:text>               
					<xsl:call-template name="FormatDate">  
						<xsl:with-param name="date" select="normalize-space(.//pubdate)"></xsl:with-param>                  
						<xsl:with-param name="text" select="1"></xsl:with-param>                  
						<xsl:with-param name="lang" select="$lang"></xsl:with-param> 						              
					</xsl:call-template>               
					<xsl:call-template name="format_period">                  
						<xsl:with-param name="string" select="normalize-space(.//pubdate)"></xsl:with-param>               
					</xsl:call-template>            
				</xsl:if>  --> 
				           
				<xsl:apply-templates select="location"/>
				
				<xsl:if test=".//refno">
					<xsl:apply-templates select=".//refno" />
				</xsl:if>
				
				<xsl:if test=".//doi">
					<xsl:apply-templates select=".//doi" />
				</xsl:if>
				            
				<xsl:if test=".//isbn"> 
					<xsl:apply-templates select=".//isbn" /> 
				</xsl:if>  
				          
				<xsl:if test=".//issn"> 
					<xsl:apply-templates select=".//issn" /> 
				</xsl:if>  
				          
				<xsl:if test="parent::nplcit/@url">               
					<xsl:text>&#160;</xsl:text>               
					(<a herf="{parent::nplcit/@url}">                     
							<xsl:value-of select="parent::nplcit/@url"></xsl:value-of>                  
					</a>).           
				</xsl:if>         
			</xsl:otherwise>
		</xsl:choose>   
		
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<xsl:template match="book-title">
		<i><xsl:text>&quot;</xsl:text>                  
			<xsl:value-of select="normalize-space(.)"></xsl:value-of> 
			<xsl:text>&quot;</xsl:text>                    
			<xsl:call-template name="addCommaAsNeeded">                        
				<xsl:with-param name="string" select="."></xsl:with-param>                     
			</xsl:call-template>                     
			<xsl:text>&#160;</xsl:text>                  
		</i> 
	</xsl:template>
	
	<xsl:template name="trimQuotation">
		<xsl:param name="sText" />
		
		<xsl:variable name="stdText" select="translate(translate($sText, $quotNonLatinLeft, '&quot;'), $quotNonLatinRight,'&quot;')" /> 
		<xsl:variable name="isEndsWithQuot">
			<xsl:call-template name="isStringEndsWith">
				<xsl:with-param name="sText" select="$sText"/>
				<xsl:with-param name="sEndsWith" select="'&quot;'"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="starts-with($stdText, '&quot;') and $isEndsWithQuot">
				<xsl:variable name="tmpStr" select="substring-after($stdText, '&quot;')"/>
				<xsl:value-of select="substring($tmpStr, 1, string-length($tmpStr) - string-length('&quot;'))" />
			</xsl:when>
			<xsl:when test="starts-with($stdText, '&quot;')">
				<xsl:value-of select="substring-after($stdText, '&quot;')"/>
			</xsl:when>
			<xsl:when test="$isEndsWithQuot">
				<xsl:value-of select="substring($stdText, 1, string-length($stdText) - string-length('&quot;') +1)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$stdText"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="isStringEndsWith">
		<xsl:param name="sText" />
		<xsl:param name="sEndsWith" />
		
		<xsl:value-of select="boolean($sEndsWith=substring($sText, string-length($sText) - string-length($sEndsWith) +1))" />
	</xsl:template>
	
	<xsl:template name="Form210Legend">
		<table width="100%"><tr><td width="50%">
			<table>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text> *</xsl:text>
						</div>
					</td>
					<td align="justify">
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='SpecialCategoriesOfCitedDocuments']" />
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text>"A"</xsl:text>
						</div>						
					</td>
					<td align="justify" >
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='CategoriesCitedDocumentsA']" />
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text>"D"</xsl:text>
						</div>						
					</td>
					<td align="justify" >
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='CategoriesCitedDocumentsD']" />
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text>"E"</xsl:text>
						</div>
					</td>
					<td align="justify">
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='CategoriesCitedDocumentsE']" />
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text>"L"</xsl:text>
						</div>
					</td>
					<td align="justify">
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='CategoriesCitedDocumentsL']" />
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text>"O"</xsl:text>
						</div>
					</td>
					<td align="justify">
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='CategoriesCitedDocumentsO']" />
						</div>
					</td>
				</tr>
				<tr valign="top">
					<td align="center" >
						<div class="footnote">
							<xsl:text>"P"</xsl:text>
						</div>
					</td>
					<td align="justify">
						<div class="footnote">
							<xsl:apply-templates
								select="$common_table/label[@name ='CategoriesCitedDocumentsP']" />
						</div>
					</td>
				</tr>
			</table>
		</td>
		<td>
			<table>
					<tr valign="top">
						<td align="center" padding-top="6mm">
							<div class="footnote">
								<xsl:text>"T"</xsl:text>
							</div>
						</td>
						<td align="justify" padding-top="5mm" >
							<div class="footnote">
								<xsl:apply-templates select="$common_table/label[@name ='CategoriesCitedDocumentsT']"/>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td align="center" >
							<div class="footnote">
								<xsl:text>"X"</xsl:text>
							</div>
						</td>
						<td align="justify" >
							<div class="footnote">
								<xsl:apply-templates select="$common_table/label[@name ='CategoriesCitedDocumentsX']"/>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td align="center" >
							<div class="footnote">
								<xsl:text>"Y"</xsl:text>
							</div>
						</td>
						<td align="justify" >
							<div class="footnote">
								<xsl:apply-templates select="$common_table/label[@name ='CategoriesCitedDocumentsY']"/>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td align="center">
							<div class="footnote">
								<xsl:text>"&amp;"</xsl:text>
							</div>
						</td>
						<td align="justify" >
							<div class="footnote">
								<xsl:apply-templates select="$common_table/label[@name ='CategoriesCitedDocumentsAND']"/>
							</div>
						</td>
					</tr>
			</table>
		</td>
		</tr>
	   </table>
	</xsl:template>
	
<!--  START OF FORM203 -->	
<!--  DECLARATION OF NON-ESTABLISHMENT OF ISR -->
	<xsl:template name="Form203">
		<div class="contentBlock" style="margin-bottom:6px;">
			<div style="margin-bottom:2px;">
				<xsl:apply-templates select="//search-report/srep-info/srep-established"/>
			</div>
						
			<xsl:call-template name="openDIVwithNodePath">
				<xsl:with-param name="passInNodePath" select="'/srep-for-pub/srep-declaration'" />
			</xsl:call-template>
			
			<!-- 1. The subject matter of the international application relates to-->
			<xsl:call-template name="srep-declaration-subject-matter" mode="FORM203" />
		
			<!-- 2. Failure of the following parts ...-->
			<xsl:call-template name="srep-declaration-compliance" mode="FORM203" /> 
						
			<!-- 3. A meaningful search could not be carried ...-->
			<xsl:call-template name="srep-declaration-sequence-listing" mode="FORM203" />
			
			<!-- 4. Further comments -->
			<xsl:call-template name="additional-info" mode="FORM203" />
				
			<xsl:call-template name="closeDIV" />
		
		</div>
	</xsl:template>

	<xsl:template name="srep-declaration-subject-matter" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		
		<div class="marginTop">
			<table>
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'1.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@scientific-theories|@mathematic-theories|@plant-varieties|@animal-varieties|@bio-processes|@business|@mental-act|@games|@treatment-human|@treatment-animal|@diagnostic-methods|@presentation-information|@computer-program = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text02']"/>
				</xsl:with-param>
				<xsl:with-param name="itemTitleEndingColon" select="true"/>
			</xsl:call-template>
			</table>
		</div>
		
		<div class="{$clsIndent40}">
			<table>
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'a.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@scientific-theories = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text03']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'b.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@mathematic-theories = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text04']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'c.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@plant-varieties = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text05']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'d.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@animal-varieties = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text06']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'e.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@bio-processes = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text07']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'f.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@business = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text08']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'g.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@mental-act = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text09']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'h.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@games = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text10']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'i.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@treatment-human = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text11']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'j.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@treatment-animal = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text12']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'k.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@diagnostic-methods = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text13']"/>
				</xsl:with-param>
			</xsl:call-template>	
			
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'l.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@presentation-information = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text14']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'m.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@computer-program = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text15']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			</table>	
		</div>
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<xsl:template name="srep-declaration-compliance" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		
		<div class="marginTop">
			<table>
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'2.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@description|@claims|@drawings = 'no'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text16']"/>
				</xsl:with-param>
				<xsl:with-param name="itemTitleEndingColon" select="true"/>
			</xsl:call-template>
			</table>
		</div>
				
		<div class="{$clsIndent40}">
			<table width="70%">
				<tr valign="top">
					<td >
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@description = 'no'])" />
						</xsl:call-template>
						<xsl:call-template name="spaces"/>
						<xsl:apply-templates select="$common_table/label[@name ='TheDescription']"/>
					</td>
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@claims = 'no'])" />
						</xsl:call-template>
						<xsl:call-template name="spaces"/>
						<xsl:apply-templates select="$common_table/label[@name ='TheClaims']"/>
					</td>
					<td>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@drawings = 'no'])" />
						</xsl:call-template>
						<xsl:call-template name="spaces"/>
						<xsl:apply-templates select="$common_table/label[@name ='TheDrawings']"/>
					</td>
				</tr>
			</table>
		</div>

<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
		
	<xsl:template name="srep-declaration-sequence-listing" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		
		<div class="marginTop">
			<table>
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="itemNo" select="'3.'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@paper|@electronic|@late-furnishing-fee = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text17']"/>
				</xsl:with-param>
				<xsl:with-param name="itemTitleEndingColon" select="true"/>
			</xsl:call-template>
			</table>
		</div>
		
		<div class="{$clsIndent40}">
			<table>
			<xsl:choose>
				<xsl:when test="($version_indicator &lt; 201501) or ($version_indicator = '')">
					<xsl:call-template name="BoxGeneral">
						<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@paper = 'yes'])"/>
						<xsl:with-param name="itemTitle" select="$form_table/label[@name ='ISA203Text18']"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="BoxGeneral">
						<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@electronic = 'yes'])"/>
						<xsl:with-param name="itemTitle" select="$form_table/label[@name ='ISA203-furnishASequenceListingInTheFormOfAnnexCST25']"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
					
			<xsl:choose>
				<xsl:when test="($version_indicator &lt; 201501) or ($version_indicator = '')">
					<xsl:call-template name="BoxGeneral">
						<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@electronic = 'yes'])"/>
						<xsl:with-param name="itemTitle" select="$form_table/label[@name ='ISA203Text19']"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="BoxGeneral">
						<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@paper = 'yes'])"/>
						<xsl:with-param name="itemTitle" select="$form_table/label[@name ='ISA203-furnishASequenceListingOnPaper']"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:call-template name="BoxGeneral">
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@late-furnishing-fee = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text20']"/>
				</xsl:with-param>
			</xsl:call-template>
			</table>		
		</div>
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<!--  	
		<!ELEMENT additional-info (p+)>
		
		Note: Different from WOSA	
	 -->
	<xsl:template name="additional-info" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		<div>
			<xsl:text>4. </xsl:text>
			<xsl:apply-templates select="$common_table/label[@name ='FurtherComments']"/>
			<xsl:apply-templates select="$common_table/label[@name ='MarkColon']"/>
		</div>
			
		<div class="{$clsIndent40}">
			<xsl:apply-templates select="//srep-for-pub/srep-declaration/additional-info/p" mode="SQUARE_BRACKED" />
		</div>					
		
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
<!-- END OF FORM203 -->

<!--  START OF FORM203 AR (Arabic Specific!)-->	
<!--  DECLARATION OF NON-ESTABLISHMENT OF ISR -->
	<xsl:template name="Form203_AR">
		<div class="contentBlock" style="margin-bottom:6px;">
			<div style="margin-bottom:2px;">
				<xsl:apply-templates select="//search-report/srep-info/srep-established"/>
			</div>
						
			<xsl:call-template name="openDIVwithNodePath">
				<xsl:with-param name="passInNodePath" select="'/srep-for-pub/srep-declaration'" />
			</xsl:call-template>
			
			<!-- 1. The subject matter of the international application relates to-->
			<xsl:call-template name="srep-declaration-subject-matter_AR" mode="FORM203" />
		
			<!-- 2. Failure of the following parts ...-->
			<xsl:call-template name="srep-declaration-compliance_AR" mode="FORM203" /> 
						
			<!-- 3. A meaningful search could not be carried ...-->
			<xsl:call-template name="srep-declaration-sequence-listing_AR" mode="FORM203" />
			
			<!-- 4. Further comments -->
			<xsl:call-template name="additional-info_AR" mode="FORM203" />
				
			<xsl:call-template name="closeDIV" />
		
		</div>
	</xsl:template>

	<xsl:template name="srep-declaration-subject-matter_AR" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		
		<div class="marginTop">
			<table>
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.1'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@scientific-theories|@mathematic-theories|@plant-varieties|@animal-varieties|@bio-processes|@business|@mental-act|@games|@treatment-human|@treatment-animal|@diagnostic-methods|@presentation-information|@computer-program = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text02']"/>
				</xsl:with-param>
				<xsl:with-param name="itemTitleEndingColon" select="true"/>
			</xsl:call-template>
			</table>
		</div>
		
		<div class="indent40_R">
			<table>
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.a'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@scientific-theories = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text03']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.b'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@mathematic-theories = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text04']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.c'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@plant-varieties = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text05']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.d'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@animal-varieties = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text06']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.e'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@bio-processes = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text07']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.f'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@business = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text08']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.g'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@mental-act = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text09']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.h'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@games = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text10']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.i'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@treatment-human = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text11']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.j'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@treatment-animal = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text12']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.k'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@diagnostic-methods = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text13']"/>
				</xsl:with-param>
			</xsl:call-template>	
			
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.l'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@presentation-information = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text14']"/>
				</xsl:with-param>
			</xsl:call-template>
				
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.m'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-subject-matter[@computer-program = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text15']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			</table>	
		</div>
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<xsl:template name="srep-declaration-compliance_AR" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		
		<div class="marginTop">
			<table>
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.2'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@description|@claims|@drawings = 'no'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text16']"/>
				</xsl:with-param>
				<xsl:with-param name="itemTitleEndingColon" select="true"/>
			</xsl:call-template>
			</table>
		</div>
		
		<div class="indent40_R">
			<table width="70%">
				<tr valign="top">
					<td >
						<xsl:apply-templates select="$common_table/label[@name ='TheDescription']"/>
						<xsl:call-template name="spaces"/>						
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@description = 'no'])" />
						</xsl:call-template>
					</td>
					<td>						
						<xsl:apply-templates select="$common_table/label[@name ='TheClaims']"/>
						<xsl:call-template name="spaces"/>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@claims = 'no'])" />
						</xsl:call-template>
					</td>
					<td>
						<xsl:apply-templates select="$common_table/label[@name ='TheDrawings']"/>
						<xsl:call-template name="spaces"/>
						<xsl:call-template name="BoxToCheck">
							<xsl:with-param name="check_condition" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-compliance[@drawings = 'no'])" />
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</div>

<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
		
	<xsl:template name="srep-declaration-sequence-listing_AR" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		
		<div class="marginTop">
			<table>
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="itemNo" select="'.3'"/>
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@paper|@electronic|@late-furnishing-fee = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text17']"/>
				</xsl:with-param>
				<xsl:with-param name="itemTitleEndingColon" select="true"/>
			</xsl:call-template>
			</table>
		</div>
		
		<div class="indent40_R">
			<table>
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@paper = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text18']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@electronic = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text19']"/>
				</xsl:with-param>
			</xsl:call-template>
			
			<xsl:call-template name="BoxGeneral_AR">
				<xsl:with-param name="isChecked" select="boolean(//srep-for-pub/srep-declaration/srep-declaration-sequence-listing[@late-furnishing-fee = 'yes'])"/>
				<xsl:with-param name="itemTitle">
					<xsl:value-of select="$form_table/label[@name ='ISA203Text20']"/>
				</xsl:with-param>
			</xsl:call-template>
			</table>		
		</div>
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
	<!--  	
		<!ELEMENT additional-info (p+)>
		
		Note: Different from WOSA	
	 -->
	<xsl:template name="additional-info_AR" mode="FORM203">
<!-- 		<xsl:call-template name="openDIVwithNodePath" /> -->
		<div>
			<table>
				<tr align="right">
					<td><xsl:apply-templates select="$common_table/label[@name ='MarkColon']"/>
					<xsl:apply-templates select="$common_table/label[@name ='FurtherComments']"/></td>
					<td>.4 </td>
				</tr>
			</table>
		</div>
			
		<div class="indent40_R">
			<xsl:apply-templates select="//srep-for-pub/srep-declaration/additional-info/p" mode="SQUARE_BRACKED_AR" />
		</div>					
		
<!-- 		<xsl:call-template name="closeDIV" /> -->
	</xsl:template>
	
<!-- END OF FORM203 AR -->

<!-- 
	==============================
	General Functions
	=============================
 -->
 	<!-- Generic function to create a HTML combobox. The parameter "options" 
		is the xml segment that specifies how the combobox is to be built. <options> 
		<option> <value>0</value> <text>first text</text> </option> <option> <value>1</value> 
		<text>second text</text> </option> <option> <value>2</value> <text>third 
		text</text> </option> <option> <value>3</value> <text>third text</text> </option> 
		</options> The parameter "selectedList" contains the value that should be 
		selected (surrounded with "[]") -->
		
	<xsl:template name="capitalize-first-letter">
  	    <xsl:param name="inputString" />
  	    
  	    <xsl:if test="string-length($inputString)!=0">
		<xsl:variable name="firstLetter" select="substring($inputString, 1, 1)" />		
		
		<xsl:variable name="otherLetters">
			<xsl:choose>
				<xsl:when test="string-length($inputString) &gt; 1">
					<xsl:value-of select="substring($inputString, 2)"/>
				</xsl:when>
				<xsl:otherwise>		
					<xsl:value-of select="''"/>		
				</xsl:otherwise>			
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="concat(translate($firstLetter, $smallcase, $uppercase), $otherLetters)" />
		</xsl:if>
  	</xsl:template>
  	
	<xsl:template name="createCombobox">
		<xsl:param name="options"></xsl:param>
		<xsl:param name="selectedList"></xsl:param>
		<xsl:param name="addEmptyOption"></xsl:param>

		<xsl:variable name="nodeOptions" select="exsl:node-set($options)/options" />
		<xsl:variable name="selectedString" select="normalize-space($selectedList)" />
		<xsl:variable name="emptyOption" select="normalize-space($addEmptyOption)" />

		<xsl:if test="$nodeOptions">
			<select>
				<xsl:if test="$emptyOption='true'">
					<option value="" />
					<xsl:if test="$selectedString=''">
						<xsl:attribute name="selected">true</xsl:attribute>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="$nodeOptions/option">
					<option value="./value">
						<xsl:variable name="optionValue"
							select='concat("[", normalize-space(./value), "]")' />
						<xsl:if test="contains($selectedString, $optionValue)">
							<xsl:attribute name="selected">true</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="./text" />
					</option>
				</xsl:for-each>
			</select>
		</xsl:if>
	</xsl:template>

	<!-- UTILS -->
	<xsl:template name="getDecodedLang">
		<xsl:param name="encoded" select="''"></xsl:param>
		<xsl:choose>
			<xsl:when test="$encoded='en'">
				<xsl:value-of select="'English'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='fr'">
				<xsl:value-of select="'French'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='es'">
				<xsl:value-of select="'Spanish'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='zh'">
				<xsl:value-of select="'Chinese'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='ja'">
				<xsl:value-of select="'Japanese'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='ko'">
				<xsl:value-of select="'Korea'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='ar'">
				<xsl:value-of select="'Arabic'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$encoded='ru'">
				<xsl:value-of select="'Russia'"></xsl:value-of>
			</xsl:when>
			<xsl:when test="$lang='pt'">
				<xsl:value-of select="'Português'"></xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="getCurrentNodeWithChildrenInDIV">
		<xsl:param name="LabelText" select="''"></xsl:param>
		<xsl:call-template name="getCurrentNodeInDIV">
			<xsl:with-param name="showChildren" select="true"></xsl:with-param>
			<xsl:with-param name="LabelText" select="$LabelText"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="getCurrentNodeInDIV">
		<xsl:param name="LabelText" select="''"></xsl:param>
		<xsl:param name="showChildren" select="false"></xsl:param>
		
		<xsl:choose>
			<xsl:when test="name()='document-id'"> <!-- need test -->
				<xsl:value-of select="'document-id'"></xsl:value-of>
				<xsl:call-template name="PctIaNumber"></xsl:call-template>
			</xsl:when>
			<xsl:when test="not(.='')">
				<xsl:call-template name="openDIVwithNodePath" />
				<xsl:if test="not($LabelText='')">
					<b><i>					
					<xsl:value-of select="$LabelText"></xsl:value-of>
					</i></b><!-- This should be set by parameter -->
				</xsl:if>
							
				<xsl:value-of select="."></xsl:value-of>				
				<xsl:call-template name="closeDIV" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$showChildren='true'">
					<xsl:for-each select="child::*"> <!-- need test seems not working??-->
						<xsl:call-template name="getCurrentNodeWithChildrenInDIV" />
					</xsl:for-each>
				</xsl:if>			
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getNodeAttributesInDIV">
		<xsl:call-template name="openDIVwithNodePath" />
		<xsl:call-template name="tab" />
		<xsl:call-template name="getNodeAttributes"></xsl:call-template>
		<xsl:call-template name="closeDIV" />
	</xsl:template>
	
	<xsl:template name="getNodeAttributes">
		<xsl:param name="addNewLine" select="'false'"></xsl:param>
		<b><xsl:value-of select="name()"/>:</b>
		<xsl:call-template name="tab" />
		<xsl:for-each select="@*">		
			<xsl:if test="$addNewLine='true' and position()>1 " ><br/></xsl:if>		
			<xsl:call-template name="tab" />		
			<xsl:value-of select="name()"/>:
			<xsl:call-template name="spaces" /> 		
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="openP">
		<xsl:text disable-output-escaping="yes">&lt;p nodePath="</xsl:text>
		<xsl:for-each select="ancestor-or-self::*">
			<xsl:value-of select="name()" />
			<xsl:text>/</xsl:text>
		</xsl:for-each>
		<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
	</xsl:template>

	<xsl:template name="closeP">
		<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
	</xsl:template>
	
	<xsl:template name="openDIVwithNodePathByParam">		
		<xsl:param name="path" />
	    <xsl:if test="not($media = 'web')">
			<xsl:text disable-output-escaping="yes">&lt;div nodePath="</xsl:text>
			<xsl:value-of select="$path" />	
			
			<xsl:text disable-output-escaping="yes">" style="background-color:</xsl:text>
			<xsl:value-of select="$bgcolor-editable" />
			<xsl:text disable-output-escaping="yes">;" &gt;</xsl:text>
		</xsl:if>
	</xsl:template>
		
	<xsl:template name="openDIVwithNodePath">
		<xsl:param name="attrName" />
		<xsl:param name="childName" />
		<xsl:param name="divClass" />
		<xsl:param name="passInNodePath" /> <!-- Override the dynamic node path -->
		<xsl:param name="id" /> <!-- to be used as ancor to jump in the editor -->
			
		<xsl:if test="not($media = 'web')">
			<xsl:variable name="autoId">
				<xsl:choose>
					<xsl:when test="$id and (string-length($id) &gt; 0)">
						<xsl:value-of select="$id"/>
					</xsl:when>					
					<xsl:otherwise>
						<xsl:value-of select="generate-id()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:text disable-output-escaping="yes">&lt;div nodePath="</xsl:text>
 			<xsl:choose>
				<xsl:when test="string-length($passInNodePath)!= 0">
					<xsl:value-of select="$passInNodePath" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="getCurrentNodePathAbsolute">
						<xsl:with-param name="attrName" select="$attrName" />
						<xsl:with-param name="childName" select="$childName" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>			 
			<xsl:text disable-output-escaping="yes">" style="background-color:</xsl:text>
			<xsl:value-of select="$bgcolor-editable" />
			<xsl:text disable-output-escaping="yes">;"</xsl:text>
			
			<xsl:if test="$divClass">
				<xsl:text disable-output-escaping="yes"> class="</xsl:text>
				<xsl:value-of select="$divClass" />
				<xsl:text disable-output-escaping="yes">"</xsl:text>
			</xsl:if>
			
<!-- 		
HTML Browser works with the div id anchor but JEditorPane does not. 
   -->
   			<xsl:text disable-output-escaping="yes"> idd="</xsl:text>
		    <xsl:value-of select="$autoId" />
		    <xsl:text disable-output-escaping="yes">"</xsl:text> 
		    
<!-- 		<xsl:text disable-output-escaping="yes"> id="</xsl:text>
		    <xsl:value-of select="$autoId" />
		    <xsl:text disable-output-escaping="yes">"</xsl:text> -->
		    		    
			<xsl:text disable-output-escaping="yes"> &gt;</xsl:text>
			
			<!-- Workaround for JEditorPane jump. Try again to remove it and use div.id when JDK upgraded.-->
 			<a name="{$autoId}" style="max-height: 1px; margin:0px; padding:0px;" />
		</xsl:if>
	</xsl:template>


	<xsl:template name="closeDIV">
		<xsl:if test="not($media = 'web')">
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<!-- The inline display on Web ok, but not in JEditorPane! -->
	<xsl:template name="openDIVwithNodePathInline">
		<xsl:param name="attrName" />
		<xsl:param name="childName" />
		<xsl:param name="id" /> <!-- to be used as ancor to jump in the editor -->
					
		<xsl:if test="not($media = 'web')">
			<xsl:variable name="autoId">
				<xsl:choose>
					<xsl:when test="$id and (string-length($id) &gt; 0)">
						<xsl:value-of select="$id"/>
					</xsl:when>					
					<xsl:otherwise>
						<xsl:value-of select="generate-id()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:text disable-output-escaping="yes">&lt;div nodePath="</xsl:text>
			<xsl:call-template name="getCurrentNodePathAbsolute">
				<xsl:with-param name="attrName" select="$attrName" />
				<xsl:with-param name="childName" select="$childName" />
			</xsl:call-template>
			
			<xsl:text disable-output-escaping="yes">" style="display:inline;margin: 0;background-color:</xsl:text>
			<xsl:value-of select="$bgcolor-editable" />
			<xsl:text disable-output-escaping="yes">;" </xsl:text>
			
			<!-- 		
HTML Browser works with the div id anchor but JEditorPane does not. 
   -->
   			<xsl:text disable-output-escaping="yes"> idd="</xsl:text>
		    <xsl:value-of select="$autoId" />
		    <xsl:text disable-output-escaping="yes">"</xsl:text> 
		    
<!-- 		<xsl:text disable-output-escaping="yes"> id="</xsl:text>
		    <xsl:value-of select="$autoId" />
		    <xsl:text disable-output-escaping="yes">"</xsl:text> -->
		    		    
			<xsl:text disable-output-escaping="yes"> &gt;</xsl:text>
			
			<!-- Workaround for JEditorPane jump. Try again to remove it and use div.id when JDK upgraded.-->
 			<a name="{$autoId}" style="max-height: 1px; margin:0px; padding:0px;" />
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template name="getCurrentNodePathAbsolute">
		<xsl:param name="childName" />
		<xsl:param name="attrName" />
		
		<!-- The absolute path for the current node -->
		<xsl:for-each select="ancestor-or-self::*">
			<xsl:call-template name="getNodeNameAndPosition" />
		</xsl:for-each>
		
		<xsl:choose>		
			<!-- In case of an attribute of current node specified, add to the current node -->
			<xsl:when test="$attrName">
				<xsl:value-of select="'/'"></xsl:value-of>
				<xsl:if test="not (starts-with($attrName, '@'))">
					<xsl:value-of select="'@'"></xsl:value-of>
				</xsl:if>
				<xsl:value-of select="$attrName"></xsl:value-of>
			</xsl:when>
			
			<!-- In case a child specified, go futher to the child of currecnt node -->
			<xsl:when test="$childName">
				<xsl:value-of select="'/'"></xsl:value-of>
				<xsl:value-of select="$childName"></xsl:value-of>
			</xsl:when>	
		</xsl:choose>
	</xsl:template>
	
	 <xsl:template name="getNodeNameAndPosition">
	 	<xsl:param name="curName" select="name()"/>
        <xsl:value-of select="'/'" />
        <xsl:value-of select="name()"/>
        <xsl:value-of select="'['" />
        <xsl:value-of select="1+count(preceding-sibling::*[name()=$curName])"/> <!-- only want the count for the same element -->
        <xsl:value-of select="']'" />
    </xsl:template>

	<!-- paths from elements -->
<!-- 	<xsl:template name="elementPath">
		<xsl:for-each select="(ancestor-or-self::*)">
			/*[
			<xsl:value-of select="1+count(preceding-sibling::*)" />
			]
		</xsl:for-each>
	</xsl:template>

	paths from attributes
	<xsl:template name="attributePath">
		<xsl:for-each select="parent::*">
			<xsl:call-template name="elementPath" />
		</xsl:for-each>
		<xsl:text>/@</xsl:text>
		<xsl:value-of select="name(.)" />
	</xsl:template> -->

	<xsl:template name="closeDIVInline">
		<xsl:if test="not($media = 'web')">
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;  </xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="tab">
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>	
	</xsl:template>
	
	<xsl:template name="spaces">
		<xsl:param name="count" select="1"/>
		<xsl:if test="$count > 0">		
			<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
			<xsl:call-template name="spaces">
	        	<xsl:with-param name="count" select="$count - 1"/>
	        </xsl:call-template>
        </xsl:if>
	</xsl:template>
	
	<xsl:template name="dots">  
      <xsl:param name="count" select="1"/>
      <xsl:if test="$count > 0">
        <xsl:text>.</xsl:text>
        <xsl:call-template name="dots">
          <xsl:with-param name="count" select="$count - 1"/>
        </xsl:call-template>
      </xsl:if>
  	</xsl:template>
  
  <xsl:template name="format_short_date">
      <xsl:param name="lang"></xsl:param>
      <xsl:param name="date"></xsl:param>
      <xsl:param name="delimiter"></xsl:param>
      <xsl:param name="nDate">
         <xsl:value-of select="normalize-space(translate($date,'/\.,-',''))"></xsl:value-of>
      </xsl:param>
      <xsl:param name="y" select="substring($nDate, 1,4)"></xsl:param>
      <xsl:param name="m" select="substring($nDate,5,2)"></xsl:param>
      <xsl:param name="d" select="substring($nDate,7,2)"></xsl:param>
      
      <xsl:variable name="delimt">
      	 <xsl:choose>
			<xsl:when test="$delimiter!=''">
				<xsl:value-of disable-output-escaping="yes" select="$delimiter"></xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
      			<xsl:value-of disable-output-escaping="yes" select="'&#x2E;'"></xsl:value-of>
      		</xsl:otherwise>
      	</xsl:choose>
      </xsl:variable>
      
      <xsl:choose>
			<xsl:when test="$lang='fr' or $lang='es' or $lang='pt'"> 
				<xsl:value-of select="$d" />
				<xsl:value-of select="$delimt" />
				<xsl:value-of select="$m" />
				<xsl:value-of select="$delimt" />
				<xsl:value-of select="$y" />
			</xsl:when>
			<xsl:when test="$lang='en'">
			 	<xsl:choose>        
		         	<xsl:when test="'EP'=$srepOffice or 'WO'=$srepOffice">
		            	<xsl:value-of select="$d"></xsl:value-of>.<xsl:value-of select="$m"></xsl:value-of>.<xsl:value-of select="$y"></xsl:value-of>
		         	</xsl:when>
		      	 	<xsl:otherwise>
						<xsl:value-of select="$y" />
						<xsl:value-of select="'-'" />
						<xsl:value-of select="$m" />
						<xsl:value-of select="'-'" />
						<xsl:value-of select="$d" />
					</xsl:otherwise>
				</xsl:choose>				
			</xsl:when>
			<xsl:otherwise> <!-- covers DE, JP, ZH, KO and others -->
				<xsl:value-of select="$y" />
				<xsl:value-of select="$delimt" />
				<xsl:value-of select="$m" />
				<xsl:value-of select="$delimt" />
				<xsl:value-of select="$d" />
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
    
    <xsl:template name="format_date_dd_Month_yyyy">
    	<xsl:param name="lang"></xsl:param>
      	<xsl:param name="date"></xsl:param>      	
      	      	
      	<xsl:if test="$date !=''" >
	    	<xsl:call-template name="FormatDate">
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="lang" select="$lang" />
				<xsl:with-param name="show_date" select="'1'" />
				<xsl:with-param name="text" select="'1'" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	 <xsl:template name="format_date_yyyy-mm-dd">
    	<xsl:param name="lang"></xsl:param>
      	<xsl:param name="date"></xsl:param>
      	      	
    	 <xsl:param name="nDate">
        	 <xsl:value-of select="normalize-space(translate($date,'/\.,-',''))"></xsl:value-of>
	      </xsl:param>
	      <xsl:param name="y" select="substring($nDate,1,4)"></xsl:param>
	      <xsl:param name="m" select="substring($nDate,5,2)"></xsl:param>
	      <xsl:param name="d" select="substring($nDate,7,2)"></xsl:param>
	      
	      <xsl:value-of select="$y"/>
	      <xsl:if test="string-length($m) &gt;0">
	      	 <xsl:value-of select="concat('-', $m)"/>
	      	
	      	  <xsl:if test="string-length($d) &gt;0">
		      	<xsl:value-of select="concat('-', $d)"/>
		      </xsl:if>
	      </xsl:if>
	     
	</xsl:template>
	
	<xsl:template name="FormatDate">
		<xsl:param name="lang"/>
		<xsl:param name="date"/>
		<xsl:param name="text"/>
		<xsl:param name="year_only"/>
		<xsl:param name="show_date"/>
		<xsl:param name="add_comma"/>
		<xsl:param name="date_too"/>
		<xsl:param name="nDate">
			<xsl:value-of select="normalize-space(translate($date,'/\.,-',''))"/>
		</xsl:param>
		<xsl:param name="y" select="substring($nDate, 1,4)"/>
		<xsl:param name="m" select="substring($nDate,5,2)"/>
		<xsl:param name="d" select="substring($nDate,7,2)"/>
	
		<xsl:if test="$date != ''">
			<xsl:choose>
				<xsl:when test="$lang='ko' or $lang='zh'">
					<!-- YMD -->
					<xsl:choose>
						<xsl:when test="$year_only='1'">
							<xsl:value-of select="$y"/>
						</xsl:when>
						<xsl:when test="$text != '1'">
							<xsl:value-of select="$y"/>.<xsl:value-of select="$m"/>.<xsl:value-of select="$d"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$y"/>
							<xsl:if test="$y!=''">
								<xsl:apply-templates select="$common_table/label[@name ='Year']"/>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="$m='01'">
									<xsl:apply-templates select="$common_table/label[@name ='January']"/>
								</xsl:when>
								<xsl:when test="$m='02'">
									<xsl:apply-templates select="$common_table/label[@name ='February']"/>
								</xsl:when>
								<xsl:when test="$m='03'">
									<xsl:apply-templates select="$common_table/label[@name ='March']"/>
								</xsl:when>
								<xsl:when test="$m='04'">
									<xsl:apply-templates select="$common_table/label[@name ='April']"/>
								</xsl:when>
								<xsl:when test="$m='05'">
									<xsl:apply-templates select="$common_table/label[@name ='May']"/>
								</xsl:when>
								<xsl:when test="$m='06'">
									<xsl:apply-templates select="$common_table/label[@name ='June']"/>
								</xsl:when>
								<xsl:when test="$m='07'">
									<xsl:apply-templates select="$common_table/label[@name ='July']"/>
								</xsl:when>
								<xsl:when test="$m='08'">
									<xsl:apply-templates select="$common_table/label[@name ='August']"/>
								</xsl:when>
								<xsl:when test="$m='09'">
									<xsl:apply-templates select="$common_table/label[@name ='September']"/>
								</xsl:when>
								<xsl:when test="$m='10'">
									<xsl:apply-templates select="$common_table/label[@name ='October']"/>
								</xsl:when>
								<xsl:when test="$m='11'">
									<xsl:apply-templates select="$common_table/label[@name ='November']"/>
								</xsl:when>
								<xsl:when test="$m='12'">
									<xsl:apply-templates select="$common_table/label[@name ='December']"/>
								</xsl:when>
								<!-- trap error (e.g., 1-digit month) -->
								<xsl:otherwise>
									<xsl:value-of select="$m"/>
									<xsl:if test="$m!=''">
										<xsl:apply-templates select="$common_table/label[@name ='Month']"/>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$show_date='1'">
								<xsl:choose>
									<xsl:when test="starts-with($d, '0')">
										<xsl:value-of select="substring($d, 2)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$d"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="$d!=''">
									<xsl:apply-templates select="$common_table/label[@name ='Day']"/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="$date_too = '1'">
								<xsl:text> </xsl:text>
								<xsl:value-of select="concat('(',$y,'.',$m,'.',$d,')')"/>
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$lang='ja'">
					<!-- DD.MM.YYYY -->
					<xsl:choose>
						<xsl:when test="$form_number='WPA'">
								<xsl:value-of select="$y"/>
								<xsl:apply-templates select="$common_table/label[@name ='Year']"/>
								<xsl:value-of select="$m"/>
								<xsl:apply-templates select="$common_table/label[@name ='Month']"/>
								<xsl:value-of select="$d"/>
								<xsl:apply-templates select="$common_table/label[@name ='Day']"/>
							<xsl:text>(</xsl:text>
							<xsl:value-of select="$d"/>.<xsl:value-of select="$m"/>.<xsl:value-of select="$y"/>
							<xsl:text>)</xsl:text>
						</xsl:when>
						<xsl:when test="$year_only='1'">
							<xsl:value-of select="$y"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$d != ''">
								<xsl:value-of select="$d"/>.</xsl:if>
							<xsl:value-of select="$m"/>.<xsl:value-of select="$y"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<!-- DMY -->
					<xsl:choose>
						<xsl:when test="$year_only='1'">
							<xsl:value-of select="$y"/>
						</xsl:when>
						<xsl:when test="$text != '1'">
							<xsl:value-of select="$d"/>.<xsl:value-of select="$m"/>.<xsl:value-of select="$y"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$show_date='1'">
								<xsl:value-of select="$d"/>
								<xsl:if test="$lang='de'">.</xsl:if>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="$m='01'">
									<xsl:apply-templates select="$common_table/label[@name ='January']"/>
								</xsl:when>
								<xsl:when test="$m='02'">
									<xsl:apply-templates select="$common_table/label[@name ='February']"/>
								</xsl:when>
								<xsl:when test="$m='03'">
									<xsl:apply-templates select="$common_table/label[@name ='March']"/>
								</xsl:when>
								<xsl:when test="$m='04'">
									<xsl:apply-templates select="$common_table/label[@name ='April']"/>
								</xsl:when>
								<xsl:when test="$m='05'">
									<xsl:apply-templates select="$common_table/label[@name ='May']"/>
								</xsl:when>
								<xsl:when test="$m='06'">
									<xsl:apply-templates select="$common_table/label[@name ='June']"/>
								</xsl:when>
								<xsl:when test="$m='07'">
									<xsl:apply-templates select="$common_table/label[@name ='July']"/>
								</xsl:when>
								<xsl:when test="$m='08'">
									<xsl:apply-templates select="$common_table/label[@name ='August']"/>
								</xsl:when>
								<xsl:when test="$m='09'">
									<xsl:apply-templates select="$common_table/label[@name ='September']"/>
								</xsl:when>
								<xsl:when test="$m='10'">
									<xsl:apply-templates select="$common_table/label[@name ='October']"/>
								</xsl:when>
								<xsl:when test="$m='11'">
									<xsl:apply-templates select="$common_table/label[@name ='November']"/>
								</xsl:when>
								<xsl:when test="$m='12'">
									<xsl:apply-templates select="$common_table/label[@name ='December']"/>
								</xsl:when>
								<!-- trap error (e.g., 1-digit month) -->
								<xsl:otherwise>
									<xsl:value-of select="$m"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$lang='ar'">
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:value-of select="$y"/>
							<xsl:if test="$add_comma='1'">
								<xsl:text>, </xsl:text>
							</xsl:if>
							<!-- Show "(DD.MM.YYYY)" when $date_too is 1 or when RO office is IB.
								15/12/2016: (DD.MM.YYYY) may need to be shown in other RO/ISA/IPEA forms. It will be discussed.-->
							<xsl:if test="($date_too = '1') or 
												(/wo-form-ro/@ro-office = 'IB')">
								<xsl:text> </xsl:text>
								<xsl:value-of select="concat('(',$d,'.',$m,'.',$y,')')"/>
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="FormatDateISO8601">
		<xsl:param name="date"/>
		<xsl:param name="nDate">
			<xsl:value-of select="normalize-space(translate($date,'/\.,-',''))"/>
		</xsl:param>
		<xsl:param name="y" select="substring($nDate, 1,4)"/>
		<xsl:param name="m" select="substring($nDate,5,2)"/>
		<xsl:param name="d" select="substring($nDate,7,2)"/>
		<xsl:value-of select="$y"/>
		<xsl:if test="$m != ''">
			<!-- xsl:apply-templates select="$common_table/label[@name ='MarkHyphen']"/ -->
			<xsl:value-of select="concat('-',$m)"/>
		</xsl:if>
		<xsl:if test="$d != ''">
			<!-- xsl:apply-templates select="$common_table/label[@name ='MarkHyphen']"/ -->
			<xsl:value-of select="concat('-',$d)" />
		</xsl:if>
	</xsl:template>
	  
   <xsl:template name="jan_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> January </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Enero </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> janvier </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Januar</xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Январь </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 1 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 1月  </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 1월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Janeiro </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="feb_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> February </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Febrero </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> février </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Februar </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Февраль </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 2 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 2月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 2월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text> Fevereiro</xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="mar_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> March </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Marzo </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> mars </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> März </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Марг </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 3 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 3月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 3월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Março </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="apr_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> April </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Abril </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> avril </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> April</xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Апрель </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 4 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 4月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 4월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Abril </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="may_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> May </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Mayo </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> mai </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Mai</xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Май </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 5 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 5月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 5월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Maio </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="jun_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> June </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Junio </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> juin </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Juni </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Июнь </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 6 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 6月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 6월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Junho </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="jul_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> July </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Julio </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> juillet </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Juli</xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Июль </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 7 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 7月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 7월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Julho </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="aug_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> August </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Agosto </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> août </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> August </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Август </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 8 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 8月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 8월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Agosto </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="sep_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> September </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Septiembre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> septembre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> September </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Сентябрь </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 9 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 9月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 9월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text> Setembro </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="oct_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> October </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Octubre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> octobre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Oktober </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Октябрь </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 10 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 10月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 10월  </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text> Outubro </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="nov_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> November </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Noviembre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> novembre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> November </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Ноябрь </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 11 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 11月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 11월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Novembro </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="dec_ChoiceText">
      <xsl:param name="lang"></xsl:param>
      <xsl:choose>
         <xsl:when test="$lang='en'">
            <xsl:text> December </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='es'">
            <xsl:text> Diciembre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='fr'">
            <xsl:text> décembre </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='de'">
            <xsl:text> Dezember </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ru'">
            <xsl:text> Декабрь </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ja'">
            <xsl:text> 12 月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='zh'">
            <xsl:text> 12月 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='ko'">
            <xsl:text> 12월 </xsl:text>
         </xsl:when>
         <xsl:when test="$lang='pt'">
            <xsl:text>Dezembro </xsl:text>
         </xsl:when>
      </xsl:choose>
   </xsl:template>   
   
   <xsl:template name="uppercaser">      
		<xsl:param name="string"></xsl:param>      
		<xsl:value-of select="translate(normalize-space($string), $smallcase,  $uppercase)"></xsl:value-of>
	</xsl:template> 
	
	<xsl:template name="format_period">
      <xsl:param name="string"></xsl:param>
      <xsl:param name="len" select="string-length($string)"></xsl:param>
      <xsl:choose>
         <xsl:when test="substring($string,$len)='.'"></xsl:when>
         <xsl:otherwise>
            <xsl:text>.  </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>  
    
   <!-- Prints text in an HTML <p> block if not empty. -->
   <xsl:template name="output-para">
     <xsl:param name="text"></xsl:param>

     <xsl:if test="string-length(normalize-space($text)) > 0">
        <p><xsl:value-of select="$text"/></p>
     </xsl:if>
   </xsl:template>

	<xsl:template name="addCommaAsNeeded">
      <xsl:param name="string"/>
      <xsl:param name="len" select="string-length($string)"></xsl:param>
      <xsl:choose>
         <xsl:when test="substring($string,$len)=','">
            <xsl:text> </xsl:text>
         </xsl:when>
         <xsl:otherwise>                     
            <xsl:text>, </xsl:text><!-- add comma -->
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template> 
     
	<xsl:template name="rtrim">
      <xsl:param name="string"></xsl:param>
      <xsl:param name="len" select="string-length($string)"></xsl:param>
      <xsl:param name="cut" select="number($len)-1"></xsl:param>
      <xsl:value-of select="substring($string,1,$cut)"></xsl:value-of>      
   </xsl:template>

	<xsl:template name="rTrimSpaces">
      <xsl:param name="string" select="''"/>
      
      <xsl:param name="len" select="string-length($string)" />
      <xsl:param name="cut" select="number($len)-1" />
      
      <xsl:choose>
      	<xsl:when test="substring(string,$cut,1)=' '">
      		<xsl:variable name="tmp" select="substring($string,1,$cut)" />
      		<xsl:call-template name="rTrimSpaces">
      			<xsl:with-param name="string" select="$tmp"/>
      		</xsl:call-template>
      	</xsl:when>
      	<xsl:otherwise>
      		<xsl:value-of select="$string"/>
      	</xsl:otherwise>
      </xsl:choose>       
   </xsl:template>
   
	<xsl:template name="format_full_name">     
      <xsl:param name="fName" select="normalize-space(.//first-name)"></xsl:param>
      <xsl:param name="lName" select="normalize-space(.//last-name)"></xsl:param>
      <xsl:param name="mName" select="normalize-space(.//middle-name)"></xsl:param>
      <xsl:param name="nName" select="normalize-space(./name)"></xsl:param>
      <xsl:param name="fLen" select="string-length($fName)"></xsl:param>
      <xsl:param name="lLen" select="string-length($lName)"></xsl:param>
      <xsl:param name="mLen" select="string-length($mName)"></xsl:param>
      <xsl:param name="nLen" select="string-length($nName)"></xsl:param>
      <xsl:choose>
        <!-- name text() -->
         <xsl:when test="./name">
            <xsl:choose>
               <xsl:when test="substring($nName,$nLen)='.'">
                  <xsl:value-of select="$nName"></xsl:value-of>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$nName"></xsl:value-of>
                  <xsl:text>. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
        <!-- name subelements used -->
         <xsl:otherwise>
            <xsl:call-template name="uppercaser">
               <xsl:with-param name="string" select="$lName"></xsl:with-param>
            </xsl:call-template>
            <xsl:choose>
                <!-- place a comma after author's last name, unless one is present; 
                     format last name in UPPERCASE  -->  
               <xsl:when test="substring($lName,$lLen)=','"> 
                  <xsl:text> </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>, </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <!-- if first-name ends in period -->
               <xsl:when test="substring($fName,$fLen)='.'">
                    <!-- if there is a middle name, display that before any period -->
                  <xsl:choose>
                     <xsl:when test="./middle-name">
                        <xsl:choose>
                                <!-- if middle name ends in a period -->
                           <xsl:when test="substring($mName,$mLen)='.'">
                                    <!-- add fName -->
                              <xsl:call-template name="rtrim">
                                 <xsl:with-param name="string" select="$fName"></xsl:with-param>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                           </xsl:when>
                                <!-- middle name does NOT end in period; remove period from fName, inert mName -->
                           <xsl:otherwise>
                              <xsl:call-template name="rtrim">
                                 <xsl:with-param name="string" select="$fName"></xsl:with-param>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:when>
                        <!-- no middle name -->
                     <xsl:otherwise>
                        <xsl:choose>
                           <xsl:when test="./role">
                              <xsl:choose>
                                 <xsl:when test="substring($fName,$fLen)='.'">
                                    <xsl:call-template name="rtrim">
                                       <xsl:with-param name="string" select="$fName"></xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:text> (</xsl:text> 
                                    <xsl:value-of select="./role"></xsl:value-of>
                                    <xsl:text>). </xsl:text>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:value-of select="$fName"></xsl:value-of>
                                    <xsl:text> (</xsl:text> 
                                    <xsl:value-of select="./role"></xsl:value-of>
                                    <xsl:text>). </xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text> </xsl:text> 
                              <xsl:value-of select="$fName"></xsl:value-of>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text>  </xsl:text>
               </xsl:when>
                <!-- no period ending first name -->
               <xsl:otherwise>
                  <xsl:value-of select="$fName"></xsl:value-of>
                        <!-- if there is a middle name, display that before any period -->
                  <xsl:if test="./middle-name">
                     <xsl:choose>
                        <xsl:when test="substring($mName,$mLen)='.'">
                           <xsl:text> </xsl:text> 
                           <xsl:call-template name="rtrim">
                              <xsl:with-param name="string" select="$mName"></xsl:with-param>
                           </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text> </xsl:text> 
                           <xsl:value-of select="$mName"></xsl:value-of>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:if>
                  <xsl:if test="./role">
                     <xsl:choose>
                        <xsl:when test="substring($fName,$fLen)='.'">
                           <xsl:call-template name="rtrim">
                              <xsl:with-param name="string" select="$fName"></xsl:with-param>
                           </xsl:call-template>
                           <xsl:text> (</xsl:text> 
                           <xsl:value-of select="normalize-space(./role)"></xsl:value-of>
                           <xsl:text>). </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text> (</xsl:text> 
                           <xsl:value-of select="normalize-space(./role)"></xsl:value-of>
                           <xsl:text>). </xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            
            <xsl:if test="(./suffix) and not(''=normalize-space(./suffix))">
            	<xsl:if test="not (substring($lName,$lLen)=',')"> 
            		<xsl:value-of select="','" />
            	</xsl:if>
				<xsl:value-of select="normalize-space(./suffix)" />
				<xsl:text>. </xsl:text>
			</xsl:if>
         </xsl:otherwise><!-- name/sub-elements -->
      </xsl:choose>
	</xsl:template>

	<xsl:template name="stringReplace">
		<xsl:param name="output" />
		<xsl:param name="from" />
		<xsl:param name="to" />
		<xsl:choose>
			<xsl:when test="contains($output,$from)">
				<xsl:value-of select="concat(substring-before($output,$from),$to)" />
				<xsl:call-template name="stringReplace">
					<xsl:with-param name="output" select="substring-after($output,$from)" />
					<xsl:with-param name="from" select="$from" />
					<xsl:with-param name="to" select="$to" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$output" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   
<!-- 	<xsl:template match="xs:complexType">
        <xsl:param name="prefix" />
        <xsl:variable name="prefix-no-core">
                <xsl:choose>
                        <xsl:when test="not($prefix)">AcRec</xsl:when>
                        <xsl:when test="$prefix = 'core'"/>
                        <xsl:when test="$prefix = 'AcRec'">AcRec</xsl:when>                       
                </xsl:choose>
        </xsl:variable>

        <xs:complexType name="{concat($prefix-no-core, @name)}"/>
    </xsl:template> -->
    
    <!-- Make text smallcaps. Ok in browser but not seen JTextPane -->
    <xsl:template name="smallCaps">
		<xsl:param name="inString" />
		<xsl:variable name="upperAll" select="translate($inString, $smallcase, $uppercase)" />
		<xsl:variable name="firstLetter" select="substring($upperAll, 1, 1)" />
		<xsl:variable name="otherLetters" select="substring($upperAll, 2)" />
		
		<xsl:value-of select="$firstLetter" />
		<span class="smallCapLower"><xsl:value-of select="$otherLetters" /></span>
	</xsl:template>

	<xsl:template name="escape-apos">
		<xsl:param name="string" />
		<xsl:variable name="apos" select='"&apos;"' />
		<xsl:choose>
			<xsl:when test='contains($string, $apos)'>
				<xsl:value-of select="substring-before($string,$apos)" />
				<xsl:text>\'</xsl:text>
				<xsl:call-template name="escape-apos">
					<xsl:with-param name="string"
						select="substring-after($string, $apos)" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

  	<xsl:template name="LookupLanguageText">
		<xsl:param name="language_name"/>
		<xsl:choose>
			<xsl:when test="$language_table/label[@name =$language_name]">
				<xsl:apply-templates select="$language_table/label[@name =$language_name]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$language_name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="LookupCountryText">
		<xsl:param name="country"/>
		<xsl:param name="countryLang" select="$lang"/>
		
		<xsl:variable name="countryTable" select="document($country_table_file)//LT:template-translations[@LT:lang = $countryLang]" />		
		<xsl:choose>
			<xsl:when test="$countryTable/label[@name = $country]">
				<xsl:apply-templates select="$countryTable/label[@name = $country]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$country"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="FormatIANumber">
		<xsl:param name="document_id"/>
		<xsl:choose>
			<xsl:when test="substring($document_id/doc-number, 1, 3)!='PCT'">
				<xsl:text>PCT/</xsl:text>
				<xsl:if test="not(contains($document_id/doc-number, $document_id/country))">
					<xsl:value-of select="$document_id/country"/>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="contains($document_id/doc-number, '/')">
						<xsl:value-of select="$document_id/doc-number"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(substring($document_id/doc-number, 1, string-length($document_id/doc-number) - 6), '/', substring($document_id/doc-number, string-length($document_id/doc-number) - 5))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$document_id/doc-number"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Reusable General Box which contains: 
		- Item number 												(optional)
		- Checkbox [either checked or unchecked] 					(required)
		- Title for the checkbox 									(required)
		- Template to apply if true (appending to the Title)		(optional)
		- More info [either xpath (with '/') or simple text]		(optional)
		
		Note: It represents one table row <tr> with three columns <td>, with assumption <table> pre-defined .
	 -->
	<xsl:template name="BoxGeneral">
		<xsl:param name="itemNo" select="''"/>
		<xsl:param name="isChecked" select="false"/>
		<xsl:param name="itemTitle" select="''"/>
		<xsl:param name="itemTitleEndingColon" select="false"/>
		<xsl:param name="itemTitlePendingTextIfSelected" select="''"/>
		<xsl:param name="moreInfo" select="''"/>
		
		<tr valign="top">
			<!-- Item number (optional) -->
			<td><xsl:value-of select="$itemNo"/></td>
			
			<!-- Checkbox [either checked or unchecked]  (required) -->
			<td>
				<xsl:call-template name="BoxToCheck">
					<xsl:with-param name="check_condition" select="boolean($isChecked)" />
				</xsl:call-template>
			</td>
			
			<td >
				<!-- Title for the checkbox  (required) -->
				<div>
					<span>
						<xsl:apply-templates select="exsl:node-set($itemTitle)/node()"/>
						
						<xsl:if test="boolean($itemTitleEndingColon)">
							<xsl:value-of select="': '"/>
						</xsl:if>			
					</span>
				
					<!--  Template to apply if true (appending to the Title)		(optional) -->	
					<xsl:if test="boolean($isChecked) and string-length($itemTitlePendingTextIfSelected) &gt; 0">
						<span>
							<xsl:choose>
								<xsl:when test="contains($itemTitlePendingTextIfSelected, '/')">								
									<b><xsl:apply-templates select="$itemTitlePendingTextIfSelected" /></b>
								</xsl:when>
								<xsl:otherwise>
									<b><xsl:value-of select="$itemTitlePendingTextIfSelected"/></b>
								</xsl:otherwise>
							</xsl:choose>	
						</span>
					</xsl:if>
					
				</div>
				
				<!-- More info [either xpath (with '/') or simple text]		(optional) -->
				<xsl:if test="string-length($moreInfo) &gt; 0">
					<span>
						<xsl:choose>
							<xsl:when test="contains($moreInfo, '/')">
								<xsl:apply-templates select="$moreInfo"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$moreInfo"/>
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</xsl:if>
			</td>
		</tr>	
	</xsl:template>
	
	<!-- (FOR ARABIC - RIGHT ALIGNMENT)  -->
	<xsl:template name="BoxGeneral_AR">
		<xsl:param name="itemNo" select="''"/>
		<xsl:param name="isChecked" select="false"/>
		<xsl:param name="itemTitle" select="''"/>
		<xsl:param name="itemTitleEndingColon" select="false"/>
		<xsl:param name="itemTitlePendingTextIfSelected" select="''"/>
		<xsl:param name="moreInfo" select="''"/>
		
		<tr valign="top">
			<td align="right">
				<!-- Title for the checkbox  (required) -->
				<div>
					<span>
<!-- 						<xsl:choose>
							<xsl:when test="contains($itemTitle, '/') and contains($itemTitle, '$')">
								<xsl:apply-templates select="$itemTitle"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$itemTitle"/>
							</xsl:otherwise>
						</xsl:choose>	
						
	PROBLEM: <b> cannot be appplied	==> use exsl:node-set below
 -->
					
					<xsl:apply-templates select="exsl:node-set($itemTitle)/node()"/>
						
						<xsl:if test="boolean($itemTitleEndingColon)">
							<xsl:value-of select="': '"/>
						</xsl:if>			
					</span>
				
					<!--  Template to apply if true (appending to the Title)		(optional) -->	
					<xsl:if test="boolean($isChecked) and string-length($itemTitlePendingTextIfSelected) &gt; 0">
						<span>
							<xsl:choose>
								<xsl:when test="contains($itemTitlePendingTextIfSelected, '/')">
									<b><xsl:apply-templates select="$itemTitlePendingTextIfSelected" /></b>
								</xsl:when>
								<xsl:otherwise>
									<b><xsl:value-of select="$itemTitlePendingTextIfSelected"/></b>
								</xsl:otherwise>
							</xsl:choose>	
						</span>
					</xsl:if>
					
				</div>
				
				<!-- More info [either xpath (with '/') or simple text]		(optional) -->
				<xsl:if test="string-length($moreInfo) &gt; 0">
					<span>
						<xsl:choose>
							<xsl:when test="contains($moreInfo, '/')">
								<xsl:apply-templates select="$moreInfo"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$moreInfo"/>
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</xsl:if>
			</td>		
			
			<!-- Checkbox [either checked or unchecked]  (required) -->
			<td>
				<xsl:call-template name="BoxToCheck">
					<xsl:with-param name="check_condition" select="boolean($isChecked)" />
				</xsl:call-template>
			</td>
			
			<!-- Item number (optional) -->
			<td><xsl:value-of select="$itemNo"/></td>
			
		</tr>	
	</xsl:template>
	
	<xsl:template name="BoxToCheck">
		<xsl:param name="check_condition" select="false()" />
		<xsl:choose>
			<xsl:when test="$check_condition=true()">
				<xsl:call-template name="CheckBox_Checked"/>
			</xsl:when>
			<xsl:otherwise>				
				<xsl:call-template name="CheckBox_Unchecked"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="CheckBox_Checked">
		<xsl:call-template name="CheckMark">
			<xsl:with-param name="markType">
				<xsl:choose>
					<xsl:when test="not($media = 'web')">
						<xsl:value-of select="'BALLOT_BOX_WITH_CHECK'"/>
					</xsl:when>
					<xsl:otherwise>						
						<xsl:value-of select="'CHECKED_BOX_CHECKED'"/>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
		
	<xsl:template name="CheckBox_Unchecked">
		<xsl:call-template name="CheckMark">
			<xsl:with-param name="markType">
				<xsl:choose>
					<xsl:when test="not($media = 'web')">						
						<xsl:value-of select="'BALLOT_BOX'"/>
					</xsl:when>
					<xsl:otherwise>						
						<xsl:value-of select="'CHECKED_BOX_UNCHECKED'"/>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="CheckMark">
		<xsl:param name="markType" select="'CHECKED_BOX_CHECKED'"/>	
		<xsl:param name="fontSize" select="'16'"/>
		
		<xsl:choose>
			<xsl:when test="$markType='CHECKED_BOX_CHECKED'">				
				<input type="checkbox" checked="checked" onclick="return false" style="vertical-align: bottom;"/>
			</xsl:when>
			<xsl:when test="$markType='CHECKED_BOX_UNCHECKED'">				
				<input type="checkbox" onclick="return false" style="vertical-align:bottom;" />
			</xsl:when>			
			<xsl:when test="$markType='BALLOT_BOX_WITH_CHECK'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#9745;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$markType='BALLOT_BOX_WITH_X'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#9746;</xsl:text>
				</span>
			</xsl:when>	
			<xsl:when test="$markType='BALLOT_BOX'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#9744;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$markType='SALTIRE'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#9747;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$markType='WHITE_HEAVY_CHECK_MARK'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#9989;</xsl:text>
				</span>
			</xsl:when>	
			<xsl:when test="$markType='CHECK_MARK'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10003;</xsl:text>
				</span>
			</xsl:when>		
			<xsl:when test="$markType='HEAVY_CHECK_MARK'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10004;</xsl:text>
				</span>
			</xsl:when>			
			<xsl:when test="$markType='MULTIPLICATION_X'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10005;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$markType='HEAVY_MULTIPLICATION_X'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10006;</xsl:text>
				</span>
			</xsl:when>	
			<xsl:when test="$markType='BALLOT_X'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10007;</xsl:text>
				</span>
			</xsl:when>	
			<xsl:when test="$markType='HEAVY_BALLOT_X'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10008;</xsl:text>
				</span>
			</xsl:when>	
			<xsl:when test="$markType='CROSS_MARK'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10060;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$markType='NEGATIVE_SQUARED_CROSS_MARK'">
				<span style="font-size:{$fontSize}">
					<xsl:text disable-output-escaping="yes">&#10062;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$markType='Dash'">	
				<xsl:value-of select="'- '" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'- '" />
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="' '" />
	</xsl:template>
	
	<!-- RESEARCH
	  Checmical formular
	  Math formular	 
	 -->
	 <!-- 
	<xsl:template match="chemical">
	   <xsl:variable name="this_chemical" select="."/>
	   <xsl:call-template name="chemical_formater">
	     <xsl:with-param name="formula" select="."/>
	   </xsl:call-template>
	</xsl:template>
	
	<xsl:template name="chemical_formater">
	   <xsl:param name="formula"/>
	   <xsl:variable name="each_char" select="substring($formula,1,1)"/>
	   <xsl:choose>
	     <xsl:when test="$each_char='1' or $each_char='2' or $each_char='3' or
	$each_char='4' or $each_char='5' or $each_char='6' or $each_char='7' or
	$each_char='8' or $each_char='9' or $each_char='0'">
			<fo:inline baseline-shift="sub" font-size="75%">
			   <xsl:value-of select="$each_char"/>
			</fo:inline>
	     </xsl:when>
	     <xsl:otherwise>
			<fo:inline baseline-shift="normal">
			   <xsl:value-of select="$each_char"/>
			</fo:inline>
	     </xsl:otherwise>
	   </xsl:choose>
	   <xsl:if test="substring-after($formula,$each_char)!=''">
		   <xsl:call-template name="chemical_formater">
			 <xsl:with-param name="formula">
			   <xsl:value-of
	select="substring-after($formula,$each_char)"/>
			 </xsl:with-param>
		   </xsl:call-template>
	   </xsl:if>
	</xsl:template>	
	 -->
</xsl:stylesheet>