<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var output = '';
for(var key in screen) {
	output += '' + key + ':' + screen[key] + '\n';
}
alert(output);
</script>

<script>
	var child = window.open(',','width=300, height=200');
	var width= screen.width; 
	var height = screen.height;
	child.moveTo(0, 0);
	child.resizeTo(width, height);
	setInterval(function()) {
		child.reziseBy(-20, -20);
		child,moveBy(10, 10);
	}, 1000);
</script>
</body>
</html>