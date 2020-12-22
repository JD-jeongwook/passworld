/**
 * 
 */
function like() {
	jQuery.ajax ({
		url:"board_recommend.do",
		type:"POST",
		cache:false,
		dataType:'text',
		data:$('#recommend_form').serialize(),
		async:false,
		success:
		function(data) {
			alert("좋아요");
			history.go(0);
		},
		error:
		function(request,status,error) {
			  console.log("Error:" + error );
		}
	});
}