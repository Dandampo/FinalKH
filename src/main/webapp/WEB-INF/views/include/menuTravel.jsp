<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- 헤더 메뉴 공간 -->
<div class="ui fluid container">
	<div class="ui violet inverted segment">
		<div class="ui labeled icon fixed menu">
				<a class="item" href="${path}/main.do"><i class="skyatlas big icon"></i>메인</a>
				<a class="item" href="${path}/travel/makePlan.do"><i class="map icon"></i>여행플랜</a>
				<a class="item"><i class="help circle icon"></i>이용방법</a>
				<a class="item"><i class="book icon"></i> 여행팁</a>
				<a class="item"><i class="map signs icon"></i> 여행일정</a>
				<a class="item"><i class="camera retro icon"></i> 관광지</a>
				<a class="item" href="${path}/travel/reviewList.do"><i class="book icon"></i> 여행후기</a>
				<a class="item" href="${path}/member/list.do"><i class="book icon"></i>회원관리</a>
				<input type="button" value="마이페이지"
							onclick="location.href='member/mypageMain.do'"
							style="width: 270px" /><!-- 다은 테스트 지울게요 -->
			<div class="right menu">
				<a class="item" href="${path}/sample/sample.do"><i class="cube orange icon"></i>예제</a>
				
				<c:choose>
			    	<c:when test="${sessionScope.userid == null}">
			    		<a class="item" href="javascript:loginForm()"><i class="sign in red icon"></i> 로그인</a>
			    	</c:when>
			    	<c:otherwise>
			    		<a class="item" href="#"><i class="user circle blue icon"></i>${sessionScope.userid }님!</a>
			    		<a class="item" href="${path}/member/logout_test.do"><i class="sign out red icon"></i> 로그아웃</a>
			    	</c:otherwise>
			    </c:choose>
				
				
				
				
			</div>
		</div>
	</div>
</div>
<!-- DIMMER 처리된 회원가입 페이지  -->
<div class="ui container">
	<div class="ui smaill basic loginForm modal">
		<div class="content">
			<%@ include file="../include/include-loginForm.jsp"%>
		</div>
	</div>
</div>
<script>
function loginForm() {
	$('.ui.loginForm.modal').modal('show');
}
</script>
<c:if test="${msg =='failure' }">
	<script>$('.ui.loginForm.modal').modal('show');
	alert("It is wrong about your E-mail or Password");
	</script>
	
</c:if>