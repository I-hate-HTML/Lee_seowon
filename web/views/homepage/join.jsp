<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>약관동의</title>
<!-- 개별페이지 CSS -->
<!-- 이것만 위치 맞춰주면됨 -->
<link
	href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css"
	rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- 아이콘 레퍼런스 사이트 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"
	rel="stylesheet">
<style>
.row h5 {
	font-size: 25px;
	font-weight: 600;
	margin-bottom: 40px;
}
</style>


</head>
<body style="background: #f5f6f7;">

	<!-- Navigation -->
		
	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light fixed-top "
			id="mainNav" style="background-color: white;">
			<div class="container">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"
					style="font-size: 28px; color: black;">무슨무슨유치원</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">

					Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">보육프로그램</a>
							<div class="dropdown-menu " aria-labelledby="dropdown01">
								<a class="dropdown-item" href="<%=request.getContextPath()%>/index.jsp">보육계획안</a> <a
									class="dropdown-item" href="<%=request.getContextPath()%>/index.jsp">식단 안내</a> <a
									class="dropdown-item" href="<%=request.getContextPath()%>/index.jsp">행사 안내</a>
							</div></li>
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="<%=request.getContextPath()%>/index.jsp" id="dropdown01">앨범</a></li>
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="<%=request.getContextPath()%>/index.jsp" id="dropdown01">공지사항</a></li>
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="<%=request.getContextPath()%>/index.jsp" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">마이페이지</a>
							<div class="dropdown-menu " aria-labelledby="dropdown01">
								<a class="dropdown-item" href="<%=request.getContextPath()%>/index.jsp">개인정보수정</a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/index.jsp">알림장작성</a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/index.jsp">문의신청</a>
							</div></li>
						<li class="nav-item dropdown show">
								
             				 <a class="nav-link" href="../../index.jsp" id="dropdown01">로그인</a>
         					
				
				</li>
				</ul>
				</div>
			</div>
		</nav>
	</header class="masthead">
	
	<div class="top_bg">
		<a class="top_p"> 팡팡어린이집 </a>
		<p>회원가입 약관</p>
	</div>
	<!-- Main Content -->
	<br>
	<br>
	<br>
	<br>
	<div id="contents" class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<h5>'KH 요정의 집 어린이집' 홈페이지 가입약관</h5>
				<div class="policy"
					style="font-size: 14px; line-height: 23px; margin: 20px; height: 200px; overflow: scroll;">
					<b style="color: #000;">제1장 총칙</b><br> <br> <b>제1조(목적)</b><br>
					이 약관은 KH 요정의 집 어린이집 홈페이지(이하 "당사이트"라 합니다)와 이용자 간에 당사이트에서 제공하는 서비스(이하
					"서비스" 라 합니다)의 이용조건 및 절차에 관한 기본적인 사항을 정함을 목적으로 합니다.<br> <br>
					<b>제2조(이용약관의 효력 및 변경)</b><br> ① 이 약관은 서비스 메뉴 및 당사이트에 게시하거나 기타의
					방법으로 회원에게 공지함으로써 효력을 발생합니다.<br> ② 당사이트는 합리적인 사유가 발생될 경우에는 이
					약관을 변경할 수 있으며, 약관이 변경된 경우에는 지체 없이 이를 공시함으로써 그 효력을 발생합니다.<br> ③
					회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후에도 서비스를
					계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.<br> <br> <b>제3조(약관의
						준칙)</b><br> ① 본 약관은 당사이트가 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용하며, 이
					약관에 명시되지 아니한 사항에 대하여는 기타 관계법령 및 서비스 별 약관의 취지에 따라 적용할 수 있습니다.<br>
					② 제1항에서 정한 개별 이용계약서(세부 약정서 등)에는 고객의 이익을 침해하거나 부당한 내용을 규정할 수 없습니다.<br>
					<br> <b>제4조(용어의 정의)</b><br> ① 이 약관에서 사용하는 용어의 정의는 다음과
					같습니다.<br> 1. 이용자 : 본 약관에 따라 당사이트가 제공하는 서비스를 받는 자를 말합니다.<br>
					2. 가 입 : 당사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는
					행위를 말합니다.<br> 3. 회 원 : 본인 실명으로 가입한 회원만을 원칙으로 합니다. "회원"이라함은
					서비스를 제공받기 위하여 본 약관에 동의하고 당사이트의 회원신청양식에 본인의 신상명세를 기입하여 이용자ID(고유번호)와
					Password(비밀번호)를 부여 받으신 분을 말합니다.<br> 4. 이용계약: 서비스를 제공받기 위하여
					당사이트와 체결하는 계약을 말합니다.<br> 5. 이용자ID : 회원의 식별과 회원의 서비스 이용을 위하여
					회원이 선정하고 당사이트가 승인하는 영문 혹은 영문과 숫자의 조합을 말합니다.<br> 6. 비밀번호 : 회원이
					사용하는 이용자ID와 일치된 회원임을 확인하고 회원의 권익 및 비밀을 보호하기 위해 회원이 설정한 문자와 숫자의 조합을
					말합니다.<br> 7. 운영자 : 서비스 전체 또는 일부의 관리와 운영을 위해 당사이트에서 지정한 사람을
					말합니다.<br> 8. 탈퇴 : 당사이트 또는 회원이 이용계약을 해약하는 것을 말합니다.<br> <br>
					<b style="color: #000;">제2장 서비스이용계약</b><br> <br> <b>제5조(이용계약의
						성립 및 체결단위)</b><br> ① 이용계약은 이용자의 본 이용약관에 대한 동의와 제6조에 규정한 회원의 이용신청에
					대하여 당사이트의 이용승낙으로 성립합니다.<br> ② 본 이용약관에 대한 동의는 가입신청 시 본 약관을 읽고
					"약관에 동의합니다"의 대화창에 표시를 한 후 아래 회원가입 버튼을 누름으로써 이 약관에 동의하는 것으로 간주합니다.<br>
					③ 이용계약은 회원이 당사이트가 정한 가입절차를 통해 게시되며, 당사이트가 정한 탈퇴절차가 완결된 시점까지 성립됩니다.
					자의에 따른 가입이라 하더라도 가입신청양식에 허위사실을 기재했을 경우 계약이 무효화되며, 당사이트가 이를 발견한 즉시
					일방적으로 이용을 제한할 수 있습니다. 또한 당사이트가 금하는 활동을 통해 당사이트가 이용자를 불량이용자로 등록한 경우
					일반회원과 달리 불량 이용에 대한 제재나 또 다른 피해자의 예방을 위해 이용자 자격을 박탈하고 사용금지 기간을 추가할 수
					있습니다.<br> <br> <b>제6조(회원의 이용신청)</b><br> ① 회원으로 가입하여
					본 서비스를 이용하고자 하는 이용 고객은 당사이트에서 요청하는 다음의 정보를 제공하여야 합니다. 다음 사항을 필수
					사항으로 하며 그 외 사항은 선택사항으로 합니다.<br> <br> 필수 입력 사항 :<br>
					1. 이름 / 2. 생년월일 / 3. 아이디(ID) / 4. E-mail 주소 / 5. 비밀번호 / 6. 전화번호 및
					핸드폰번호 / 7. 거주지역 / 8. 성별<br> <br> 장난감 도서관 회원가입 가입시 필수 입력
					사항 :<br> 1. 자녀이름 / 2. 자녀생년월일 / 3. 자녀성별<br> <br> ② 만
					14세미만 아동이 가입을 원할 경우 당사이트 가입 원칙에 의거하여 부모님(법정 대리인)의 동의를 얻어야 합니다.<br>
					③ 모든 회원은 반드시 회원본인의 성명을 등록하여야합니다. 실명으로 등록하지 않은 회원은 법적인 보호를 받을 수 없으며,
					서비스 사용의 제한을 받게 되며 관련법령에 따라 처벌을 받을 수 있습니다.<br> <br> <b>제7조(이용신청에
						대한 불승낙과 승낙의 제한)</b><br> ① 당사이트는 제6조의 규정에 의해 이용신청을 한 고객에 대하여 업무수행상
					또는 기술상 지장이 없는 경우, 다음 제2항과 제3항의 경우를 예외로 하여 승낙할 수 있습니다.<br> <br>
					당사이트는 다음 각 호에 해당하는 경우 이용신청에 대하여 승낙을 하지 아니합니다.<br> 1. 실명이 아니거나
					타인 명의로 신청한 경우<br> 2. 이용계약 신청서의 내용을 허위로 기재한 경우<br> 3. 사회의
					질서나 안녕, 미풍양속을 저해할 목적 또는 이와 유사한 행위를 했을 경우<br> 4. 당사이트의 기본 서비스 및
					타 서비스에 영향을 줄 수 있다고 판단되는 경우<br> 5. 기타 이용신청고객의 귀책사유로 이용승낙이 곤란한
					경우<br> 6. 정보통신윤리위원회에 PC통신ㆍ인터넷서비스의 불량이용자로 등록되어 있는 경우<br>
					7. 기타 당사이트가 정한 이용신청 요건이 만족되지 않았을 경우<br> <br> ②당사이트는 서비스
					이용신청이 다음 각호에 해당하는 경우에는 그 신청에 대한 승낙 제한사유가 해소될 때까지는 승낙을 유보할 수 있습니다.<br>
					1. 당사이트가 서비스 이용설비의 여유가 없는 경우<br> 2. 기술상 서비스 제공이 불가능한 경우<br>
					3. 당사이트의 기본서비스 및 기타 서비스에 영향을 줄 수 있다고 판단되는 경우<br> 4. 기타 사유로 이용
					승낙이 곤란한 경우<br> <br> ③ 당사이트는 제1항 및 제2항의 규정에 의하여 이용신청이 승낙되지
					않거나 승낙을 제한하는 경우에는 이를 이용신청고객에게 즉시 알려야 합니다.<br> <br> <b>제8조(이용자ID
						부여 및 변경 등)</b><br> ① 당사이트는 이용자에 대하여 이용계약서 등에 따라 이용자 ID를 부여하며 이용자
					ID의 변경은 원칙적으로 불가합니다. 단, 부득이한 사유로 인하여 ID를 변경하고자 하는 경우에는 해당 ID를 해지하고
					재가입하여야 합니다.<br> <br> ② 회원은 마이페이지 메뉴 혹은 기타 해당페이지로 링크된 메뉴를
					통하여 자신의 개인정보를 관리할 수 있는 회원정보변경 페이지를 열람할 수 있으며, 해당 페이지에서 언제든지 본인의
					개인정보를 열람하고 수정할 수 있습니다. 단, 서비스 관리를 통하여 반드시 필요한 성명, 회원ID는 수정 할 수
					없습니다.<br> <br> ③ 회원은 이용신청 시 기재한 사항이 변경되었을 경우 마이페이지 메뉴 혹은
					기타 해당페이지로 링크된 메뉴를 통하여 수정을 해야하며 회원정보의 미변경으로 인하여 발생되는 문제의 책임은 회원에게
					있습니다.<br> <br> ④ 당사이트는 다음 각 호에 해당하는 경우에는 이용자와 합의하여 이용자
					ID를 변경할 수 있습니다.<br> 1. 이용자 ID가 이용자의 전화번호 또는 이메일주소로 등록되어 사생활
					침해가 우려되는 경우<br> 2. 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우<br> 3. 기타
					합리적인 사유가 있는 경우<br> <br> <b style="color: #000;">제3장
						개인정보의 보호</b><br> <br> <b>제9조(개인정보 보호)</b><br> ① 별도 명시한
					‘개인정보 처리방침’에 의거합니다.<br> <br> <b style="color: #000;">제4장
						계약당사자의 권리 및 의무</b><br> <br> <b>제10조(당사이트의 의무와 권리)</b><br>
					① 당사이트는 이용자으로 부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다. 다만, 즉시
					처리가 곤란한 경우는 이용자에게 그 사유와 처리일정을 통보하여야 합니다.<br> ② 당사이트는 개인정보 보호와
					관련하여 개인정보 처리방침에 제시된 내용을 지킵니다.<br> ③ 당사이트는 계속적이고 안정적인 서비스의 제공을
					위하여 설비에 장애가 생기거나 멸실된 때에는 지체 없이 이를 수리 또는 복구합니다. 다만, 천재지변, 비상사태 또는
					그밖에 부득이한 경우에는 그 서비스를 일시중단하거나 중지할 수 있습니다.<br> ④ 당사이트는 이용계약의 체결,
					계약사항의 변경 및 해지 등 이용자와의 계약관련 절차 및 내용 등에 있어 이용자에게 편의를 제공하도록 노력합니다.<br>
					⑤ 당사이트는 개인정보 처리방침에 따라 이용자의 개인정보를 취급함에 있어서 안정성 확보에 필요한 기술적 및 관리적 대책을
					강구하여야 합니다.<br> <br> <b>제11조(이용자의 의무)</b><br> ① 이용자는
					주소 및 연락처 등 이용계약사항이 변경된 경우에는 이를 당사이트에 즉시 알려야합니다.<br> ② 회원은 이
					약관에서 규정하는 사항 및 당사이트에서 공지하는 서비스 이용과 주의사항을 준수하여야 합니다.<br> ③ 이용자는
					공공의 안녕질서 또는 미풍양속을 해하는 다음 각 호의 통신을 하여서는 아니됩니다.<br> 1. 범죄행위를
					목적으로 하거나 범죄행위를 교사하는 내용<br> 2. 반국가적 행위의 수행을 목적으로 하는 내용<br>
					3. 선량한 풍속, 기타 사회질서를 해하는 내용<br> ④ 이용자는 이 약관 및 전기통신 관련법령 등을
					준수하여야 하며, 기타 당사이트의 업무수행에 현저한 지장을 초래하는 행위를 하여서는 아니됩니다.<br> ⑤
					회원은 사이트 내에서 당사이트의 허가 없이 특정한 제품의 광고, 판매 등의 영업활동을 할 수 없으며, 영업활동 혹은 이에
					대한 동조 행위 등으로 인하여 발생한 결과에 대해서 당사이트는 책임을 지지 않습니다.<br> ⑥ 회원은
					당사이트의 사전 승낙 없이 서비스의 전부 또는 일부 내용 및 기능을 전용할 수 없습니다.<br> ⑦ 회원은
					서비스 이용 시 다음의 행위를 하지 않아야 합니다.<br> 1. 서비스를 이용하여 얻은 정보를 본인의 개인적인
					이용 외에 당사이트의 사전 승낙없이 복사, 가공, 변형, 번역, 공연, 방송, 전시, 배포, 출판 및 2차적 저작권 등을
					통하여 복제 등에 사용하거나 제 2자에게 제공<br> 2. 당사이트 또는 제 3자의 저작권을 비롯한 기타 권리를
					침해하는 행위<br> 3. 타인의 명예를 훼손하거나 불이익을 주는 행위<br> 4. 정부기관 혹은
					공공기관으로부터 시정요구를 받는 행위<br> 5. 다른 회원의 이용자 ID와 비밀번호 등을 도용하거나 부정하게
					사용하는 행위<br> 6. 공공질서 및 미풍양속에 위배되는 저속, 음란한 내용의 정보, 문장, 도형 등을 전송,
					게시, 메일, 또는 기타의 방법으로 타인에게 유포하는 행위<br> 7. 타인의 특허, 상표, 영업비밀, 저작권,
					기타 지적 재산권을 침해하는 내용을 게시, 메일, 또는 기타의 방법으로 타인에게 유포하는 행위<br> 8.
					당사이트의 승인을 받지 않고 다른 사용자의 개인정보를 수집 또는 저장하는 행위<br> 9. 기타 관계법령에
					위배되는 행위<br> <br> <b style="color: #000;">제5장 서비스의
						제한ㆍ정지 등</b><br> <br> <b>제12조(이용제한 등)</b><br> ① 당사이트는
					이용자가 다음 각 호에 해당하는 경우에는 게시물을 삭제하거나 서비스의 전부 또는 일부의 이용을 제한할 수 있습니다.<br>
					1. 제11조 각 조항의 규정에 의한 이용자의 의무를 이행하지 아니한 경우<br> 2. 서비스의 안정적 운영을
					방해할 목적으로 다량의 정보를 전송하거나 수신자의 의사에 반하여 광고성 정보를 지속적으로 전송하는 경우<br>
					3. 정보통신설비의 오동작이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우<br>
					4. 당사이트, 다른 이용자 또는 제3자의 지적재산권을 침해하는 경우<br> 5. 정보통신윤리위원회의 시정요구가
					있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은 경우<br> 6. 타인의 개인정보, ID,
					비밀번호를 도용하는 경우<br> 7. 서비스 정보를 이용하여 얻은 정보를 당사이트의 사전 승낙 없이 복제 또는
					유통시키거나 상업적으로 이용하는 경우<br> 8. 전기통신 관련법령 등에 위배되는 경우<br> 9. 본
					약관을 포함하여 기타 당사이트가 정한 이용조건에 위반한 경우<br> <br> ② 제1항의 규정에 의하여
					이용자의 이용을 제한하는 경우에는 게시물 삭제 또는 제한의 종류 및 기간 등 구체적인 기준은 별도로 정하는 바에
					의합니다.<br> ③ 당사이트는 제1항 제2호 내지 제5호의 규정에 의한 사유로 인해 이용제한을 받은 이용자의
					ID, 성명 및 제한의 사유 등을 정보통신윤리위원회의 불량이용자 DB 등을 통해 다른 PC통신ㆍ인터넷사업자에게 열람시킬
					수 있습니다.<br> <br> <b>제13조(이용제한 및 해제 절차)</b><br> ①
					당사이트는 제12조의 규정에 의하여 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 이용정지 7일전까지
					전자우편, 서면 또는 전화 등의 방법에 의하여 해당 이용자 또는 대리인에게 통지합니다. 다만, 긴급하게 이용을 정지할
					필요가 있다고 인정하는 경우에는 그러하지 아니합니다.<br> ② 제1항의 규정에 의하여 이용정지의 통지를 받은
					이용자 또는 그 대리인은 그 이용정지의 통지에 대하여 이의가 있을 때에는 이의신청을 할 수 있습니다.<br> ③
					당사이트는 제2항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용정지를 일시 연기할 수 있으며, 그 결과를
					이용자 또는 그 대리인에게 통지합니다.<br> ④ 당사이트는 이용정지 기간 중에 그 이용정지 사유가 해소된 것이
					확인된 경우에는 이용정지조치를 즉시 해제합니다.<br> <br> <b
						style="color: #000;">제6장 계약사항 변경ㆍ해지</b><br> <br> <b>제14조(계약사항의
						변경)</b><br> ① 회원은 이용신청시 기재한 사항이 변경되었을 경우 센터가 정한 별도의 이용방법으로 정해진 양식
					및 방법에 의하여 수정하여야 합니다.<br> <br> <b>제15조(해지)</b><br> ①
					이용자가 이용계약을 해지하고자 하는 때에는 본인이 직접 마이페이지메뉴의 회원정보변경을 통해 신청하여야 합니다.<br>
					② 당사이트는 제1항의 규정에 의하여 해지신청이 접수되면 7일 이내에 처리하여 서비스의 이용을 제한합니다.<br>
					③ 당사이트는 이용자가 다음 각 호에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용자에게
					통지하여 의견 진술할 기회를 주어야 합니다.<br> 1. 이용자가 이용제한규정을 위반하거나 그 이용제한 기간
					내에 제한사유를 해소하지 않는 경우<br> 2. 정보통신윤리위원회가 이용해지를 요구한 경우<br> 3.
					이용자가 정당한 사유 없이 의견진술에 응하지 아니한 경우<br> 4. 타인 명의로 신청을 하였거나 신청서 내용의
					허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우<br> ④ 당사이트는 제2항의 규정에 의하여 해지된
					이용자에 대하여는 별도로 정한 기간동안 가입을 제한할 수 있습니다.<br> <br> <b
						style="color: #000;">제7장 서비스 이용</b><br> <br> <b>제16조
						(기본 서비스)</b><br> ① 당사이트의 서비스 이용은 기본적으로 무료입니다. 단 당사이트가 정한 별도의 유료
					서비스와 아이템에 대해서는 이용이 제한됩니다.<br> ② 유료 서비스 이용 및 결제에 관한 사항은 당사이트가
					별도로 정한 유료서비스 약관에 따릅니다.<br> <br> <b>제17조 (유료서비스 이용)</b><br>
					① 당사이트에서 제공하는 서비스 또는 제휴서비스 중 일부는 유료로 구매하거나 이용하실 수 있습니다.<br> <br>
					<b>제18조 (회원ID의 관리)</b><br> ① 이용자 ID와 비밀번호에 관한 모든 관리책임은 회원에게
					있습니다.<br> ② 자신의 ID가 타인에 의해 무단 이용되는 경우 회원은 반드시 당사이트에 사실을 통보해야
					합니다.<br> ③ 회원의 ID는 당사이트의 사전 동의 없이 변경할 수 없습니다.<br> ④ 회원이
					등록한 회원ID 및 비밀번호에 의해 발생되는 사용상의 과실 또는 제 3자에 의한 부정사용 등에 대한 모든 책임은 해당
					이용자에게 있습니다. 다만, 당사이트의 고의 또는 중과 실이 있는 경우에는 그러하지 아니합니다.<br> ⑤
					이용자는 당사 서비스의 사용 종료 시 마다 정확히 접속을 종료하도록 해야 하며 정확히 종류하지 아니함으로써 제3자가
					귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 당사는 책임을 부담하지 아니합니다.<br>
					<br> <b>제19조 (정보의 제공)</b><br> ① 당사이트는 회원이 서비스 이용 중 필요가
					있다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 회원에게 제공할 수 있습니다.<br> ②
					당사이트는 회원가입 시 당사이트에서 제공하는 정보를 수신하겠다는 회원의 동의하에 정기적으로 관련 이메일을 가입 시 기재한
					메일 주소로 발송합니다. 단, 구독을 중지하고 싶을 경우에는 언제든지 당사이트 '마이페이지 메뉴의 회원정보변경'에서
					구독을 해지할 수 있습니다.<br> <br> <b>제20조(회원의 게시물)</b><br> ①
					회원이 게시한 게시물의 모든 권리와 책임은 이를 게시한 회원에게 있으며 당사이트는 이용자가 게재한 정보의 정확성 및
					신뢰도 등의 내용에 대해서는 책임을 지지 않습니다.<br> ② 당사이트는 회원이 게시하거나 등록하는 서비스 내의
					내용물이 다음 각 호에 해당한다고 판단되는 경우에 사정 통지 없이 삭제할 수 있습니다.<br> 1. 다른 회원
					또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우<br> 2. 공공질서 및 미풍양속에 위반되는
					내용인 경우<br> 3. 범죄적 행위에 결부된다고 인정되는 내용일 경우<br> 4. 당사이트의 저작권,
					제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br> 5. 당사이트에서 규정한 게시기간을 초과한 경우<br>
					6. 당사이트에서 제공하지 않는 상업행위 및 금전 및 물품 취득을 목적으로 하는 내용<br> 7. 게시판의
					성격에 부합하지 않는 게시물의 경우<br> 8. 기타 관계법령 및 당사이트의 세부 지침 등에 위반된다고 판단되는
					경우<br> <br> <b>제21조(게시물의 저작권)</b><br> 서비스에 게재된 모든
					자료(회원간 전달 포함)에 대한 권리는 다음과 같습니다.<br> 1. 게시물에 대한 권리와 책임은 게시자에게
					있으며 당사이트는 게시자의 동의 없이는 이를 서비스내 게재 이외에 영리적 목적으로 사용할 수 없습니다. 단, 비영리적인
					경우나 혹은 별도의 계약이 있는 경우 당사이트는 서비스내의 게재권을 갖습니다.<br> 2. 회원은 서비스를
					이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br> <br>
					<b>제22조(서비스 이용시간)</b><br> ① 서비스의 이용은 당사이트의 업무상 또는 기술상 특별한 지장이
					없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기점검, 긴급조치, 예기치 못한 천재지변, 사고 및
					당사이트가 서비스 점검 및 조치를 필요로 하는 시간은 그러하지 않습니다.<br> ② 당사이트는 서비스를
					일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전공지를 통해 알립니다.<br>
					<br> <b>제23조(서비스 제공의 중지 등)</b><br> ① 당사이트는 다음 각 호에 해당하는
					경우 서비스 제공을 중지할 수 있습니다.<br> 1. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우<br>
					2. 전기통신사업법에 규정된 기간 통신사업자가 전기통신 서비스를 중지했을 경우<br> 3. 기타 불가항력적
					사유가 있는 경우<br> ② 당사이트는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로
					정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.<br> ③
					당사이트는 제1항 및 2항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한 기간 등을 지체
					없이 회원에게 알려야 합니다.<br> <br> <b style="color: #000;">제8장
						손해배상 등</b><br> <br> <b>제24조(손해배상)</b><br> ① 당사이트는 무료로
					제공되는 서비스 이용과 관련하여 당사이트가 고의로 행한 범죄행위를 제외하고 회원에게 발생한 어떠한 손해에 관하여도 책임을
					지지 않습니다.<br> ② 회원이 서비스를 이용함에 있어 행한 불법행위로 인하여 당사이트가 당해 회원이외에
					제3자로부터 손해배상청구, 소송을 비롯한 각종의 이의제기를 받는 경우 당해 회원은 당사이트의 면책을 위해 노력해야 하며,
					만일 당사이트가 면책되지 못한 경우는 당해 회원은 이로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.<br>
					③ 회원이 당사이트가 금하고 있는 행위를 행함으로써 당사이트에 물질적, 이미지적 손해를 입혔을 경우, 당사이트는 해당
					회원의 이용권한을 박탈함과 동시에 손해배상 등 법적 책임을 물을 수 있습니다.<br> <br> <b>제25조(면책조항)</b>
					① 당사이트는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이
					면제됩니다.<br> ② 당사이트는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br>
					③ 당사이트는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여
					책임을 지지 않습니다.<br> ④ 당사이트는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등
					내용에 관하여는 책임을 지지 않습니다.<br> ⑤ 당사이트는 서비스 이용과 관련하여 가입자에게 발생한 손해
					가운데 가입자의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.<br> ⑥ 당사이트는 이용자 상호간
					또는 이용자와 제3자 상호간에 서비스를 매개로 하여 물품거래 등을 한 경우에는 책임이 면제됩니다.<br> ⑦
					회원ID와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 관한 책임은 지지
					않습니다.<br> <br> <b>제26조(관할법원)</b><br> 서비스 이용으로 발생한
					분쟁에 대해 소송이 제기될 경우 당사이트의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.<br> <br>
					<b style="color: #000;">부칙</b><br> (시행일) 이 약관은 2020년 1월 1일부터
					시행합니다.<br> (경과조치) 이 약관 시행 전의 이용약관에 따라 가입한 고객은 변경된 시행일로부터 이 약관의
					적용을 받습니다. <br> <br>
				</div>

				<div class="assent" align="right" style="font-size: 15px">
					<em>위 내용에 동의 합니까? &nbsp;</em> <label><input type="radio"
						class="ay" name="agreeA" id="agreeA" value="Y"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 0px;"></label>
					<label for="agreeA1">동의합니다.</label> <label><input
						type="radio" class="agreeAN" name="agreeA" id="agreeAN" value="N"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 10px;"></label>
					<label for="agreeA2">동의하지 않습니다.</label>
				</div>

				<br>
				<br>

				<h5>개인정보 처리방침</h5>
				<div class="policy"
					style="font-size: 14px; line-height: 23px; margin: 20px; height: 200px; overflow: scroll;">
					<b>제 1 조 개인정보의 수집 및 이용목적 </b><br> KH 요정의 집 어린이집 홈페이지(이하
					"당사이트"라 합니다)는 회원님 개인의 정보를 수집하는 목적은 건전하고 최적의 서비스를 제공해드리기 위한 것이며,
					이용목적은 당사이트 개선방향 모색과 비밀번호 분실 시 조치 등에 이용됩니다. <br> <br> <b>제
						2 조 수집하는 개인정보 항목 및 수집방법 </b><br> 당사이트는 최초 회원가입을 하실 때 서비스 제공을 위해
					가장 필수적인 개인정보를 받고 있습니다. 회원가입 시에 받는 정보는 회원님의 이름, 아이디와 패스워드, 성별, 생년월일,
					직업, 집주소 또는 회사주소, 연락처 기타 회원님의 권익 증진을 위해 당사이트가 제공할 필요가 있다고 판단되는 정보를
					서비스하기 위한 필요한 항목입니다. 기입하신 정보는 서비스 제공이나 회원님께 사전에 밝힌 목적 이외의 다른 어떠한
					목적으로도 사용되지 않음을 알려드립니다. <br> <br> <b>제 3 조 개인정보의 보유 및
						폐기 </b><br> 회원님이 당사이트의 회원으로서 서비스를 받는 동안 회원님의 개인정보는 당사이트에서 계속 보유하며
					서비스 제공을 위해 이용하게 됩니다. 다만 당사이트 회원이 아래의 '제 7 조 자신의 개인정보 열람, 정정 및 삭제'에서
					설명한 절차에 따라 ID를 삭제하거나 가입해지를 요청한 경우와 회원님께 사전에 알려드린 개인정보를 제공받은 목적이 달성된
					경우에 수집된 개인의 정보는 재생할 수 없는 방법에 의하여 하드디스크에서 완전히 삭제되며 어떠한 용도로도 열람 또는
					이용할 수 없도록 처리됩니다.<br> <br> <b>제 4 조 개인정보의 제공 및 공유 </b><br>
					원칙적으로 당사이트 홈페이지는 회원님의 개인정보를 타인 또는 타기업·기관에 공개하지 않습니다. 다만 「개인정보 보호법
					제17조」에 근거하여 제공될 수 있습니다. <br> <br> <b>제 5 조
						쿠키(cookie)의 운용 및 활용 </b><br> 회원님 개개인에게 개인화된 서비스를 제공하기 위해서 당사이트
					홈페이지는 회원님의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데
					이용되는 서버가 사용자의 브라우저에게 보내는 조그마한 데이터 꾸러미로 회원님 컴퓨터의 하드디스크에 저장됩니다. 쿠키는
					회원님의 팝업 보기 희망 여부를 파악하는데만 이용됩니다.<br> <br> <b>제 6 조
						개인정보보호를 위한 기술적·관리적 조치 </b><br> 회원님의 개인정보는 비밀번호에 의해 보호되고 있습니다. 회원님
					계정의 비밀번호는 오직 본인만이 알 수 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만
					가능합니다. 따라서 회원님의 비밀번호는 누구에게도 알려주면 안됩니다. 또한 작업을 마치신 후에는
					로그아웃(log-out)하시고 웹브라우저를 종료하는 것이 바람직합니다. 특히 다른 사람과 컴퓨터를 공유하여 사용하거나
					공공장소에서 이용한 경우 개인정보가 다른 사람에게 알려지는 것을 막기 위해서 이와 같은 절차가 더욱 필요하다고
					하겠습니다. 당사이트는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다.
					백신프로그램은 주기적으로 업데이트 되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가
					훼손되는 것을 방지하고 있습니다. 해킹 등에 의해 회원의 개인정보가 유출되는 것을 막기 위해 현재 외부로부터의 침입을
					차단하는 장치를 이용하여 외부로부터의 공격, 해킹 등을 막고 있으며, 각 서버마다 침입탐지시스템을 설치하여 24시간
					침입을 감시하고 있습니다. 기타 회원 개인정보의 훼손에 대비해서 시스템과 데이터를 백업하여 만약의 사태에 대비하고
					있습니다. <br> <br> <b>제 7 조 자신의 개인정보 열람, 정정 및 삭제 </b><br>
					회원님은 언제든지 등록되어 있는 회원님의 개인정보를 열람하거나 정정하실 수 있으며, 아이디(ID) 삭제를 하실 수
					있습니다. 회원님 개인 정보의 열람, 정정 및 삭제는 당사이트 홈페이지 환경설정의 개인정보관리에서 하실 수 있습니다.
					개인정보와 관련하여 불만이나 의견이 있으신 분은 개인정보 관리담당자에게 메일(gncare@hanmail.net) 로
					의견을 주시면 접수 시 조치하고 처리결과를 통보해 드리겠습니다. <br> <br> <b>제 8
						조 어린이의 개인정보보호 </b><br> 만14세 미만의 어린이에 대한 개인정보 수집·이용·제공 시에는 「개인정보
					보호법」제22조에 의거 법정대리인의 동의가 필요하며, 이 경우 동의를 얻기 위하여 필요한 법정대리인의 성명 등 최소한의
					정보를 요구할 수 있습니다. 당사이트 홈페이지는 14세 미만 어린이의 정보를 다른 사람 또는 업체와 공유하지 않으며,
					만14세 미만의 어린이에게는 광고메일을 발송하지 않습니다. <br> <br> <b>제 9 조
						비밀번호 보안 </b><br> 회원님 계정의 비밀번호에 대한 보안을 유지할 책임은 회원님 자신에게 있습니다. 당사이트
					홈페이지에서 메일 또는 기타 방법으로 회원님께 비밀번호를 질문하는 경우는 절대 없으므로 어떠한 경우에도 비밀번호를
					알려주지 마십시오. 로그온(log-on)한 상태에서는 주위의 다른 사람에게 개인정보가 유출되지 않도록 특별히 주의를
					기울이시기 바랍니다. <br> <br> <b>제 10 조 개인정보 보호책임자 </b><br>
					당사이트 홈페이지 이용 중 개인정보의 유출가능성 등 정보주체에 침해될 우려가 있는 사실을 발견하였을 경우는 다음의
					연락처로 알려주시기 바랍니다. <br> <br> <b>개인정보 보호책임자</b><br> -
					이메일 : gncare@hanmail.net<br> - 전화번호 : 02-546-1735~7<br> -
					FAX : 02-511-1728<br> - 주소 : 서울특별시 강남구 삼성로72길 7(대치동) <br>
					<br> ※ 개인정보 처리방침 2020년 1월 1일부터 시행합니다. <br> <br>
				</div>

				<div class="assent" align="right" style="font-size: 15px">
					<em>위 내용에 동의 합니까? &nbsp;</em> <label><input type="radio"
						class="ay" name="agreeB" id="agreeB" value="Y"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 0px;"></label>
					<label for="agreeB1">동의합니다.</label> <label><input
						type="radio" class="agreeBN" name="agreeB" id="agreeBN" value="N"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 10px;"></label>
					<label for="agreeB2">동의하지 않습니다.</label>
				</div>
				<br> <br>

				<h5>수집한 개인정보의 제3자 제공 및 취급 위탁 동의</h5>
				<div class="policy"
					style="font-size: 14px; line-height: 23px; margin: 20px; height: 200px; overflow: scroll;">
					KH 요정의 집 어린이집 홈페이지에서는 아래의 경우 제3자 제공을 하고 있습니다.
					<table class="board-list" style="margin-top: 15px;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 30%;">
							<col style="width: *;">
						</colgroup>
						<tbody>
							<tr style="height: 70px;">
								<th>제공받는 자</th>
								<td>(주)유니웹스</td>
							</tr>
							<tr style="height: 70px;">
								<th>제공받는 자의<br> 개인정보 이용 목적
								</th>
								<td>시스템 운영 및 유지보수</td>
							</tr>
							<tr style="height: 70px;">
								<th>제공하는<br> 개인정보의 항목
								</th>
								<td>아이디, 성명, 비밀번호, 휴대폰번호, 이메일, 주소,<br> 이메일수신여부,
									SMS수신여부, 개인식별번호
								</td>
							</tr>
							<tr style="height: 70px;">
								<th>제공받는 자의 개인정보<br> 보유 및 이용 기간
								</th>
								<td>KH 요정의 집 어린이집 홈페이지 회원탈퇴시까지 보유<br>* 회원가입 후 2년마다
									개인정보 보유 동의 여부 확인
								</td>
							</tr>
						</tbody>
					</table>
					<br> 단, 다음에 해당하는 경우에는 예외로 제공 할 수 있습니다. [관련근거: 개인정보보호법 제18조
					제2항] <br> <br> 1. 정보주체로부터 별도의 동의를 받은 경우<br> 2. 다른
					법률에 특별한 규정이 있는 경우<br> 3. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나
					주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을
					위하여 필요하다고 인정되는 경우<br> 4. 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정
					개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우<br> 5. 개인정보를 목적 외의 용도로 이용하거나 이를
					제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관업무를 수행할 수 없는 경우로서 보호위원회의 심의ㆍ의결을 거친 경우<br>
					6. 조약, 그 밖의 국제협정의 이행을 위하여 외국정부 또는 국제기구에 제공하기 위하여 필요한 경우<br> 7.
					범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우<br> 8. 법원의 재판업무 수행을 위하여 필요한 경우<br>
					9. 형(刑) 및 감호, 보호처분의 집행을 위하여 필요한 경우<br> <br> 정보주체는 개인정보의
					제3자 제공에 대한 동의를 거부할 수 있으며, 동의 거부시 당사이트 에 회원가입이 되지 않으며,
					강남구육아포털ㆍ강남구육아종합지원센터 홈페이지에서 제공하는 서비스를 이용할 수 없습니다. <br>
					<br>
				</div>
				<div class="assent" align="right" style="font-size: 15px">
					<em>위 내용에 동의 합니까? &nbsp; </em> <label><input type="radio"
						class="ay" name="agreeC" id="agreeC" value="Y"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 0px;"></label>
					<label for="agreeC1">동의합니다.</label> <label><input
						type="radio" class="agreeCN" name="agreeC" id="agreeCN" value="N"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 10px;"></label>
					<label for="agreeC2">동의하지 않습니다.</label>

				</div>
				<br>
				<br>
				<h5>개인정보의 보유 및 이용기간</h5>
				<div class="policy"
					style="font-size: 14px; line-height: 23px; margin: 20px; height: 100px; overflow: scroll;">
					KH 요정의 집 어린이집 홈페이지에서 회원가입으로 수집된 개인정보는 회원탈퇴시까지 보유하며, 회원가입 후 2년 동안
					재동의 없는 회원의 경우 개인정보보호를 위해 안내 메일 또는 공지사항 발표 후 1주일간의 통지 기간을 거처 서비스 사용을
					중지할 수 있습니다.</div>
				<div class="assent" align="right" style="font-size: 15px">
					<em>위 내용에 동의 합니까? &nbsp;</em> <label><input type="radio"
						class="ay" name="agreeD" id="agreeD" value="Y"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 0px;"></label>
					<label for="agreeD1">동의합니다.</label> <label><input
						type="radio" class="agreeDN" name="agreeD" id="agreeDN" value="N"
						style="width: 20px; height: 20px; margin-top: 2px; margin-left: 10px;"></label>
					<label for="agreeD2">동의하지 않습니다.</label>
				</div>
				<br>
				<br>
				<div class="assent2" align="center">
					<input type="checkbox" class="checkbox01 ml agreeAll"
						name="agreeAll" id="agreeAll"><label for="agreeAll"
						style="margin-top: 20px;">&nbsp;&nbsp;위 전체 내용에 동의 합니다.</label>

				</div>
				<div class="assent2"
					style="height: auto; background: #fff; margin-top: 50px; margin-bottom: 50px;">

					<div class="d-flex justify-content-center"
						style="background-color: #f5f6f7;">
						<button class="btn"
							style="background: #002c5f; color: white; width: 150px;" onclick="location='<%=request.getContextPath()%>/index.jsp'">
							취소</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn"
							style="background: #002c5f; color: white; width: 150px; height: 50px;"
							onclick="submit()">다음</button>
					</div>
				</div>
			</div>
		</div>
		<hr>
		
		<script>
			function submit(){
				if($('#agreeA').prop("checked") == true && $('#agreeB').prop("checked") == true && $('#agreeC').prop("checked") == true &&
					$('#agreeD').prop("checked") == true) {
					location.href='/semi/views/homepage/sign.jsp';
				}else{
					alert("가입약관에 모두 동의해주세요.");
				}
				
			}
		
		 $(function (){
			$('#agreeAll').click(function(){
				$('.ay').prop("checked",this.checked);
				
			});
		 });
		
		</script>
		
		
		<%@ include file="common/footer2.jsp"%>
		
</body>
</html>