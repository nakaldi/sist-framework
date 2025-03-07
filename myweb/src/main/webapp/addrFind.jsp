<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function autoWrite() {
		// 1. 사용자값 회수
		var fullAddr = document.fm.address.value;
		// 2. 값 분리
		var zip = fullAddr.substring(1, 6);
		var addr = fullAddr.substring(8);
		// 3. 본페이지를 연 부모페이지에게 값을 전달 opener는 나를 연 브라우저객체 self는 나 자신
		opener.document.join.zip.value = zip;
		opener.document.join.addr1.value = addr;
		window.self.close();
	}
</script>
</head>
<body>
	<form name="fm">
		<fieldset>
			<legend>주소검색</legend>
			<label>주소</label> <input type="text" name="address" size="35" /><br />
			<input type="button" value="주소확인" onclick="autoWrite();" />

		</fieldset>

	</form>

</body>
</html>