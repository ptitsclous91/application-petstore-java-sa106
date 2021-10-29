<html xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
<head>
<title>Application Health Check</title>
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">

<!--[if gte mso 9]><xml>
<mso:CustomDocumentProperties>
<mso:ContentTypeId msdt:dt="string">0x01010006F3009D20B53F45A1C8C1047B5BFC24</mso:ContentTypeId>
</mso:CustomDocumentProperties>
</xml><![endif]-->
</head>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<%
    String ipadress = java.net.InetAddress.getLocalHost().getHostAddress().toString();
    String host = java.net.InetAddress.getLocalHost().getHostName().toString();
    Runtime runtime = Runtime.getRuntime();
    long allocatedMemory = runtime.totalMemory();
    long freeMemory = runtime.freeMemory();

%>
<body>

  <h1> Application Health Check </h1>
  <h3># HTTP request server name : <%= request.getServerName() %></h3>
  <h3># Server: <% out.println(host); %> (<% out.println(ipadress); %>)</h3>
  <h3># TimeZone: <% out.println(java.util.TimeZone.getDefault().getID()); %> (<% out.println(java.util.TimeZone.getDefault().getDisplayName()); %>)</h3>
  <h3># Java Version:
        <% out.println(System.getProperty("java.version")); %> (<% out.println(System.getProperty("java.vendor")); %>)</h3>
  <h3># Operating system:
        <% out.println(System.getProperty("os.name")); %></h3>
  <h3># Operating system Architecture:
        <% out.println(System.getProperty("os.arch")); %></h3>
  <h3># java.vm.name:
        <% out.println(System.getProperty("java.vm.name")); %></h3>
  <h3># temp Dir:
        <% out.println(System.getProperty("java.io.tmpdir")); %></h3>
  <h3># <% out.println("free memory: " + freeMemory / 1024 / 1024); %> Mo</h3>
  <h3># <% out.println("allocated memory: " + allocatedMemory / 1024 / 1024);  %>Mo</h3>

</body>
</html>