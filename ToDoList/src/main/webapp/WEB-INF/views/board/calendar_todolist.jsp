<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/board/calendar_todolist.css">
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/c92986acdf.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<section class="main">
        <h1 class="main-title">Calendar AND TodoList</h1>
        <div class="month clearfix">
            <span class="left">
                <i class="fas fa-chevron-left left"></i>
            </span>
            <span class="right">
                <i class="fas fa-chevron-right right"></i>
            </span>
            <p class="month-name"></p>
        </div>
        <div class="dayCount">
            <ul class="dayCount-list clearfix">
                <li>MON</li>
                <li>TUE</li>
                <li>WED</li>
                <li>THU</li>
                <li>FRI</li>
                <li>SAT</li>
                <li>SUN</li>
            </ul>
        </div>
        <ul class="day clearfix">
          
        </ul>

    </section>
    <section class="todo">
        <h1 class="todo-title">
            Today's To Do List
        </h1>
        <div class="textToDo">
            <input type="text" class="textToDo-text">
            <button class="textToDo-button add">Add</button>
            <button class="textToDo-button reset">Reset</button>
            <button class="textToDo-button allreset">All reset</button>
        </div>
        <ul class="todoList"></ul>
    </section>

	<script>
	
	$(document).ready(function() {
		
		// 변수 세팅
		// 현재 날짜, 월, 일 변수
		let date = new Date(); //현재 날짜 가져오는 함수
		let month = document.querySelector('.month-name'); // 월
		let Day = document.querySelector('.day'); // 일
		
		// 현재 년도, 월, 일
		let currentMon = date.getMonth()+1;
		let currentYear = date.getFullYear();
		let currentDay = date.getDate();
		
		let DayOfChoice = currentDay;
		let MonOfChoice = currentMon;
		let yearOfChoice = currentYear;
		
		let year = currentYear;
		let mon = currentMon;
		
		// 초기화 변수
		let clickEvenArr = [];
		let storeToDo = [];
		
		// 일정추가 및 삭제관련 변수
		let input = document.querySelector('input[type="text"]');
		let add = document.querySelector('.add');
		let reset = document.querySelector('.reset');
		let allReset = document.querySelector('.allreset');
		
		// 이전, 다음 버튼 변수
		let pre = document.querySelector('.left');
		let next = document.querySelector('.right');
		
		// 할일 텍스트 관련 변수
		let todoField = document.querySelector('.todo');
		let todoTitle = document.querySelector('.todo-title');
		let todoList = document.querySelector('.todoList');
		
		
		

	// 윤년
	function isLeapYear(year){
		console.log("1");
	    return (year%4==0)&&(year%400==0||year%100!=0);
	    
	}
	
	// 월
	function getDayOfMon(mon,year){
		console.log("2");
	    if(mon===1||mon===3||mon===5||mon===7||mon===8||mon===10||mon===12){
	        return 31;
	    }
	    else if(mon===2){
	        return isLeapYear(year)? 29 : 28;
	    }
	    else{
	        return 30;
	    }
	}
	
	// 날짜 메서드
	function getDay(year,mon,date){
		console.log("3");
	    const conYMD = year+'-'+mon+'-'+date;
	    return(new Date(conYMD).getDay());
	}
	
	// 달력만들기
	function makeCalendar(year,mon,dayCount){
		console.log("4");
	    clickEventArr=[];
	    Day.innerHTML='';
	    let getFirstDay = getDay(year,mon,1);
	    let previousMon;
	    
	    if(currentMon-1<0){
	        previousMon = 12;
	    }
	    else{
	        previousMon = currentMon - 1;
	    }
	    
	    let getDayOfPreMon = getDayOfMon(previousMon,year);
	    for(let i=(getFirstDay+6)%7; i>0; i--){
	        const listPre = document.createElement('li');
	        listPre.textContent = getDayOfPreMon-(i-1);
	        listPre.style.opacity = '0.5'; // css 효과
	        listPre.classList.add('disabled'); //클래스이름을 넣어줌
	        Day.appendChild(listPre); 
	    }
	   
	    // 현재날짜 나타내는 식
	    for(let i=1; i<=dayCount; i++){
	        if(i===currentDay&&year===currentYear&&mon===currentMon){
	            //선택한 년, 월, 일 다를 때 현재 날짜에 검은색 테두리
	            const onlyOneList = document.createElement('li');

	            onlyOneList.textContent = i;
	            if(currentYear === yearOfChoice && currentMon === MonOfChoice && currentDay === DayOfChoice){
	                onlyOneList.style.border = '3px solid red';
	            }
	            else{
	                onlyOneList.style.border = '3px solid black';
	            }

	            if(0===getDay(year,mon,i)){
	                onlyOneList.style.color = 'red';
	            }
	            else if(6==getDay(year,mon,i)){
	                onlyOneList.style.color = 'blue';
	            }

	            //현재 년, 월 같을 때
	            
	            Day.addEventListener('click',(event)=>{
	                if(event.target!==onlyOneList){
	                    onlyOneList.style.border = '3px solid black';
	                }
	            });

	            Day.appendChild(onlyOneList);
	            continue;
	        }
			// 일자를 나타내는 식
	        const list = document.createElement('li');
	        list.textContent = i;
	        
	        if(i===DayOfChoice&&year===yearOfChoice&&mon===MonOfChoice){
	            list.style.border = '3px solid red';
	            Day.addEventListener('click',(event)=>{
	                if(event.target!==list){
	                    list.style.border = 'none';
	                }
	            });
	        }    

	        if(0===getDay(year,mon,i)){
	            list.style.color = 'red';
	        }
	        else if(6==getDay(year,mon,i)){
	            list.style.color = 'blue';
	        }

	        Day.appendChild(list);
	    }
	}

	function setMonthTitle(year,mon){
		console.log("5");
	    month.textContent = year+"."+mon;
	    console.log();
	}

	function nextMonthOrYear(){
		console.log("6");
	    if(mon===12){
	        year = year+1;
	        mon = 1;
	    }
	    else{
	        mon = mon+1;
	    }
	    setMonthTitle(year,mon);
	    makeCalendar(year,mon,getDayOfMon(mon,year));
	}

	function preMonthOrYear(){
		console.log("7");
	    if(mon===1){
	        year = year-1;
	        mon = 12;
	    }
	    else{
	        mon = mon-1;
	    }
	    setMonthTitle(year,mon);
	    makeCalendar(year,mon,getDayOfMon(mon,year));
	}


	function main(){
		console.log("8");
	    setMonthTitle(year,mon);
	    makeCalendar(year,mon,getDayOfMon(mon,year));
	    todoTitle.textContent = "What are you going to do on "+year+"."+mon+"."+currentDay+" 👀⁉";
	    displayToDoOnDays();
	}

	function displayToDoOnDays(){
		console.log("9");
	    todoList.innerHTML='';
	    const YMD = year+'-'+mon+'-'+DayOfChoice;
	    
	    $.ajax({
	    	url: "selectDoList",
	    	method: "GET",
	    	data: {date: YMD},
	    	dataType: "json",
	    	success: function(response) {
	    		if(response.length > 0) {
	    			for(let i = 0; i < response.length; i++) {
	    				let deleteBtn = document.createElement('button');
	    				deleteBtn.setAttribute('class', 'deleteBtn');
	    				deleteBtn.innerHTML = '<i class="far fa-minus-square"></i>';
	    				
	    				let elementToDo = document.createElement('li');
	    				elementToDo.innerText += response[i].todoDesc;
	    				
	    				let hiddenNo = document.createElement('p');
	    				hiddenNo.classList.add('hiddenNo');
	    				hiddenNo.style.display = 'none';
	    				hiddenNo.textContent = response[i].todoNo;
	    				elementToDo.appendChild(hiddenNo);
	    				elementToDo.appendChild(deleteBtn);
	    				todoList.appendChild(elementToDo);
	    				
	    			}
	    		}	
	    		},
	    	error: function(error) {
	    		console.log(error);
	    	}
	    });
	    /*
	    
	            const deleteBtn = document.createElement('button');
	            deleteBtn.setAttribute('class','deleteBtn');
	            deleteBtn.innerHTML = ;
	            const elementToDo = document.createElement('li');
	            
	            elementToDo.innerText = value;
	            elementToDo.appendChild(deleteBtn);

	            elementToDo.scrollTo();

	            todoList.appendChild(elementToDo);
	        });
	        
	    }
	    else{
	        const deleteBtn = document.createElement('button');
	        deleteBtn.setAttribute('class','deleteBtn');
	        deleteBtn.innerHTML = '<i class="far fa-minus-square"></i>';

	        elementToDo.textContent = localStorage.getItem(YMD);
	        elementToDo.appendChild(deleteBtn);
	        todoList.appendChild(elementToDo);
	    }
	    */
	}

	pre.addEventListener('click',preMonthOrYear);
	next.addEventListener('click',nextMonthOrYear);


	function clearEvent(){
		console.log("10");
	    clickEventArr.forEach((value)=>{
	        value.style.border = 'none';
	    });
	}

	Day.addEventListener('click',(event)=>{
	    if(event.target.tagName==='UL')return;
	    if(event.target.className!=='disabled'){
	        clearEvent();
	        todoTitle.textContent = "What are you going to do on "+ year+"." +mon+"."+event.target.textContent+" 👀⁉";
	        event.target.style.border='3px solid red';
	        DayOfChoice = (event.target.textContent)*1;
	        MonOfChoice = mon;
	        yearOfChoice = year;
	        
	        displayToDoOnDays();
	        clickEventArr.push(event.target);
	        input.focus();
	    }
	    
	});
	
	// 일정추가 insert
	function addToDoList(){
		console.log("12");
		let todoTask = input.value;
		console.log(todoTask);
	    if(input.value === ''){
	        alert('please input you are going to do');
	        return;
	    }
	    
	    storeToDo.push(input.value);
	    
	    let YMD = year+'-'+mon+'-'+DayOfChoice;

		$.ajax({
			url: "insertToDoList",
			method: "GET",
			data: {
				// task는 키값, todotask 밸류
				task: todoTask,
				date: YMD
				},
			success: function(response) {
				console.log(response);
				
				if(response == 1) {
				    displayToDoOnDays();
				    input.value="";
				    input.focus();
					
				}
			},
			error : function(error) {
				console.log(error);
			}
			
		});
	    
	}

	add.addEventListener('click',(event)=>{
	    addToDoList();
	});

	input.addEventListener('keypress',(event)=>{
	    if(event.key==='Enter'){
	       addToDoList();
	    }
	});

	reset.addEventListener('click',()=>{
	    const result = prompt("Do you really want to reset TODO on " + year + mon + DayOfChoice + "? Enter (y/n)");
	    const YMD = year+'-'+mon+'-'+DayOfChoice;
	    if(result==='y'){

			$.ajax({
				url: "deleteListDay",
				method: "GET",
				data: {date: YMD},
				success: function(res){
					if(res > 0) {
				        displayToDoOnDays();						
					}
				},
				error: function(e) {
					console.log(e);	
				}	
			});
			
	    }
	});

	allReset.addEventListener('click',()=>{
	    const result = prompt(`Do you really want to clear all TODO? Enter (y/n) not recomended💥`);
	    if(result==='y'){
	        
	    	$.ajax({
	    		url: "deleteAllDayList",
	    		method: "GET",
	    		success: function(res) {
	    			displayToDoOnDays();
	    		},
	    		error: function(e) {
	    			console.log(e);
	    		} 
	    	});
	    	
	    	
	        displayToDoOnDays();
	    }
	});

	todoList.addEventListener('click',(event)=>{
	    if(event.target.className==='far fa-minus-square'){
	        
	    	let parentBtn = event.target.parentNode;
	    	let parentLi = parentBtn.parentNode;
	    	let hiddenNo = parentLi.querySelector('.hiddenNo').textContent;
	    	
	    	$.ajax({
	    		url: "deleteOneList",
	    		method: "GET",
	    		data: {hiddenNo : hiddenNo},
	    		success: function(res) {
	    			console.log(res);
	    			displayToDoOnDays();
	    		},
	    		error: function(e) {
	    			console.log(e);
	    		}
	    		
	    	})
	    	
	    	// console.log("a: "+event.target.parentNode.parentNode.textContent);
	        /*     
	        const YMD = year+'-'+mon+'-'+DayOfChoice;
	        
	        if(localStorage.getItem(YMD).includes(',')){
	            let array = localStorage.getItem(YMD).split(',');
	            let copyArray = [];
	            array.forEach((value)=>{
	                if(value !== event.target.parentNode.parentNode.textContent){
	                    copyArray.push(value);
	                }
	            });
	            localStorage.setItem(YMD,copyArray);
	        }
	        else{
	            localStorage.removeItem(YMD);
	        }
	        
	        todoList.removeChild(event.target.parentNode.parentNode);
	        */
	    }
	}); 

	main();
	});
	</script>

</body>
</html>