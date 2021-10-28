<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*, java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page language="java" %>
<%
    String ipadress = java.net.InetAddress.getLocalHost().getHostAddress().toString();
    String host = java.net.InetAddress.getLocalHost().getHostName().toString();
%>
<%
    String hostName=request.getServerName();
%>
</head>
<body>
<table>
        <thead>
            <tr>
                <th colspan="2" align="left" class="info-header">Java Environment</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="c1">Java Version:     </td>
                <td class="c2">
                    <%
                        String vmName = System.getProperty("java.vm.name");
                        if (vmName == null) {
                            vmName = "";
                        }
                        else {
                            vmName = " -- " + vmName;
                        }
                    %>
                    <%= System.getProperty("java.version") %> <%= System.getProperty("java.vendor") %><%= vmName %>
                </td>
            </tr>
            <tr>
                <td class="c1">Appserver:</td>
                <td class="c2">
                    <%= application.getServerInfo() %>
                </td>
            </tr>
            <tr>
                <td class="c1">
                    Host Name:
                </td>
                <td class="c2">
                    <%=hostName%>
                </td>
            </tr>
            <tr>
                <td class="c1">
                    Host Name:
                </td>
                <td class="c2">
                    Server: <% out.println(host); %> (<% out.println(ipadress); %>)
                </td>
            </tr>

            <tr>
                <td class="c1">OS / Hardware:</td>
                <td class="c2">
                    <%= System.getProperty("os.name") %> / <%= System.getProperty("os.arch") %>
                </td>
            </tr>
            <tr>
                <td class="c1">tempdir</td>
                <td class="c2">
                    <%= System.getProperty("java.io.tmpdir") %>
                </td>
            </tr>
                        <tr>
                <td class="c1">file.encoding / sun.jnu.encoding</td>
                <td class="c2">
                    <%= System.getProperty("file.encoding") %> / <%= System.getProperty("sun.jnu.encoding") %>
                </td>
            </tr>
            <tr>
                <td class="c1">Locale / Timezone:</td>

                <td class="c2">
                <%= Locale.getDefault() %>
                /
                <%= TimeZone.getDefault().getDisplayName(Locale.getDefault())%>
                 (<%= (TimeZone.getDefault().getRawOffset()/1000/60/60) %> GMT)

                </td>
            </tr>
            <tr>
                <td class="c1">Java Memory</td>
                <td>
                <%    // The java runtime
                    Runtime runtime = Runtime.getRuntime();

                    double freeMemory = (double)runtime.freeMemory()/(1024*1024);
                    double maxMemory = (double)runtime.maxMemory()/(1024*1024);
                    double totalMemory = (double)runtime.totalMemory()/(1024*1024);
                    double usedMemory = totalMemory - freeMemory;
                    double percentFree = ((maxMemory - usedMemory)/maxMemory)*100.0;
                    double percentUsed = 100 - percentFree;
                    int percent = 100-(int)Math.round(percentFree);

                    DecimalFormat mbFormat = new DecimalFormat("#0.00");
                    DecimalFormat percentFormat = new DecimalFormat("#0.0");
                %>

                <table cellpadding="0" cellspacing="0" border="0" width="300">
                <tr valign="middle">
                    <td width="99%" valign="middle">
                        <div class="bar">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:1px #666 solid;">
                        <tr>
                            <%  if (percent == 0) { %>

                                <td width="100%"><img src="images/percent-bar-left.gif" width="100%" height="8" border="0" alt=""></td>

                            <%  } else { %>

                                <%  if (percent >= 90) { %>

                                    <td width="<%= percent %>%" background="images/percent-bar-used-high.gif"
                                        ><img src="images/blank.gif" width="1" height="8" border="0" alt=""></td>

                                <%  } else { %>

                                    <td width="<%= percent %>%" background="images/percent-bar-used-low.gif"
                                        ><img src="images/blank.gif" width="1" height="8" border="0" alt=""></td>

                                <%  } %>
                                <td width="<%= (100-percent) %>%" background="images/percent-bar-left.gif"
                                    ><img src="images/blank.gif" width="1" height="8" border="0" alt=""></td>
                            <%  } %>
                        </tr>
                        </table>
                        </div>
                    </td>
                    <td width="1%" nowrap>
                        <div style="padding-left:6px;" class="c2">
                        <%= mbFormat.format(usedMemory) %> MB of <%= mbFormat.format(maxMemory) %> MB (<%= percentFormat.format(percentUsed) %>%) used
                        </div>
                    </td>
                </tr>
                </table>
                </td>
            </tr>
        </tbody>
</table>
