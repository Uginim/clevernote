<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>새 게시글 쓰기</title>
    <%@include file="/WEB-INF/views/include/meta.jsp"%>
    
    <style>
    	/* #write-form{*/    
    	.row {
    		min-height:1.5em;
    		margin-bottom:0.2em;
    		display:flex;
    	}
    	.row>span:first-child{
    		display:flex;
    		/*width:5em;*/
    		width:20%;
    	}
    	.row>span:last-child{
    		display:flex;
    		/*width:5em;*/
    		width:80%;
    	}
    	.row>span:last-child>input,
    	.row>span:last-child>select,
    	.row>span:last-child>textarea{
    		width:100%;
    	}
    </style>
<%--     <script src="<c:url value='/resources/js/common.js'/>"> </script> --%>
    <script >
    window.addEventListener("load",init,false);
    function init() {
    	console.log("init");
        var writeBtn = document.getElementById("submit-btn");
        var cancelBtn = document.getElementById("cancel-btn");
        var listBtn = document.getElementById("list-btn");
        var boardForm= document.getElementById("board");
        // 등록 버튼 클릭시
        writeBtn.addEventListener("click", function(e) {
            e.preventDefault();
            console.log("write");
			if(editor){
				try{
					console.log("init");
					if(document.getElementById('post-content-editor')){
						document.getElementById('post-content-editor').value = editor.getContents();
					};
				}catch(e){
					console.log(e);
				}
			}
            boardForm.submit();
            
		},false);		
		// 취소 버튼 클릭시
		cancelBtn.addEventListener("click", function(e) {
				e.preventDefault();
				console.log("취소");
					var returnPage = e.target.getAttribute('data-returnPage');
				location.href="/board/list/"+returnPage;
		},false);		
		// 목록 버튼 클릭시
		
		listBtn.addEventListener("click",function(e){
			e.preventDefault();
			console.log("목록");
				var returnPage = e.target.getAttribute('data-returnPage');
			location.href="/board/list/"+returnPage;
		},false);   
    }
    </script> 
</head>
 
<body> 
<%@include file="/WEB-INF/views/include/header.jsp"%>
    <main class="py-4">
        <div class="container">
            <h4>새 글 쓰기</h4> 
                <form:form  modelAttribute="board" action="${pageContext.request.contextPath}/board/write/${returnPage }" method="post" enctype="multipart/form-data">
                        <form:input path="userNum" type="hidden" value="${sessionUser.userNum}"/>
                        <form:input path="username" type="hidden" value="${sessionUser.username}"/>
                        <div class="form-group row mb-1 px-3">
                            <form:input class="form-control form-control-lg border-0" path="title" type="text" cols="70" placeholder="제목을 입력하세요.."/> 
                        </div>
                        <form:errors cssClass="error" path="title"/>
                        <div class="form-group row mb-2">
                            <form:label class="col-sm-1" path="type.typeNum">분류</form:label>                            
                            <div class="col-sm-11">
                                <form:select path="type.typeNum" class="form-control" id="type" cols="70">
                                    <option value="0">== 선 택 ==</option>
                                    <form:options path="type.typeNum" items="${boardTypes}" itemValue="typeNum" itemLabel="name" />
                                </form:select>          
                            </div>              
                                            
                        </div>
                        <form:errors cssClass="error" path="type.typeNum"/>                       
                        <div class="form-group row mb-2">
                            <label class="col-sm-1">작성자</label>
                        	<div class="col-sm-11">
                                <input class="form-control" value="${sessionUser.username}" readonly cols="70"/>
                            </div>
                        </div>
                        
                        <div class="form-group mb-2">
                            <label>내용</label>
                            <form:textarea id="post-content-editor" class="form-control" path="content" cols="70" rows="35"></form:textarea>                            
                            <form:errors path="content" cssClass="error"/>              
                        </div>                        
                        
                        <div class="custom-file  mb-2">
                            <label class="custom-file-label">첨부</label><input id="attachments" type="file" class="custom-file-input" name="files" multiple/>
                            <form:errors path="files"/>
                        </div>
                       	<ul id="fileList" class="list-unstyled list-group list-group-flush">
                       		
                       	</ul>
                    
                    <div class="row justify-content-end">
        		            <div class="btn-group">            	
        		                <form:button class="btn btn-outline-primary" id="submit-btn">등록</form:button>
        		                <form:button class="btn btn-outline-primary" data-returnPage="${returnPage }" id="cancel-btn">취소</form:button>
        		                <form:button class="btn btn-outline-primary" data-returnPage="${returnPage }" id="list-btn">목록</form:button>
                        </div>
                    </div>
                </form:form>
        </div>
    </main>
<%@ include file="/WEB-INF/views/include/footer.jsp"  %>	

</body>
</html>
