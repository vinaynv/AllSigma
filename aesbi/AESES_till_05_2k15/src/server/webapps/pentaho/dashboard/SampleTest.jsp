<%@ page import="org.jasypt.encryption.pbe.StandardPBEStringEncryptor"%>
<%@ page import="org.jasypt.encryption.pbe.config.SimplePBEConfig"%>
<%@ page import="org.jasypt.encryption.pbe.*"%>
<%@ page import="org.jasypt.salt.RandomSaltGenerator"%>
<%@ page import="org.jasypt.salt.SaltGenerator"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page import="javax.net.ssl.SSLPeerUnverifiedException"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<%
   URL url = new URL("https://aesenergystorage.atlassian.net/secure/Dashboard.jspa");
    StringBuffer text = new StringBuffer();
    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
    conn.connect();
    InputStreamReader in = new InputStreamReader((InputStream) conn.getContent());
    BufferedReader buff = new BufferedReader(in);
     String inputLine;
	 String OutputLine=null;
        while ((inputLine = buff.readLine()) != null)
             OutputLine=inputLine;
        buff.close(); %>
<head>
<script type="text/javascript">
alert("Welcome");
window.onload=DisplayContent();

function DisplayContent()
{
var content1 = "<%=inputLine%>";
var content2 = "<%=OutputLine%>";
alert(content1);
alert(content2);
document.getElementById('TicketSystem').innerHTML = content2;
}
</script>
</head>
<body>

<div id="TicketSystem" width="100%" height="93%">
</div>
</body>
</html>