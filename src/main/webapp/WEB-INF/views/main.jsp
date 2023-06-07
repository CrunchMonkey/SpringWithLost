<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <style>
  ul {
    	list-style: none;
    	background-color: #F7D99D;
    	padding: 10px;
    }
   [class ^="col-md"] {
   	padding: 0px;
   	margin: 0px;
   }
    .sortableDiv{
    	padding: 15px 15px 15px 15px;
    	background-color: #1C1C20;
    	height: 100%;
    }
    .row{
    	margin: 0px;
    }
    .list-group-item {
    	line-height: 10px;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  
  $( 
	function() {
		var startUlId;
		var startLiHtml;
		var endSortTableId;
		
		var destroyerSynergyArr = [];
		var gunlancerSynergyArr = [];
		var json = [
			{'jobId' : 'gunlancer', 'job' : '워로드', 'skill' : '배쉬', 'kind' : '상시', 'effect' : '공격에 적중된 적들의 모든 방어력을 10.0초간 12.0% 감소시킨다.'},
			{'jobId' : 'gunlancer', 'job' : '워로드', 'skill' : '증오의 함성', 'kind' : '순간', 'effect' : '12.0초간 약점을 노출시켜 대상이 자신 및 파티원에게 받는 피해를 4.0% 증가시킨다.헤드 어택 및 백 어택의 경우, 받는 피해 효과가 추가로 5.0% 증가한다..'},
			]; //추후 데이터베이스로 관리 예정
		
		//sortTable
		$("ul.droptrue").sortable({
			remove: function( event, ui ) {
				startUlId = this.id; //출발테이블의 ui의 ID
				startLiHtml = ui.item[0].outerHTML; //움직인 li html
			},
			receive: function(event, ui) {
				if($(this).hasClass("classSortTable") && $("#" + startUlId).hasClass("classSortTable")) { //클래스 -> 클래스
					$("#" + startUlId).sortable("cancel"); //취소
				} else if($("#" + startUlId).hasClass("classSortTable") && $(this).hasClass("partySortTable")){ //클래스 -> 파티
					$("#" + startUlId).append(startLiHtml); //클래스 채워주기
					
					var count = 0;
					var currentChildren = $("#" + this.id).children("li");
					
					for(var i=0; i<currentChildren.length; i++) { //파티에 중복직업이 있는지 검사
						if(currentChildren[i].id == ui.item[0].id) {
							count++;
						}
						if(count == 2) { //클래스 두개이므로 시너지 업데이트 할 필요없음
							return;
						}
					}
					
					if(this.id == "firstPartysortable") { //첫번째파티 상시시너지
						for(var i=0; i<json.length; i++) {
							if(json[i].jobId == ui.item[0].id && json[i].kind == "상시") {
								$("#firstPartyConstantSynergy").append(""
									+ "<li class=\"list-group-item d-flex justify-content-between align-items-center " + json[i].jobId +"\">"
									    + "<span class=\"badge\" style=\"background-color: red\">용맹의포효</span>"
									    + "<span class=\"badge\" style=\"background-color: blue\">" + json[i].job + "</span>"
									    + "<span class=\"badge\" style=\"background-color: green\">" + json[i].kind + "</span>"
									    + json[i].effect
									+ "</li>"
									+ ""); //상시시너지
							} else if(json[i].jobId == ui.item[0].id && json[i].kind == "순간") { //첫번째파티 순간시너지
								$("#firstPartyMomentSynergy").append(""
									+ "<li class=\"list-group-item d-flex justify-content-between align-items-center " + json[i].jobId +"\">"
									    + "<span class=\"badge\" style=\"background-color: red\">용맹의포효</span>"
									    + "<span class=\"badge\" style=\"background-color: blue\">" + json[i].job + "</span>"
									    + "<span class=\"badge\" style=\"background-color: green\">" + json[i].kind + "</span>"
									    + json[i].effect
									+ "</li>"
									+ ""); //순간시너지
							}
						}		
					} else if(this.id == "secondPartysortable") { //두번째파티 상시시너지
						for(var i=0; i<json.length; i++) {
							if(json[i].jobId == ui.item[0].id && json[i].kind == "상시") {
								$("#secondPartyConstantSynergy").append(""
									+ "<li class=\"list-group-item d-flex justify-content-between align-items-center " + json[i].jobId +"\">"
									    + "<span class=\"badge\" style=\"background-color: red\">용맹의포효</span>"
									    + "<span class=\"badge\" style=\"background-color: blue\">" + json[i].job + "</span>"
									    + "<span class=\"badge\" style=\"background-color: green\">" + json[i].kind + "</span>"
									    + json[i].effect
									+ "</li>"
									+ ""); //상시시너지
							} else if(json[i].jobId == ui.item[0].id && json[i].kind == "순간") { //두번째파티 순간시너지
								$("#secondPartyMomentSynergy").append(""
									+ "<li class=\"list-group-item d-flex justify-content-between align-items-center " + json[i].jobId +"\">"
									    + "<span class=\"badge\" style=\"background-color: red\">용맹의포효</span>"
									    + "<span class=\"badge\" style=\"background-color: blue\">" + json[i].job + "</span>"
									    + "<span class=\"badge\" style=\"background-color: green\">" + json[i].kind + "</span>"
									    + json[i].effect
									+ "</li>"
									+ ""); //순간시너지
							}
						}	
					}
				} else if($("#" + startUlId).hasClass("partySortTable") && $(this).hasClass("classSortTable")){ //파티 -> 클래스
					$("#" + this.id + " #" + ui.item[0].id).first().remove(); //클래스 삭제
					
					var count = 0;
					var currentChildren = $("#" + startUlId).children("li");
					
					for(var i=0; i<currentChildren.length; i++) { //파티에 중복직업이 있는지 검사
						if(currentChildren[i].id == ui.item[0].id) {
							count++;
						}
						if(count == 1) { //클래스 남아있으므로 시너지 삭제 불필요
							return;
						}
					}
					
					if(startUlId == "firstPartysortable") {
						$("#firstPartyConstantSynergy").children("li." + ui.item[0].id).remove();
						$("#firstPartyMomentSynergy").children("li." + ui.item[0].id).remove();
					} else if(startUlId == "secondPartysortable") {
						$("#secondPartyConstantSynergy").children("li." + ui.item[0].id).remove();
						$("#secondPartyMomentSynergy").children("li." + ui.item[0].id).remove();
					}
				
					
					
				}	
			},
			connectWith: "ul"
		});
		
		
		
		
	  } 
	);
  </script>
</head>
<body>
	<!-- 전체화면 -->
	<div class="container" style="width: 1620px; height: 1280px; margin: 0px">
		<div class="row" style="width: 100%; height: 100%">
			<div class="col-md-9" style="height: 45%;">
				<div class="container" style="width: 100%; height: 100%; padding: 0px">
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">전사</font></a>
							  </div>
							</nav>
							<ul id="defaultWarrior" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li id="destroyer" class="list-group-item defaultWarrior" style="">디스트로이어</li>
								<li id="gunlancer" class="list-group-item defaultWarrior" style="">워로드</li>
								<li id="berserker" class="list-group-item defaultWarrior" style="">버서커</li>
								<li id="paladin" class="list-group-item defaultWarrior" style="">홀리나이트</li>
								<li id="Slayer" class="list-group-item defaultWarrior" style="">슬레이어</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">무도가</font></a>
							  </div>
							</nav>
							<ul id="defaultMartialArtist" class="list-group classSortTable droptrue ui-sortable default"  style="padding-left: 10px">
								<li class="list-group-item" style="">스트라이커</li>
								<li class="list-group-item" style="">배틀마스터</li>
								<li class="list-group-item" style="">인파이터</li>
								<li class="list-group-item" style="">기공사</li>
								<li class="list-group-item" style="">창술사</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">헌터</font></a>
							  </div>
							</nav>
							<ul id="defaultGunner" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li class="list-group-item" style="">데빌헌터</li>
								<li class="list-group-item" style="">블래스터</li>
								<li class="list-group-item" style="">호크아이</li>
								<li class="list-group-item" style="">스카우터</li>
								<li class="list-group-item" style="">건슬링어</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">마법사</font></a>
							  </div>
							</nav>
							<ul id="defaultMage" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li class="list-group-item" style="">바드</li>
								<li class="list-group-item" style="">서머너</li>
								<li class="list-group-item" style="">아르카나</li>
								<li class="list-group-item" style="">소서리스</li>
							</ul>
						</div>
					</div>
					
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">암살자</font></a>
							  </div>
							</nav>
							<ul id="defaultAssassin" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li class="list-group-item" style="">데모닉</li>
								<li class="list-group-item" style="">블레이드</li>
								<li class="list-group-item" style="">리퍼</li>
								<li class="list-group-item" style="">소울이터</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">스폐셜리스트</font></a>
							  </div>
							</nav>
							<ul id="defaultSpecialist" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li class="list-group-item" style="">도화가</li>
								<li class="list-group-item" style="">기상술사</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">미정</font></a>
							  </div>
							</nav>
							<ul id="" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li class="list-group-item" style="">금강선</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3" style="height: 50%;">
						<div class="col-md-12 sortableDiv">
							<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
							  <div class="container-fluid" style="border: solid #F7D99D 1px">
							    <a class="navbar-brand" href="#"><font color="#F7D99D">미정</font></a>
							  </div>
							</nav>
							<ul id="" class="list-group classSortTable droptrue  ui-sortable"  style="padding-left: 10px">
								<li class="list-group-item" style="">금강선</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 유저검색창 -->
			<div class="col-md-3" style="height: 45%; background-color: orange">
			</div>
			
			<!-- 1파티 -->
			<div class="col-md-2" style="height: 25%;">
				<div class="col-md-12 sortableDiv">
					<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
					  <div class="container-fluid" style="border: solid #F7D99D 1px">
					    <a class="navbar-brand" href="#"><font color="#F7D99D">1파티</font></a>
					  </div>
					</nav>
					<ul id="firstPartysortable" class="list-group partySortTable droptrue ui-sortable"  style="padding-left: 10px">
						<li class="list-group-item" style="">Dog</li>
						<li class="list-group-item" style="">Dog</li>
						<li class="list-group-item" style="">Dog</li>
						<li class="list-group-item" style="">Dog</li>
					</ul>
				</div>
			</div>
			
			<!-- 1파티 시너지 -->
			<div class="col-md-10" style="height: 25%; background-color: #1C1C20; padding: 15px">
				<!-- 1파티 상시 시너지 -->
				<div class="col-md-12" style="height: 50%; background-color: #F7D99D">
					<ul id="firstPartyConstantSynergy" class="list-group">

					</ul>
				</div>
				<!-- 1파티 순간 시너지 -->
				<div class="col-md-12" style="height: 50%; background-color: #F7D99D">
					<ul id="firstPartyMomentSynergy" class="list-group">
					</ul>
				</div>
			</div>
			
			<!-- 2파티 -->
			<div class="col-md-2" style="height: 25%;">
				<div class="col-md-12 sortableDiv">
					<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
					  <div class="container-fluid" style="border: solid #F7D99D 1px">
					    <a class="navbar-brand" href="#"><font color="#F7D99D">2파티</font></a>
					  </div>
					</nav>
					<ul id="secondPartysortable" class="list-group partySortTable droptrue ui-sortable" style="padding-left: 10px">
						<li class="list-group-item">Dog</li>
					</ul>
				</div>
			</div>
			
			<!-- 2파티 시너지 -->
			<div class="col-md-10" style="height: auto; background-color: #1C1C20; padding: 15px">
				<!-- 2파티 시너지 -->
				<div class="col-md-12" style="height: 50%; background-color: #F7D99D">
					<ul id="secondPartyConstantSynergy" class="list-group">

					</ul>
				</div>
				<!-- 2파티 순간 시너지 -->
				<div class="col-md-12" style="height: 50%; background-color: #F7D99D">
					<ul id="secondPartyMomentSynergy" class="list-group">
					  <!-- <li class="list-group-item d-flex justify-content-between align-items-center">
					    <span class="badge" style="background-color: red">용맹의포효</span>
					    <span class="badge" style="background-color: blue">배틀마스터</span>
					    <span class="badge" style="background-color: green">순간</span>
					    피격된 적은 6초 동안 치명타 저항률이 3.0% 감소한다.
					  </li> -->
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
