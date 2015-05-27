<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" indent="yes" />
  <xsl:template match="/">

<html>
  <head>
    <title>Crosswalk APK Analysed Result</title>
    <meta charset='utf-8'/>
    <meta http-equiv='X-UA-Compatible' content='IE=10' />
    <meta name='author' content='Belem, belem.zhang@intel.com' />
    <meta content='width=device-width, initial-scale=1.0, minimum-scale=0.2, maximum-scale=3.0, user-scalable=yes' name='viewport' />
    <style>
      html { margin: 0px 20px; }
      body { color: #515151; font: 80%/1.5 Verdana,sans-serif; min-width: 960px; margin: 0px auto; text-shadow: 0px 1px 0px rgba(0,0,0,0.1); }
      header { font-family: 'Lucida Bright', Verdana, cursive; font-size: 30px; margin: 14px 0px 14px 0px; padding-bottom: 10px; border-bottom: 4px rgba(22, 160, 133,1.0) solid;}
      footer  { border: 0px solid #eee; padding: 10px 0px; margin-botton: 10px; text-align: right; }
      table { width: 100%; text-align: center; border-collapse:collapse; font-size: 12px; }
      th, td { border-bottom: 1px solid #eee; padding: 3px 0px; overflow: hidden;}
      tr:hover { background-color: #fafafa; cursor: pointer;} 
      td.details { background-color: rgba(32, 50, 68,1.0); color: rgba(255, 255, 255, 0.6);}
      td.details:hover { background-color: rgba(20, 38, 56,1.0);  }
      td.details { text-align: left; margin: 20px 0px; padding: 0px 16px; }
      .asset { text-align: left; margin: 10px 0px 20px 0px; }
      span.cap1, .xwalk span, .chromium span, .cordova span, .smali span { display:inline-block; margin: 2px 4px; border: 1px dotted rgba(255, 255, 255, 0.6); padding: 1px 6px; border-radius: 0px; rgba(255, 255, 255, 0.9); }
      span.cap1, .xwalk span:hover, .chromium span:hover, .cordova span:hover, .smali span:hover { border: 1px solid rgba(255, 255, 255, 1.0); background-color: rgba(142, 68, 173,1.0); color: rgba(255, 255, 255, 1.0);  }
      span.cap2, .asset span { display:inline-block; margin: 2px 4px; border: 1px dotted rgba(255, 255, 255, 0.6); padding: 1px 6px; border-radius: 10px; rgba(255, 255, 255, 0.9); }
      span.cap2, .asset span:hover { border: 1px solid rgba(255, 255, 255, 1.0); background-color: rgba(211, 84, 0,1.0); color: rgba(255, 255, 255, 1.0); }
      .det { margin: 0px 10px 0px 0px; font-weight: bold; text-shadow: 0px 1px 1px rgba(0,0,0,0.1); font-size: 14px; color: rgba(255, 255, 255, 1.0); }
      .apd { text-align: center;  margin: 10px 0px; }
      .details { padding: 10px; font-size:11px; }
      .fill {background-color: #46C8C8; color: rgba(255, 255, 255, 1.0); }
      .lim { min-width: 100px; max-width: 180px; overflow: hidden; }
      .limname { max-width: 120px; overflow: hidden;  }
      .limsize { min-width: 42px; max-width: 80px; overflow: hidden;  }
      .limw { min-width: 60px; max-width: 96px; overflow: hidden; width: 106px;  }
      .emb { background-color:#00B1E1; color: rgba(255, 255, 255, 1.0); text-shadow: 0px 1px 0px rgba(0,0,0,0.2);}
      .sha { background-color:#EB7E7F; color: rgba(255, 255, 255, 1.0); }
      .arm { background-color:#EC795E; color: rgba(255, 255, 255, 1.0);}
      .armx86 { background-color:#E082A5; color: rgba(255, 255, 255, 1.0);}
      .x86 { background-color:#FFBE65; color: rgba(0, 0, 0, 0.6); }
      .rt { background-color:#0ACDC7; color: rgba(255, 255, 255, 1.0); }
      .cdo { background-color:#A7D773; color: rgba(255, 255, 255, 1.0); }
      .ci { background-color:#FF885E; color: rgba(255, 255, 255, 1.0); }
      .xdk { background-color:#D18EE2; color: rgba(255, 255, 255, 1.0); }
      .cr { background-color:#61BD6D; color: rgba(255, 255, 255, 1.0); }
      .xwalkwebviewpg { background-color:#8E44AD; color: rgba(255, 255, 255, 1.0);  }
      #datetime { font-size: 10px; margin-top: 10px; }
      #toggle { text-align: right; color: rgba(22, 160, 133,1.0); cursor: hand; margin: -6px 0px 6px 0px;  }
      #toggle:hover { color: rgba(16, 154, 127,1.0); }
      #note, #dt { font-style: italic; margin-right: 6px; }
      .hili { color: rgba(211, 84, 0,1.0); }
    </style>
    <script src='../../resources/webrunner/jquery-1.10.2.min.js'></script>
  </head>
  <body>
    <div id='wrapper'>
      <header>Crosswalk APK Analysed Result</header>
      <div id='toggle'>expand all</div>
      <table class="reports">
        <tr>
          <th class="lim">APK</th>
          <th class="limname">Name</th>
          <th class="limsize">Size</th>
          <th class="limw">Crosswalk</th>
          <th class="limw">Mode</th>
          <th class="limw">Architecture</th>
          <th class="limw">Core Internal</th>
          <th class="limw">Cordova</th>
          <th class="limw">XWalk Webview Plugin</th>
          <th class="limw">Intel XDK</th>
          <th class="limw">U/WebView</th>
          <th class="limw">U/Chromium</th>
          <th>Note</th>
        </tr>

        <xsl:for-each select="apks/apk">
        <xsl:sort select="app/@file"/>
        <xsl:variable name="pkgid"><xsl:value-of select="@id"/></xsl:variable>
        <tr title="{$pkgid}">
          <xsl:for-each select="app">
          <td class="lim"><xsl:value-of select="@file"/></td>
          <td class="limname"><xsl:value-of select="@name"/></td>
          <td><xsl:value-of select="@size"/></td>
          </xsl:for-each>
          <xsl:for-each select="crosswalk">

          <xsl:choose>
            <xsl:when test="@iscrosswalk = 'yes'">
              <td class="fill limw"><xsl:value-of select="@iscrosswalk"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td><xsl:value-of select="@iscrosswalk"/></td>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:choose>
            <xsl:when test="@mode = 'embedded'">
             <td class="emb limw"><xsl:value-of select="@mode"/></td>
            </xsl:when>
            <xsl:when test="@mode = 'shared'">
             <td class="sha limw"><xsl:value-of select="@mode"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@mode"/></td>
            </xsl:otherwise>
          </xsl:choose>

           <xsl:choose>
             <xsl:when test="@architecture = 'arm + x86'">
             <td class="armx86 limw"><xsl:value-of select="@architecture"/></td>
            </xsl:when>
            <xsl:when test="@architecture = 'x86'">
             <td class="x86 limw"><xsl:value-of select="@architecture"/></td>
            </xsl:when>
            <xsl:when test="@architecture = 'arm'">
             <td class="arm limw"><xsl:value-of select="@architecture"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@architecture"/></td>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:choose>
            <xsl:when test="@coreinternal = 'yes'">
             <td class="ci limw"><xsl:value-of select="@coreinternal"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@coreinternal"/></td>
            </xsl:otherwise>
          </xsl:choose>

           <xsl:choose>
            <xsl:when test="@cordova = 'yes'">
             <td class="cdo limw"><xsl:value-of select="@cordova"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@cordova"/></td>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:choose>
            <xsl:when test="@xwalkwebvieweg != ''">
             <td class="xwalkwebviewpg limw"><xsl:value-of select="@xwalkwebvieweg"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@xwalkwebvieweg"/></td>
            </xsl:otherwise>
          </xsl:choose>

           <xsl:choose>
            <xsl:when test="@intelxdk = 'yes'">
             <td class="xdk limw"><xsl:value-of select="@intelxdk"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@intelxdk"/></td>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:choose>
            <xsl:when test="@webview = 'yes'">
             <td class="rt limw"><xsl:value-of select="@webview"/></td>
            </xsl:when>
            <xsl:when test="@webview = 'yes webkit'">
             <td class="rt limw"><xsl:value-of select="@webview"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@webview"/></td>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:choose>
            <xsl:when test="@chromium = 'yes'">
             <td class="cr limw"><xsl:value-of select="@chromium"/></td>
            </xsl:when>
            <xsl:otherwise>
              <td class="limw"><xsl:value-of select="@chromium"/></td>
            </xsl:otherwise>
          </xsl:choose>

          <td><xsl:value-of select="@note"/></td>
          </xsl:for-each>
        </tr>
        <tr>
          <td colspan='13' class='details'>
            <div class='apd'>
              Package: <span class="det"><xsl:value-of select="@id"/></span>
              <xsl:for-each select="app">
                Launchable Activity: <span class="det"><xsl:value-of select="@launchableactivity"/></span>
                Version Code: <span class="det"><xsl:value-of select="@versioncode"/></span>
                Version Name: <span class="det"><xsl:value-of select="@versionname"/></span>
                SDK Version: <span class="det"><xsl:value-of select="@sdkversion"/></span>
                Target SDK Version: <span class="det"><xsl:value-of select="@targetsdkversion"/></span>
              </xsl:for-each>
            </div>
            <xsl:if test="xwalk">
            <div class='xwalk'>
              <span class='cap1'>xwalk</span>
              <xsl:for-each select="xwalk">
                <span><xsl:value-of select="current()"/></span>
              </xsl:for-each>
            </div>
            </xsl:if>
            <xsl:if test="chromium">
            <div class='chromium'>
              <span class='cap1'>chromium</span>
              <xsl:for-each select="chromium">
                <span><xsl:value-of select="current()"/></span>
              </xsl:for-each>
            </div>
            </xsl:if>
            <xsl:if test="cordova">
            <div class='cordova'>
              <span class='cap1'>cordova</span>
              <xsl:for-each select="cordova">
                <span><xsl:value-of select="current()"/></span>
              </xsl:for-each>
            </div>
            </xsl:if>
            <xsl:if test="smali">
            <div class='smali'>
              <span class='cap1'>other namespaces</span>
              <xsl:for-each select="smali">
          	    <span><xsl:value-of select="current()"/></span>
              </xsl:for-each>
            </div>
            </xsl:if>
            <xsl:if test="asset">
            <div class='asset'>
              <span class='cap2'>assets</span>
              <xsl:for-each select="asset">
                  <span><xsl:value-of select="current()"/></span>
              </xsl:for-each>
            </div> 
            </xsl:if>
          </td>
        </tr>
      </xsl:for-each>

      </table>
      <div id="datetime">
      	<xsl:if test="apks/@note"><span id="note"><xsl:value-of select="apks/@note"/></span></xsl:if><span id="dt">Test Date: <xsl:value-of select="apks/@datetime"/></span></div>
      <footer>
        2015 OTC Web QA Team
      </footer>
    </div>
    <script type='text/javascript'>
        $(document).ready(function(){
          var element = this;
          $(element).find("tr:odd").addClass("odd");
          $(element).find("tr:not(.odd)").hide();
          $(element).find("tr:first-child").show();
          $(element).find("tr.odd").click(function(){
            $(this).next("tr").slideToggle();
          });
          $("#toggle").click(function(){
            $(element).find("tr:not(.odd)").toggle();
            if($("#toggle").html() == "expand all")
            	$("#toggle").text("collapse all");
            else
            	$("#toggle").text("expand all");
          });
        }); 
    </script>
  </body>
</html>

</xsl:template>
</xsl:stylesheet> 
