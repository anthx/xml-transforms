<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="data/title" /> - Transformed!</title>
        <style type="text/css">
         table {
		border: solid 1px black; 
		border-collapse: collapse;}
	 td, th {
		padding-left: 5px;
		padding-right: 5px;
		border: solid 1px black;}
	 th {
		background-color: lightgrey;}
	 tr.even {background-color: lightgrey;}
	 img {display:block;}
	</style>
	<script type="text/javascript">
	var div_list=new Array();
	var numOfDivs = <xsl:value-of select="count(data/category)" />;
	
	<xsl:for-each select="data/category">div_list[<xsl:value-of select="position()-1"/>]="<xsl:value-of select="title/@div_name" />";
	</xsl:for-each>
	function toggle(obj) {
		var el = document.getElementById(obj);
		for (i=0; i &lt; numOfDivs; i++) { //go through the list of divs...
			if (div_list[i] != obj){ //checking each one is not the one we want to show only
				document.getElementById(div_list[i]).style.display = 'none'; //therefore, hide all others
			}
		}
		el.style.display = 'block';
	}
	function reset() {
		for (i=0; i &lt; numOfDivs; i++) { //go through the list of divs...
			document.getElementById(div_list[i]).style.display = 'block'; //therefore, show all
			}
	}
	</script>
      </head>
      <body>
        <h2 style="float:left;">
          <xsl:value-of select="data/title" />
        </h2>
	<div style="float:right; margin-right:5%; padding:2pt; margin-top:2em; border:1pt black solid;">
		<div style="text-align:center">Table of Contents</div>
		<xsl:for-each select="data/category">
			<p><xsl:value-of select="title" />&#160;
			<a href="#{title/@div_name}">Jump</a>&#160;
			<a href="#" onclick="javascript:toggle('{title/@div_name}')">Toggle Only This</a>
			</p>
		</xsl:for-each>
		<p><a href="#" onclick="javascript:reset()">Reset All</a></p>
	</div>
        <xsl:for-each select="data/category">
          <div id="{title/@div_name}" style="clear:left;">
            <h3>
              <xsl:value-of select="title" />
            </h3>
            <table border="1">
              <tr>
                <th align="left">Item</th>
                <th align="left">Name</th>
                <th align="left">Description</th>
                <th align="left">Cost</th>
                <th align="left">Rating</th>
                <th align="left">Link</th>
              </tr>
              <xsl:for-each select="item">
                <tr>
                  <xsl:choose>
                    <xsl:when test="position() mod 2 = 0">
                      <xsl:attribute name="class">
                        <xsl:value-of select="'even'" />
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                  </xsl:choose>
                  <td>
                    <xsl:value-of select="id" />
                  </td>
                  <td>
                    <xsl:value-of select="name" /></td>
                  <td>
                    <xsl:value-of select="desc" />
                  </td>
                  <td>
                $<xsl:value-of select="cost" /></td>
                  <td>
                    <img src="{rating}.gif" />
                  </td>
                  <td>
                    <a href="{link}">
                      <xsl:value-of select="manufacturer" />
                    </a>
                  </td>
                </tr>
              </xsl:for-each>
              <tr>
                <td colspan="3" align="right">Total Cost:</td>
                <td>$<xsl:value-of select="round(sum(item/cost))" /></td>
                <td>Overall Rating:  <xsl:variable name="sum_rating" select="sum(item/rating)" /><xsl:variable name="count_rating" select="count(item/cost)" /><xsl:value-of select="round($sum_rating div $count_rating)" /></td>
                <td> </td>
              </tr>
            </table>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>