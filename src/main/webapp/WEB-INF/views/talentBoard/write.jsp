<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>돈 빼고 다! 돈-고</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<style>
/* 네비바 및 상단 고정 부분 */
#titlename {
	margin-top: 1%;
	margin-bottom: 0;
	font-size: 30px;
	font-family: 'Gugi', cursive;
	color: white;
}

img {
	width: 100%;
}

#search {
	width: 500px;
	position: relative;
}

.Explanation {
	position: relative;
	top: 30%;
}

.subject {
	color: #1d2434;
	text-align: center;
	font-size: 40px;
	font-weight: 800;
}

.contents {
	margin-top: 5%;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

.Main {
	margin-top: 5%;
}

/* 글쓰기 폼 */
.title {
	overflow: hidden;
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid #ddd;
}

.titel h3 {
	font-size: 2rem;
	text-align: center;
}

.wrapper {
	margin-top: 30px;
	width: 100%;
	height: auto;
}

.form-control .input-group-text {
	color: #1d2434;
	font-weight: 800;
}

.input {
	margin-top: 20px;
}

#title_input {
	margin-top: 20px;
}

strong {
	color: red;
}
/* 이미지 파일 미리보기 */
#preview{
 width: 600px;
 margin-top:20px;
}
#preview img{
 max-width: 200px;
 margin-right: 10px;
 margin-bottom: 10px;
}

</style>
<script>
    //이미지 담을 배열
 let preview_files =[];
 $(function(){
    $("#file").on("change",preview)
   

	 $("#submit").on("click",function(){ //글 작성 전 제목 내용 입력여부 확인
		    let titleCheck = $("#title_input");
		    let contentsCheck=$("#contents");
		    let categoryCheck=$("#category");
		    let priceCheck=$("#price");
		    
		    if (titleCheck.val()=="") {
		        alert("상품명을 입력해주세요.");
		        titleCheck.focus();
		        return false;
		    }
		    else if (contentsCheck.val()=="") {
		        alert("세부 내용을 입력해주세요.");
		       contentsCheck.focus();
				return false;
		    }
		    
		    else if (contentsCheck.val()=="") {
		        alert("카테고리를 선택해주세요.");
		       contentsCheck.focus();
				return false;
		    }
		    else if (priceCheck.val()=="") {
		        alert("가격을 입력해주세요.");
		       contentsCheck.focus();
				return false;
		    }
      		$("#writeForm").submit();

		}); 
 });

 function filesUpload(){
     console.log("fileupload");
     $("#file").trigger('click');
 }

 function preview(e){

     //이미지 정보들 초기화
     preview_files =[];
     $("#file").empty();

     let files = e.target.files;
     let filesArr = Array.prototype.slice.call(files);
     
     let index=0;
     filesArr.forEach(function(f) {
         if(!f.type.match("image.*")){
             alert("확장자는 이미지 확장자만 가능합니다.");
             return;
         }
         preview_files.push(f);
         
         let reader = new FileReader();
         reader.onload = function(e){
            let html = "<a href=\"javascript:void(0);\" onclick=\"deleteImage("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";

             $("#preview").append(html);
             index++;
            //  let img_html = "<img src=\"" +e.target.result + "\" />";
            //  $("#preview").append(img_html);

         }
         reader.readAsDataURL(f);
     });
 }

 function deleteImage(index) {            
            console.log("index : "+index);
            preview_files.splice(index, 1);
 
            let img_id = "#img_id_"+index;
            $(img_id).remove();
 
            console.log(preview_files);
        }
        function submit() {            
            let data = new FormData();
 
            for(let i=0, len=preview_files.length; i<len; i++) {
                let name = "image_"+i;
                data.append(name, preview_files[i]);
            }
            data.append("image_count", preview_files.length);
           
 
            var xhr = new XMLHttpRequest();
            xhr.open("POST","./Tboard/write");
            xhr.onload = function(e) {
                if(this.status == 200) {
                    console.log("Result : "+e.currentTarget.responseText);
                }
            }
 
            xhr.send(data);
 
        }


</script>
</head>
<body>
	<!-- Top Bar Start -->
	<div class="top-bar d-none d-md-block">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="top-bar-left">
						<div class="text">
							<h2>AM 9:00 - PM 7:00</h2>
						</div>
						<div class="text">
							<h2>02 123 4567</h2>
							<p>고객 센터</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="top-bar-right">
						<div class="social">
							<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
								class="fab fa-facebook-f"></i></a> <a href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar End -->

	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a href="index.html" class="navbar-brand">
				<p id="titlename">돈-다</p>
			</a>
			
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav ml-auto">
					<input class="form-control mr-sm-5" type="search"
						placeholder="물품, 지역을 검색해주세요." id=search aria-label="Search">
					<a href="#" class="nav-item nav-link active">Login</a>
					<!-- Login Page 이동 -->
					<a href="/person/join" class="nav-item nav-link">Sign Up</a>
					<!-- SignUp Page 이동 -->
				</div>
			</div>

		</div>
	</div>
	<!-- Nav Bar End -->

	
		<div class="container">
			<form action="" method="post" id="writeForm">
			<div class="form-control wrapper ">
				<div class="title">
					<h2><b>상품등록</b></h2>

				</div>
				<div class="input-group mb-3 col-md-12 ">
					<label class="input-group-text input" for="inputGroupSelect02">상품명<strong>＊</strong></label>
					<input type="text" class="form-control" id="title_input" name="title"placeholder="상품명을 입력하세요" required>
				</div>

				<div class="input-group mb-3 col-md-12">
					<label class="input-group-text" for="inputGroupSelect02">카테고리<strong>＊</strong></label>
					<select class="custom-select" id="category" name="category" required>
						<option selected>카테고리 선택해주세요.</option>
						<option value="1">생활/가공식품</option>
						<option value="2">디지털기기</option>
						<option value="3">잡화,의류</option>
                        <option value="4">뷰티,미용</option>
                        <option value="5">도서/티켓/음반</option>
                        <option value="6">식품</option>
                        <option value="7">기타</option>
					</select>
				</div>


				<div class="input-group mb-3 col-md-12">
                    <h4><b>이미지 미리보기</b></h4>
					<div class="input-group mb-3 col-md-12 " id="preview">
                        <!-- <img id="img"/> -->
                    </div>
					<div class="custom-file" >
					<!-- <form action="fileForm" name="frm" method="post" id="fileForm"> -->
						<input type="file" class="custom-file-input" id="file" multiple>
						<label class="custom-file-label" for="inputGroupFile04"></label>
					</div>
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" onclick="filesUpload();" class="uploadBtn">이미지 업로드</button>
					</div>
					<!-- </form> -->
				</div>

				<div class="input-group mb-3 col-md-12">
					<label class="input-group-text">가격<strong>＊</strong></label> <input
						type="text" class="form-control" placeholder="가격 (ex: 100 상추)" name="price" id="price" required>
				</div>

				<div class="input-group mb-3 col-md-12">
					<input type="text" class="form-control"	placeholder="위치" readonly>
				</div>
				<div class="input-group mb-3 col-md-12">
					<textarea class="form-control" aria-label="With textarea"
						placeholder="세부 설명을 입력해주세요" rows="10" id="contents" name="contents" required></textarea>
				</div>
				<div class="btn_wrap text-right footer">
					<button type="button" class="btn btn-primary" id="modifyBtn" onclick="submit();">등록</button>
					<button type="reset" id="deleteBtn" class="btn btn-dark">취소</button>

				</div>
			</div>
	</form>
	</div>



</body>

</html>