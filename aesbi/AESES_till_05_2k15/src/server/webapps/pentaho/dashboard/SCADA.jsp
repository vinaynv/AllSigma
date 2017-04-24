<%@ page import="org.jasypt.encryption.pbe.StandardPBEStringEncryptor"%>
<%@ page import="org.jasypt.encryption.pbe.config.SimplePBEConfig"%>
<%@ page import="org.jasypt.encryption.pbe.*"%>
<%@ page import="org.jasypt.salt.RandomSaltGenerator"%>
<%@ page import="org.jasypt.salt.SaltGenerator"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<script type="text/javascript">
window.onload = formSubmit;
function formSubmit() {
	document.forms["logonForm2"].submit();
}
</script>
</head>
<body>
<%
SimplePBEConfig simplePBEConfig = new SimplePBEConfig();
simplePBEConfig.setKeyObtentionIterations(10000);
 
SaltGenerator saltGenerator = new RandomSaltGenerator();
saltGenerator.generateSalt(16);
 
simplePBEConfig.setSaltGenerator(saltGenerator);
simplePBEConfig.setPassword("password$123#");
 
StandardPBEStringEncryptor e = new StandardPBEStringEncryptor();
e.setConfig(simplePBEConfig);
e.initialize();
 



String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();
Connection con=null;
ResultSet rst=null;
Statement stmt=null;
try{
String url="jdbc:mysql://enst01db02pr.aesenergystorage.com:3306/hibernate?user=nagraj.r&password=Sigma_2011!";
Object obj = session.getAttribute("SECURITY_PRINCIPAL");
if(obj != null
&& obj instanceof org.springframework.security.providers.UsernamePasswordAuthenticationToken)
{
org.springframework.security.userdetails.User user = (org.springframework.security.userdetails.User)
((org.springframework.security.providers.UsernamePasswordAuthenticationToken)obj).getPrincipal();
String query="select scada_user, scada_pass from APPLICATIONS where pentaho_user='"+user.getUsername()+"'";
int i=1;
con=DriverManager.getConnection(url);
stmt=con.createStatement();
rst=stmt.executeQuery(query);
while(rst.next()){
request.setAttribute("username",rst.getString(1));
String decryptedPassword = e.decrypt(rst.getString(2));
request.setAttribute("password",decryptedPassword);
}}
rst.close();
stmt.close();
con.close();
}catch(Exception ex){
System.out.println(ex.getMessage());
}
%>

<form  action="http://enst01ap01pr.aesenergystorage.com:8080/login.htm" name="logonForm2" method="post"  target="_self">
  <input name="username" id="username" value="<%=request.getAttribute("username")%>" type="hidden" />
  <input name="password" id="password" type="hidden" value="<%=request.getAttribute("password")%>"/>
 </form>
</body>
</html>