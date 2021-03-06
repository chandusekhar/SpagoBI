<%-- SpagoBI, the Open Source Business Intelligence suite

Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. --%>
 
  

<%@ include file="/WEB-INF/jsp/commons/portlet_base311.jsp"%>
<%@ page import="it.eng.spagobi.commons.bo.Domain,
				 java.util.ArrayList,
				 java.util.List,
				 org.json.JSONArray" %>
<%

	List nodeTypesCd = (List) aSessionContainer.getAttribute("thrTypesList");
    List thrSeverityTypesCd = (List) aSessionContainer.getAttribute("thrSeverityTypes");

%>

<script type="text/javascript" src='<%=urlBuilder.getResourceLink(request, "/js/src/ext/sbi/service/ServiceRegistry.js")%>'></script>

<script type="text/javascript">

	<%	
	JSONArray severityTypesArray = new JSONArray();
	if(thrSeverityTypesCd != null){
		for(int i=0; i< thrSeverityTypesCd.size(); i++){
			Domain domain = (Domain)thrSeverityTypesCd.get(i);
			JSONArray temp = new JSONArray();
			temp.put(domain.getValueCd());
			severityTypesArray.put(temp);
		}
	}	
	String severityTypes = severityTypesArray.toString();
	severityTypes = severityTypes.replaceAll("\"","'");	
	
	JSONArray nodeTypesArray = new JSONArray();
	if(nodeTypesCd != null){
		for(int i=0; i< nodeTypesCd.size(); i++){
			Domain domain = (Domain)nodeTypesCd.get(i);
			JSONArray temp = new JSONArray();
			temp.put(domain.getValueCd());
			nodeTypesArray.put(temp);
		}
	}	
	String nodeTypes = nodeTypesArray.toString();
	nodeTypes = nodeTypes.replaceAll("\"","'");
    %>

    var config = {};

	config.nodeTypesCd = <%= nodeTypes%>;
	config.thrSeverityTypesCd = <%= severityTypes%>;
	
	var url = {
    	host: '<%= request.getServerName()%>'
    	, port: '<%= request.getServerPort()%>'
    	, contextPath: '<%= request.getContextPath().startsWith("/")||request.getContextPath().startsWith("\\")?
    	   				  request.getContextPath().substring(1):
    	   				  request.getContextPath()%>'
    	    
    };

    Sbi.config.serviceRegistry = new Sbi.service.ServiceRegistry({
    	baseUrl: url
    });

Ext.onReady(function(){
	Ext.QuickTips.init();
	var manageThresholds = new Sbi.kpi.ManageThresholds(config);
   var viewport = new Ext.Viewport({
		layout: 'border'
		, items: [
		    {
		       region: 'center',
		       layout: 'fit',
		       items: [manageThresholds]
		    }
		]

	});
   	
});


</script>


<%@ include file="/WEB-INF/jsp/commons/footer.jsp"%>