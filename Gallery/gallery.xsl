<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/"> 
<html>
<head>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<style type="text/css">
/* remove firefox link outline */
a { outline: none; }
:-moz-any-link:focus { outline: none; }

body {
	margin: 0;
	padding: 0;
}

#thumbs img {
margin: 5px;
padding: 2px;
border: 1px black solid;
}
#thumbs_contain {
	bottom: 0;
	position: absolute;
	width: 100%;
}

.thumbs_narrow {
overflow-x:scroll; 
width: 100%;
height: 150px; 
white-space:nowrap;
}

#toggler {
width: 100%; 
display:block; 
background: grey;}

a {text-decoration: none;}

#photo {float:left;}

#photo_meta {float: clear;}

#photo_space {
	display: none;
}
</style>
  <script type="text/javascript">
  var displayState = "grid";
function makeNarrow() {
	if (displayState == "grid") {
		$("#thumbs").addClass("thumbs_narrow");
		$("#photo_space").hide();	
		displayState = "narrow";
	}
}
  
function makeGrid() {
	if (displayState == "narrow") {
		$("#thumbs").removeClass("thumbs_narrow");
		$("#photo_space").hide();
		displayState = "grid";
	}
}

function showFull(src, desc) {
		//TODO
		makeNarrow();
		$("#caption").text(desc);
		$("#fullImage").attr('src', src);
		$("#photo_space").show();

		
}
</script>
</head>
  <body>
  <div id="photo_space">
  	<div id="photo">
  	<img src="large-images/IMG_1464.JPG"  id="fullImage"/>
  	<div id="caption">caption</div>
  	</div>
	<div id="photo_meta">
	some text
	</div>
  </div>
  <div id="thumbs_contain">
  <a href="#" id="toggler" onClick="makeGrid();"><span>&#160;</span></a>
  <div id="thumbs">
	
      <xsl:for-each select="gallery/images/image">
	
      <a href="#" onClick="showFull('large-images/{path}', '{description}');"><img height="100" width="113" src="thumbs/{path}" alt="{description}" title="{description}"/></a>
	
      </xsl:for-each>
	
	</div>
	</div>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>