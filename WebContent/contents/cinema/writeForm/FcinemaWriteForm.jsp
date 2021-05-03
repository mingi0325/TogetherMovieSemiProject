<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="insertCinema" action="<%= request.getContextPath() %>/InsertFCinema.do" method="post" >
	
	
		<label>지점명 : </label><input type="text" size = "50"name="cinema_name"><br>
		<label>소개글 : </label><input type="text" size ="100" name="topic"><br>
		<label>지역 : </label><input type="text" size ="30" name="area"><br>
		<label>영화관 사이트 : </label><input type="text" size ="50" name="site"><br>
		<label>영화관</label><br>
		<select name ="company">
			<option value="cgv.png">CGV</option>
			<option value="megabox.png">MEGABOX</option>
		</select>
		<br><br>
		<fieldset>
			<label>층별 안내 작성</label><br>
			<textarea rows="10" cols="70" name="floor" id="floorarea" readonly="readonly" style="resize: none;"></textarea><br>
					<input type="text" size = "50" id="floortext">
			<button type="button"onclick="addFloor();">작성추가</button>
			<button type="button"onclick="resetFloor();">초기화</button><br>
			<br>
			<label>교통안내 작성</label>
			
			<br>
			<label>도로명 주소 : </label><input type="text" size = "100" name="adress">
			
			<fieldset>
				<legend>주차</legend>
				<label>주차안내 </label><br>
					<textarea rows="5" cols="70" name="guide" style="resize: none;"></textarea><br>
				<label>주차확인 </label><br>
					<textarea rows="5" cols="70" name="confirm" style="resize: none;"></textarea><br>
				<label>주차요금 </label><br>
				<div id="parking">
					<textarea rows="10" cols="70" name="pay" id="parkingarea" readonly="readonly" style="resize: none;"></textarea><br>
					<input type="text" size = "50" id="parkingtext">
					<button type="button"onclick="addParkingPay();">작성추가</button>
					<button type="button"onclick="resetParkingPay();">초기화</button>
				</div>
			</fieldset>
			
			<fieldset>
				<legend>대중교통</legend>
				<label>버스</label><br>
				<textarea rows="10" cols="70" name="bus" id ="busarea"readonly="readonly" style="resize: none;"></textarea><br>
				<input type="text" size = "50" id="bustext">
					<button type="button"onclick="addBus();">작성추가</button>
					<button type="button"onclick="resetBus();">초기화</button>
				<br>	
				<label>지하철</label><br>
				<textarea rows="10" cols="70" name="metro" id="metroarea"readonly="readonly" style="resize: none;"></textarea><br>
				<input type="text" size = "50" id="metrotext">
					<button type="button"onclick="addMetro();">작성추가</button>
					<button type="button"onclick="resetMetro();">초기화</button>
			</fieldset>
			<br>
			<legend>시설안내 작성</legend>
			<label>보유 시설 작성</label><br>
			<input type="checkbox" name="avail" value = "normal"><label>일반열람석</label>
			<input type="checkbox" name="avail" value = "disabled"><label>장애인석</label>
			<input type="checkbox" name="avail" value = "cafe"><label>카페</label>
			<input type="checkbox" name="avail" value = "sofa"><label>2인소파</label>
			<br>
			<br>
			<input type="submit">
		</fieldset>
		
	</form>
</body>
<script>
	//주차
	function addParkingPay(){
		
		var parkingtext = document.getElementById('parkingtext');
		var parkingtextArea = document.getElementById('parkingarea');
		
		parkingtextArea.innerHTML += parkingtext.value  +">"+ "\n";
		parkingtext.value ="";
	}
	
	function resetParkingPay(){
		var parkingtextArea = document.getElementById('parkingarea');
		parkingtextArea.innerHTML = "";
		
	}
	//층별
	function addFloor(){
		
		var text = document.getElementById('floortext');
		var textArea = document.getElementById('floorarea');
		
		textArea.innerHTML += text.value  +">"+ "\n";
		text.value ="";
	}
	
	function resetFloor(){
		var textArea = document.getElementById('floorarea');
		textArea.innerHTML = "";
		
	}
	//버스
	function addBus(){
		
		var text = document.getElementById('bustext');
		var textArea = document.getElementById('busarea');
		
		textArea.innerHTML += text.value  +">"+ "\n";
		text.value ="";
	}
	
	function resetBus(){
		var textArea = document.getElementById('busarea');
		textArea.innerHTML = "";
		
	}
	//지하철
	function addMetro(){
		
		var text = document.getElementById('metrotext');
		var textArea = document.getElementById('metroarea');
		
		textArea.innerHTML += text.value  +">"+ "\n";
		text.value ="";
	}
	
	function resetMetro(){
		var textArea = document.getElementById('metroarea');
		textArea.innerHTML = "";
		
	}
	
	
</script>

</html>