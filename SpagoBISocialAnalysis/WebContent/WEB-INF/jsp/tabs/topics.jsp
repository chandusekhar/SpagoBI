

<%-- SpagoBI, the Open Source Business Intelligence suite

 Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0, without the "Incompatible With Secondary Licenses" notice.  If a copy of the MPL was not distributed with this file,
 You can obtain one at http://mozilla.org/MPL/2.0/. --%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         session="true"
%>

<%-- ---------------------------------------------------------------------- --%>
<%-- JAVA IMPORTS															--%>
<%-- ---------------------------------------------------------------------- --%>

<%@ page import="it.eng.spagobi.twitter.analysis.dataprocessors.*" %>
<%@ page import="it.eng.spagobi.twitter.analysis.pojos.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>



<%-- ---------------------------------------------------------------------- --%>
<%-- JAVA CODE 																--%>
<%-- ---------------------------------------------------------------------- --%>

<%
	String searchId = request.getParameter("searchID");
	boolean withDocs = "TRUE".equalsIgnoreCase(request.getParameter("withDocs"));
	
	String summaryLink = "summary?searchID=" + searchId + "&withDocs=" + withDocs;
	String topicsLink = "topics?searchID=" + searchId + "&withDocs=" + withDocs; 
	String networkLink = "network?searchID=" + searchId + "&withDocs=" + withDocs; 
	String distributionLink = "distribution?searchID=" + searchId + "&withDocs=" + withDocs; 
	String sentimentLink = "sentiment?searchID=" + searchId + "&withDocs=" + withDocs; 
	String impactLink = "impact?searchID=" + searchId + "&withDocs=" + withDocs; 
	String roiLink = "";
	
	if(withDocs)
	{			
		roiLink = "roi?searchID=" + searchId + "&withDocs=" + withDocs;
	}
	
	TwitterTagCloudDataProcessor tCloudDP = new TwitterTagCloudDataProcessor();
	tCloudDP.initializeTagClouds(searchId);
	
	String hTagCloud = tCloudDP.getHashtagsCloud().toString();
	String topicsCloud = tCloudDP.getTopicsCloud().toString();
	 
%>

<%-- ---------------------------------------------------------------------- --%>
<%-- HTML	 																--%>
<%-- ---------------------------------------------------------------------- --%>



    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<%@include file="../commons/includeSbiSocialAnalysisResources.jspf"%>

	 
	
	<title>Twitter Analysis</title>
	
</head>
<body>

<div id="navigation">

	<div id="report-loading" class="loading"><img src="<%= application.getContextPath() %>/img/ajax-loader.gif" width="32" height="32" /><br /><strong>Loading</strong></div>

	<ul class="navtabs tabsStyle">
	    <li class="navtabs"><a href=<%= summaryLink %>> Summary</a></li>
	    <li class="navtabs" id="activelink"><a href=<%= topicsLink %>>Topics</a></li>
	    <li class="navtabs"><a href=<%= networkLink %>>Network</a></li>
	    <li class="navtabs"><a href=<%= distributionLink %>>Distribution</a></li>
  	    <li class="navtabs"><a href=<%= sentimentLink %>>Sentiment</a></li>
	    <li class="navtabs"><a href=<%= impactLink %>>Impact</a></li>
	    <% if(withDocs) { %>
	    	<li class="navtabs"><a href=<%= roiLink %>>ROI</a></li>
	    <% } %>
	    <li class="navtabs" style="float:right;"><a href="<%= application.getContextPath() %>/index.jsp">Search</a></li>
	</ul>
        	

	<div id="tagcloud" class="blank_box tagCloudMain_box">
			
		<div class="tagCloudTitle_box">
			
			<span>Hashtags Cloud</span>
		
		</div>
			
		<br/>
			
		<div id="hashtagsCloud" class="tagCloud_box"></div>
		
		
	</div>
	
	<div id="tagcloud" class="blank_box tagCloudMain_box" style="margin-left: 20px;">
			
		<div class="tagCloudTitle_box">
			
			<span>Topics Cloud</span>
		
		</div>
			
		<br/>
			
		<div id="topicsCloud" class="tagCloud_box"></div>
		
		
	</div>
	
	</div>
		
</div>        	
			
	<script type="text/javascript">
					var word_list_hashtags = <%= hTagCloud %>
					$(function() {
	 						$("#hashtagsCloud").jQCloud(word_list_hashtags);
					});
	</script>
	
	<script type="text/javascript">
					var word_list_topics = <%= topicsCloud %>
					$(function() {
	 						$("#topicsCloud").jQCloud(word_list_topics);
					});
	</script>
			
			
	<script type="text/javascript">
			  $(document).ready(function(){
			
			    $(".navtabs").click(function(){
			    	
			    	var width = $("#navigation").width();
			        var height = $("#navigation").height()
			    	
			    	$("#report-loading").css({
				        top: (100),
				        left: ((width / 2) - 50),
				        display: "block"
				    })			
			    });
			
			  });
		</script>
		
</body>
</html>