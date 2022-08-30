<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value="/js/EgovMainMenu.js"/>"></script>
<script type="text/javascript">
<!--
/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
function fn_MovePage(nodeNum) {
    var nodeValues = treeNodes[nodeNum].split("|");
    document.menuListForm.action = "${pageContext.request.contextPath}"+nodeValues[5];
    document.menuListForm.submit();
}
//-->
</script>
<!-- 메뉴 시작 -->
<div id="LoginStatus">
	  <fieldset><legend>조건정보 영역</legend>
	  	<%
        LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
        if(loginVO == null){
        %>
        <ul>
	  		<li>로그인정보 없음</li>
	  		<li><a href="<c:url value='/uat/uia/egovLoginUsr.do'/>"><img src="<c:url value='/images/leftmenu/login.jpg' />" alt="로그인" /></a></li>
	  		<li>로그인후 사용하십시오</li>
	  	</ul>
	  	<%
        }else{
	  	%>
            <c:set var="loginName" value="<%= loginVO.getName()%>"/>
            <ul>
	  	    <li><a href="#LINK" onclick="alert('개인정보 확인 등의 링크 제공'); return false;">
            <c:out value="${loginName}"/> 님</a></li>
            <li><a href="<c:url value='/uat/uia/actionLogout.do'/>">
            <img src="<c:url value='/images/leftmenu/logout.jpg' />" alt="로그아웃" /></a></li>
            </ul>
	  	<%
	  	}
        %>
	  </fieldset>
</div>
<div id="nav">
	<div class="top"></div>
    <div class="nav_style">
     <script type="text/javascript">
     <!--
         var Tree = new Array;
         if(document.menuListForm.tmp_menuNm != null){
             for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
                 Tree[j] = document.menuListForm.tmp_menuNm[j].value;
             }
         }
         createTree(Tree, true, document.getElementById("baseMenuNo").value);
     //-->
     </script>
    </div>
	<div class="bottom"></div>
</div>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <script type="text/javascript">
                    <!--
                    var Tree = new Array;
                    if(document.menuListForm.tmp_menuNm != null){
                        for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
                            Tree[j] = document.menuListForm.tmp_menuNm[j].value;
                        }
                    }
                    createTree(Tree, true, document.getElementById("baseMenuNo").value);
                    //-->
                </script>

                <a class='nav-link collapsed' href='#' data-bs-toggle='collapse' data-bs-target='#collapseLayouts' aria-expanded='false' aria-controls='collapseLayouts'>
                    <div class='sb-nav-link-icon'><i class='fas fa-columns'></i></div>
                        Layouts
                    <div class='sb-sidenav-collapse-arrow'><i class='fas fa-angle-down'></i></div>
                </a>
                <div class='collapse' id='collapseLayouts' aria-labelledby='headingOne' data-bs-parent='#sidenavAccordion'>
                    <nav class='sb-sidenav-menu-nested nav'>
                        <a class='nav-link' href='layout-static.html'>Static Navigation</a>
                        <a class='nav-link' href='layout-sidenav-light.html'>Light Sidenav</a>
                    </nav>
                </div>


            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as: <c:out value="${loginName}"/> 님</div>
            Start Bootstrap
        </div>
    </nav>
</div>

<!-- //메뉴 끝 -->