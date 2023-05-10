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
    padding: 0px;
    background-color: gray; padding: 10px;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( 
	function() {
		$("#firstPartysortable, secondPartysortable, playerSortable").sortable({ scroll: false});
		
		$("ul.droptrue").sortable({
			connectWith: "ul"
		});
	  } 
	);
  </script>
</head>
<body>
	<div style="width: 100%; height: 1080px;">
		<div style="width: 40%; height: 100%; float: left;">
			<div style="width: 100%; height: 50%; float: left;">
				<div class="row" style="width: 100%; height: 100%;">
					<!-- 1파티 -->
					<div class="col-md-6" style="height: 100%;">
						<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
						  <div class="container-fluid" style="border: solid 1px">
						    <a class="navbar-brand" href="#">1파티</a>
						  </div>
						</nav>
						<ul id="firstPartysortable" class="list-group droptrue ui-sortable">
  							<li class="list-group-item">Dog</li>
						</ul>
					</div>
					<!-- 2파티 -->
					<div class="col-md-6">
						<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
						  <div class="container-fluid" style="border: solid 1px">
						    <a class="navbar-brand" href="#">2파티</a>
						  </div>
						</nav>
						<ul id="secondPartysortable" class="list-group droptrue ui-sortable">
							<li class="list-group-item">Dog</li>
						</ul>
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 50%; float: left; background-color: blue">
				
			</div>
		</div>
		<div style="width: 20%; height: 100%; float: left; background-color: black">
			<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin: 0px">
			  <div class="container-fluid" style="border: solid 1px">
			    <a class="navbar-brand" href="#">파티원</a>
			  </div>
			</nav>
			<ul id="dd" class="list-group droptrue ui-sortable">
				<li class="list-group-item">도화가</li>
				<li class="list-group-item">슬레이어</li>
				<li class="list-group-item">블래스터</li>
				<li class="list-group-item">배틀마스터</li>
				<li class="list-group-item">창술사</li>
			</ul>
		</div>
		<div style="width: 40%; height: 100%; float: left; background-color: green">
		</div>
	</div>
</body>
</html>
