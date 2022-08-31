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
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">
                    <fieldset><legend>조건정보 영역</legend>
                        <%
                            LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
                            if(loginVO == null){
                        %>
                        <div>
                            로그인정보 없음 로그인후 사용하십시오
                            <a class="btn btn-primary" href="<c:url value='/uat/uia/egovLoginUsr.do'/>">로그인</a>
                        </div>
                        <%
                        }else{
                        %>
                        <c:set var="loginName" value="<%= loginVO.getName()%>"/>
                        <div>
                            <a href="#LINK" onclick="alert('개인정보 확인 등의 링크 제공'); return false;"><c:out value="${loginName}"/> 님</a>
                            <a class="btn btn-primary" href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a>
                        </div>
                        <%
                            }
                        %>
                    </fieldset>
                </div>
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
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as: <c:out value="${loginName}"/> 님</div>
        </div>
    </nav>
</div>

<!-- //메뉴 끝 -->