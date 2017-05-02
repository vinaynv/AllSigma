<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<%
if(request.getScheme().equalsIgnoreCase("http")){
	response.sendRedirect("https://dashboard.aesenergystorage.com:8443/pentaho/Dashboard");
}
%>
<html>
<head>
<title>AES Dashboard</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="shortcut icon" href="/pentaho-style/favicon.ico" />
<link href="/pentaho/dashboard/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="/pentaho/dashboard/js/tab.js" type="text/javascript"></script>
<script src="/pentaho/dashboard/js/do_highlight.js" type="text/javascript"></script>
<script>


</script>
</head>
<body>
<div class="main-div">

<div  id="tab" class="tab-div" style="z-index:1000;">
   		<ul>
		        <li><a href="#" onclick = "javascript:getElementById('iframe_a').src='http://www.aesenergystorage.com';" class="logo"><img src="/pentaho/dashboard/images/aeses_logo.png" alt="" width="35" height="32" border="0"></a></li>
            	<li><a href="#" onclick="do_highlightP('Projects');" ><span><span>Fleet</span></span></a>
				<ul>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Fleet:Ada:AdaDashboard.xdash/viewer';"><span><span>Ada</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Fleet:AN:AngamosDashboard.xdash/viewer';"><span><span>Angamos</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Fleet:LM:LMDashboard.xdash/viewer';"><span><span>Laurel Mountain</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Fleet:LA:LosAndesDashboard.xdash/viewer';"><span><span>Los Andes</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Fleet:Tait:TaitDashboard.xdash/viewer';"><span><span>Tait</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Projects:KPIDashboard.xdash/viewer';"><span><span>KPI Report</span></span></a></li>
                                   

								

					</ul>
				</li>
                <li><a href="#" onclick="do_highlightM('Projects');" ><span><span>Markets</span></span></a>
				<ul>
					
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Markets:AncillaryPricesDashboard.xdash/viewer';"><span><span>Regulation</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Markets:EnergyChartsDashboard.xdash/viewer';"><span><span>Energy</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Markets:MarketPricesDashboard.xdash/viewer';"><span><span>Market Prices</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Markets:MarketPricesComparisonDashboard.xdash/viewer';"><span><span>Comparison</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Markets:ArbitrageReportDashboard.xdash/viewer';"><span><span>Arbitrage Report</span></span></a></li>
	

					</ul>
				</li>
                <li style="float:right"><a id="logout" href="/pentaho/Logout" ><span><span>Logout</span></span></a></li>
                <li style="float:right;"><a href="#"><span><span>My Account</span></span></a>
			<ul>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/dashboard/My_applications.jsp';"><span><span>My Applications</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/dashboard/changePassword.jsp';"><span><span>Change Password</span></span></a></li>
			</ul>

		</li>
		            <li><a href="#" onclick="do_highlightP('Analysis');" ><span><span>Analysis</span></span></a>
				<ul>					
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Fleet:FleetAnalysisReport.xanalyzer/editor';"><span><span>Fleet</span></span></a></li>
					<li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:Markets:MarketsAnalysisReport.xanalyzer/editor';"><span><span>Market</span></span></a></li>					</ul>
				</li>
       
		  <li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/content/pentaho-mobile/resources/index.html';" ><span><span>Mobile-BI</span></span></a></li>
		  <li><a href="javascript:void(0)" onclick="javascript:window.open('/pentaho/dashboard/Collaboration.jsp');"><span><span>Collaboration</span></span></a></li>
		  <li><a href="javascript:void(0)" onclick="javascript:window.open('/pentaho/dashboard/Tickets.jsp');" ><span><span>Tickets</span></span></a></li>
		 <li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/api/repos/:home:AESES:UNUSED:DataVerificationDashboard.xdash/viewer';" ><span><span>Status</span></span></a></li>
		  <li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/dashboard/SCADA.jsp';" ><span><span>SCADA</span></span></a></li>
		  <li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/dashboard/Monitoring.jsp';" ><span><span>Monitoring</span></span></a></li>
		  <li><a href="#" onclick="javascript:getElementById('iframe_a').src='https://www.ouraes.com';" ><span><span>OurAES</span></span></a></li>
		 <li><a href="#" onclick="javascript:getElementById('iframe_a').src='https://www.ouraes.com/AES/index?page=safety_meeting&location=Arlington';" ><span><span>ARLN Safety</span></span></a></li>
		 <li><a href="javascript:void(0)" onclick="javascript:window.open('https://outlet.ouraes.com/');" ><span><span>Outlet</span></span></a></li>
		 <!-- <li><a href="#" onclick="javascript:getElementById('iframe_a').src='/pentaho/dashboard/Maintenance.jsp';" ><span><span>Maintenance</span></span></a></li> -->
			


            </ul>
  </div>
    <!---header end-->
	    <div class="main">
    	<div  id="tab" class="tab-div">
        	
        </div>
         <!---tab end-->
        <div class="tab-container">
					
               	  <iframe src="/pentaho/dashboard/test.html"  target = "_self" frameborder="0" name="iframe_a" id="iframe_a" align = "left" width="100%" height="100%"  scrolling="no" >
			
		   </iframe>
		 	
	


		 
        </div>
         <!---tab div end-->
	</div>
     <!---main end-->
</div>
 <!---main-container end-->

</body>
</html>
