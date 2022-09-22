<%--
  Class Name : EgovLoginUsr.jsp
  Description : 로그인화면
  Modification Information
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>로그인</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<script type="text/javascript">
<!--
function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
        document.loginForm.action="<c:url value='/uat/uia/actionSecurityLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
    /*var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    getid(document.loginForm);*/
}
//-->
</script>
<!-- 공통 css 추가 시작 -->
<link href="<c:url value='/css/sb-admin/styles.css'/>" rel="stylesheet" type="text/css" >
<!-- 공통 css 추가 종료 -->
<!-- 공통 script 추가 시작 -->
<script type="text/javascript"  src="<c:url value='/js/sb-admin/bootstrap.bundle.min.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/js/sb-admin/Chart.min.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/js/sb-admin/fontawesome-releases-v6.1.0-all.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/js/sb-admin/scripts.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/js/sb-admin/simple-datatables@latest.js'/>"></script>
<!-- 공통 script 추가 종료 -->
</head>
<body  onload="fnInit();">
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
<div id="wrap">

    <div class="user_login">
    <form:form id="loginForm" name="loginForm" method="post">
        <fieldset><legend>조건정보 영역</legend>
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                <div class="card-body">
                    <form>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="text" id="id" name="id" maxlength="10" />
                            <label for="id">아이디</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="password" maxlength="25" title="비밀번호를 입력하세요." id="password" name="password"
                                   onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
                            <label for="password">비밀번호</label>
                        </div>
                        <div class="form-check mb-3">
                            <label>로그인ID 저장</label>
                            <input class="form-check-input" type="checkbox" name="checkId" title="로그인ID 저장여부" onclick="javascript:saveid(this.form);" id="checkId" />
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                            <a class="small" href="password.html">비밀번호를 잊어버리셨나요?</a>
                            <a class="btn btn-primary" onclick="javascript:actionLogin()" >로그인</a>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <div class="small"><a href="#">회원가입</a></div>
                </div>
            </div>
            <input type="hidden" name="userSe"  value="USR"/>
            <input type="hidden" name="message" value="${message}" />
            <input name="j_username" type="hidden"/>
        </fieldset>
    </form:form>
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>