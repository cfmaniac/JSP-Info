<%-- import attributes start here --%>
<%@ page import="java.lang.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.util.ArrayList, java.util.List, java.util.Date, java.util.Calendar, java.util.Vector, java.util.Properties, java.util.Enumeration" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	String SN = n(request.getRequestURI()); // script name shortcut, including path
	String SCN = SN.substring(SN.lastIndexOf("/")+1); // just the jsp name (eg., Foo.jsp)
%>
<html>
	     <head>
		 <style type="text/css"><!--
			body {
			background-color: #ffffff; 
			background-image: url();
			background-position: center;
			background-repeat: no_repeat;
			background-attachment: fixed;  
			color: #000000;}
			body, td, th, h1, h2 {font-family: sans-serif;}
			pre {margin: 0px; font-family: monospace;}
			a:link {color: #000099; text-decoration: none; background-color: ;}
			a:hover {text-decoration: underline;}
			table {border-collapse: collapse; border: 0; width: 934px; box-shadow: 1px 2px 3px #ccc;}
			.fixed_headers {table-layout: fixed;border-collapse: collapse;}
			.fixed_headers th {text-decoration: underline;}
			.fixed_headers th, .fixed_headers td {padding: 5px;text-align: left;}
			.fixed_headers td:nth-child(1), .fixed_headers th:nth-child(1) {min-width: 200px;}
			.fixed_headers td:nth-child(2),	.fixed_headers th:nth-child(2) {min-width: 200px;}
			.fixed_headers td:nth-child(3),	.fixed_headers th:nth-child(3) {min-width: 252px;}
			.fixed_headers td:nth-child(4),	.fixed_headers th:nth-child(4) {min-width: 220px;}
			.fixed_headers thead {background-color: #ccccff;color: #000;}
			.fixed_headers thead tr {display: block; position: relative;}
			.fixed_headers tbody {display: block;overflow: auto;width: 100%;height: 150px;}
			.fixed_headers tbody tr:nth-child(even) {background-color: #dddddd;}
			.old_ie_wrapper {height: 300px;width: 750px;overflow-x: hidden;	overflow-y: auto;}
			.old_ie_wrapper tbody {height: auto;}
			.center {text-align: center;}
			.center table { margin-left: auto; margin-right: auto; text-align: left;}
			.center th { text-align: center !important; }
			td, th { border: 1px solid #000000; font-size: 75%; vertical-align: top;}
			.modules table {border: 0;}
			.modules td { border:0; font-size: 100%; vertical-align: baseline;}
			.modules th { border:0; font-size: 100%; vertical-align: baseline;}
			h1 {font-size: 150%;}
			h2 {font-size: 125%;}
			.p {text-align: left;}
			.e {background-color: #ccccff; font-weight: bold; color: #000000;}
			.h {background-color: #9999cc; font-weight: bold; color: #000000;}
			.v {background-color: #cccccc; color: #000000;}
			i {color: #666666; background-color: #cccccc;}
			img {float: right; border: 0px;}
			hr {width: 600px; background-color: #cccccc; border: 0px; height: 1px; color: #000000;}
			//-->
		 </style>
		 <title>JSP Tomcat Info
         </title>
		 </head>
		 <body>
		 <div class="center">
		 <table border="0" cellpadding="3" width="600">
			<tr class="h"><td>
			<h1 class="p">${pageContext.servletContext.serverInfo}</h1>
			
			</td></tr>
			</table>
		 
		 
<% String s=""; %>
<div id="container">
<%= javaInfo(request,response,999) %>
</div>
 <div class="copyright">
	    JSPInfo &copy; 2015-<%= new SimpleDateFormat("yyyy").format(new Date()) %> J Harvey. All Rights Reserved.<br>
	    Released as-is, whereis as no warranty is given. Share and distribute.
	    </div>
	    </div>
	    
	    </body>
	    </html>
<%!

	String vBR = "<br>\n";

	public String javaInfo(HttpServletRequest request, HttpServletResponse response, int lev) {
		String out = "";
		String s = "";
		String t = "";

		out+=("<table border=\"0\" cellpadding=\"3\" width=\"100%\">");		

		Properties props = System.getProperties();
		for (Enumeration e = props.propertyNames(); e.hasMoreElements(); ) {
		  s = n(e.nextElement());
		  t = "";
		  if (!s.equals("")) { 
			 t = n(System.getProperty(s));
			 t = (t.indexOf(";")>0 ? str_replace(java.io.File.pathSeparator,';'+vBR,t)+vBR : t);
			 t = str_replace(".jar:", ".jar:\n<br>" ,t);
			 t = str_replace(",$", ",\n<br>$", t);
			 out+=("<tr><td class='e'><b>"+s+":</b></td><td class='v'>" + t +"</td></tr>");
		  }
		}

		out+=("</table>");
		out+=("<h2>Request Headers:</h2>");
		out+=("<table border=\"0\" cellpadding=\"3\" width=\"100%\">");	
		for (Enumeration e = request.getHeaderNames(); e.hasMoreElements(); ) {
		  s = n(e.nextElement());
		  t = "";
		  if (!s.equals("")) { 
			 t = n(request.getHeader(s));
			 t = (t.indexOf(";")>0 ? str_replace(java.io.File.pathSeparator,';'+vBR,t)+vBR : t);
			 out+=("<tr><td class='e'><b>"+s+":</b></td><td class='v'> " + t +"</td></tr>");
		  }
		}
		out+=("</table>");
		out+=("<h2>Request Headers:</h2>");
		out+=("<table border=\"0\" cellpadding=\"3\" width=\"100%\">");	
		out+=("<tr><td class='e'><b>Method:</b></td><td class='v'> " + request.getMethod()+"</td></tr>");
		out+=("<tr><td class='e'><b>Request URI:</b></td><td class='v'> " + request.getRequestURI()+"</td></tr>");
		out+=("<tr><td class='e'><b>Protocol:</b></td><td class='v'> " + request.getProtocol()+"</td></tr>");
		out+=("<tr><td class='e'><b>Path Info:</b></td><td class='v'> " + request.getPathInfo()+"</td></tr>");
		out+=("<tr><td class='e'><b>Remote Address:</b></td><td class='v'> " + request.getRemoteAddr()+"</td></tr>");
		//out+=("getRequestedSessionId: "+n(request.getRequestedSessionId()) + vBR);
		out+=("</table>");		
	
		return out;
	}

	public String n(Object obj) { // convert a possibly null into a "" instead
		String in = "";
		try {
			if (obj==null) { 
				in = "";
			} else if (isInt(obj)) {
				in = ""+obj;
			} else if (isInteger(obj)) {
				in = obj.toString();
			} else if (hasMethod(obj,"toString()")) {
				in = obj.toString();
			} else if (obj!=null) { // else try to cast to String
				in = (String)obj;
			}
			in = ""+(in == null || in.equals("null") ? "" : in);
			return in;
		} catch (Exception e) {
			return handleException(e,"n("+obj.getClass().getName()+" \""+obj+"\")");
		}
	}


	public boolean isNull(Object obj) {
		return (obj==null);
	}

	public boolean isInt(Object obj) {
		return (obj!=null && obj.getClass().getName().indexOf("int")>=0);
	}

	public boolean isInteger(Object obj) {
		return (obj!=null && obj.getClass().getName().indexOf("Integer")>=0);
	}

	public boolean isString(Object obj) {
		return (obj!=null && obj.getClass().getName().indexOf("String")>=0);
	}

	public boolean isNullString(Object obj) {
		return (obj!=null && obj.getClass().getName().indexOf("String")>=0 
			&& obj.toString().equals("")
		);
	}

	public boolean isNullOrNullString(Object obj) {
		return ( (obj==null || obj.toString().equals("")) &&
			obj.getClass().getName().indexOf("String")>=0 
		);
	}

	// java.lang.reflection. cool. 	
	public List getMethods(Object obj) { // eg., out.write(listArrayList(getMethods(someObj))+"<p>");
		List list = new ArrayList();
		Method[] meth = obj.getClass().getMethods();
		for (int m=0;m<meth.length;m++) {
			list.add(meth[m].toString());
		}
		return list;
	}

	public boolean hasMethod(Object obj, String s) { // combine isInArrayList with getMethods...
		List list = new ArrayList();
		Method[] meth = obj.getClass().getMethods();
		for (int m=0;m<meth.length;m++) {
			if (meth[m].toString().indexOf(s)>=0) {
				return true;
			}
		}
		return false;
	}

	public String str_replace(String sep, String rep, String s) // analogue to preg_replace("pat","repl","src");
	{
		if (sep!=null && !sep.equals("") && sep.length()>0 && !sep.equals(rep)) { 
			try 
			{
				String outText = ""; 
				int pos = 0;
				while(s.length()>=1) {
					if (s.indexOf(sep)>-1){
						pos = s.indexOf(sep);
						outText += s.substring(0,pos)+rep;
						s = s.substring(pos+sep.length());
					} else {
						outText +=s;
						s="";
					}
				}
				return(outText); 
			}
			catch (Exception e)
			{
				handleException(e,"str_replace()");
			}
			return("");
		} else {
			return s;
		}
	}

	public String str_replace_multi(String sep, String rep, String s) // analogue to preg_replace("pat","repl","src");, but where each char of sep is treated as a string to replace
	{
		if (sep!=null && !sep.equals("") && sep.length()>0 && !sep.equals(rep)) { 
			try 
			{
				String outText = ""; 
				int pos = 0;
				while(sep.length()>=1) {
					s = str_replace(sep.substring(0,1),rep,s);
					sep = sep.substring(1);
				}
				return s;
			}
			catch (Exception e)
			{
				handleException(e,"str_replace_multi()");
			}
			return("");
		} else {
			return s;
		}
	}

	public String handleException(Exception e, String funcname) {	
	  String l = "";
	  try {
			l+=("<pre>");
			l+=("\n\t** ERROR in "+funcname+" **");
			l+=("\n\t1: "+e.toString());
			l+=("\n\t2: "+e.getMessage());
			l+=("\n\t3: "+e.getLocalizedMessage());
			l+=("\n\t** [ERROR in "+funcname+" ] **");
			l+=("</pre>");
			e.printStackTrace();
			return l;
	  } catch(Exception ex) {
		 ex.printStackTrace();
	  }
	  return l;
	 }


%>
