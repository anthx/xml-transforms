<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>My Computer - Transformed!</title>
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
      </head>
      <body>
        <h2>
          <xsl:value-of select="data/title" /> <a href="#" onclick="javascript:document.getElementById('hardware').style.display = 'none';">hide</a>
        </h2>
        <xsl:for-each select="data/category">
          <div id="{title/@div_name}">
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