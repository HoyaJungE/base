<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- topmenu start -->
<script type="text/javascript">
<!--
    function getLastLink(baseMenuNo){
    	var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            //선택된 메뉴(baseMenuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
            if (nValue[1]==baseMenuNo) {
                if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
                    //링크정보가 있으면 링크정보를 리턴한다.
                    return nValue[5];
                }else{
                    //링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
                    return getLastLink(nValue[0]);
                }
            }
        }
    }
    function goMenuPage(baseMenuNo){
    	document.getElementById("baseMenuNo").value=baseMenuNo;
        document.menuListForm.action = "<c:url value='/'/>"+getLastLink(baseMenuNo).substring(1);
        document.menuListForm.submit();
    }
    function actionLogout()
    {
        document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
        document.selectOne.submit();
        //document.location.href = "<c:url value='/j_spring_security_logout'/>";
    }
//-->
</script>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <c:forEach var="result" items="${list_headmenu}" varStatus="status">
            <li class="nav-item"><a class="nav-link" href="#LINK" onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out value="${result.menuNm}"/></a></li>
        </c:forEach>
        <c:if test="${fn:length(list_headmenu) == 0 }">
            <li class="nav-item">등록된 메뉴가 없습니다.</li>
        </c:if>
    </ul>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">사용자 설정</a></li>
                <li><a class="dropdown-item" href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
            </ul>
        </li>
    </ul>
</nav>
<!-- //topmenu end -->
<!-- menu list -->
<form name="menuListForm" action="" method="post">
    <input type="hidden" id="baseMenuNo" name="baseMenuNo" value="<%=session.getAttribute("baseMenuNo")%>" />
    <input type="hidden" id="link" name="link" value="" />
    <div style="width:0px; height:0px;">
    <c:forEach var="result" items="${list_menulist}" varStatus="status" >
        <input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
    </c:forEach>
    </div>
</form>
