<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + path + "/";
    pageContext.setAttribute("ctx", path);
    pageContext.setAttribute("base", basePath);
%>