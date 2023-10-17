<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- css -->
<link rel="stylesheet" href="/resources/css/board02/todoList02.css">

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/c92986acdf.js" crossorigin="anonymous"></script>

<title>To-Do List</title>
</head>
<body>
    <section class="main">
        <h1 class="main-title">ToDo Calendar</h1>
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
	
	// =============== 기본 날짜 관련 변수 세팅 ================
	// 현재 날짜, 월, 일 변수 설정
	let date = new Date();
	let month = document.querySelector('.month-name');
	let Day = document.querySelector('.day');
	
	// 현재 년도, 월, 일
	let currentMon = date.getMonth()+1;   
	let currentYear = date.getFullYear();
	let currentDay = date.getDate();

	let DayOfChoice = currentDay;
	let MonOfChoice = currentMon;
	let yearOfChoice = currentYear;
	
	let year = currentYear;
	let mon = currentMon;
	// ==============================================
		
	// ================= 초기화 변수 ===================	
	let clickEventArr = [];
	let storeToDo = [];
	// ============================================
	
	// =============== 일정 추가 및 삭제 관련 변수 세팅 ==================
	let input = document.querySelector('input[type="text"]');
	let add = document.querySelector('.add');
	let reset = document.querySelector('.reset');
	let allReset = document.querySelector('.allreset');
	// =====================================================
		
	// ================== 이전, 다음 버튼 =======================
	let pre = document.querySelector('.left');
	let next = document.querySelector('.right');
	// ====================================================
	
	// ================ 할 일 텍스트 관련 변수 세팅 ===================
	let todoField = document.querySelector('.todo');
	let todoTitle = document.querySelector('.todo-title');
	let todoList = document.querySelector('.todoList');	
	// ====================================================
		

	// 윤년 년도 메소드
	function isLeapYear(year){
	    return (year%4==0)&&(year%400==0||year%100!=0);
	}
	
	// 월 별 일자 계산 메소드
	function getDayOfMon(mon,year){
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
	    let conYMD = year+'-'+mon+'-'+date;
	    return(new Date(conYMD).getDay());
	}
	
	
	// 달력 만드는 메서드
	function makeCalendar(year, mon, dayCount) {
		
		clickEventArr = [];
		Day.innerHTML = "";
		
		let getFirstDay = getDay(year, mon, 1);
		let previousMon;
		
		if(currentMon-1 < 0) {
			previousMon = 12;
		} else {
			previousMon = currentMon - 1;
		};
		
		let getDayOfPreMon = getDayOfMon(previousMon, year);
		
		for(let i = (getFirstDay + 6) % 7; i > 0; i--) {
			
			let listPre = document.createElement('li');
			listPre.textContent = getDayOfPreMon - (i-1);
			listPre.style.opacity = '0.5';
			listPre.classList.add('disabled');
			Day.appendChild(listPre);
			
		};
		
		for(let i = 1; i <= dayCount; i++) {
			
			if((i === currentDay) && (year === currentYear) && (mon === currentMon)) {
				let onlyOneList = document.createElement('li');
				
				onlyOneList.textContent = i;
				
				if((currentYear === yearOfChoice) && (currentMon === MonOfChoice) && (currentDay === DayOfChoice)) {
					
					onlyOneList.style.border = '3px solid red';
				} else {
					onlyOneList.style.border = '3px solid black';
				}
				
				if(getDay(year, mon, i) === 0) {
					onlyOneList.style.color = 'red';
				} else if(getDay(year, mon, i) === 6) {
					onlyOneList.style.color = 'blue';
				}
				
				Day.appendChild(onlyOneList);
				continue;
			}
			
			let list = document.createElement('li');
			list.textContent = i;
			
			if((DayOfChoice === i) && (yearOfChoice === year) && (MonOfChoice === mon)) {
				list.style.border = '3px solid red';
				Day.addEventListener('click', (e) => {
					if(e.target !== list) {
						list.style.border = 'none';
					}
				});
			}
			
			if(getDay(year, mon, i) === 0) {
				list.style.color = 'red';
			} else if(getDay(year, mon, i) == 6) {
				list.style.color = 'blue';
			}
			
			Day.appendChild(list);
		}
		
	}
	

	// 현재 년 월 표시
	function setMonthTitle(year, mon) {
		
		month.textContent = year + "." + mon;
	}	
	
	// 다음달 & 내년
	function nextMonthOrYear() {
		
		if(mon === 12) {
			year = year + 1;
			mon = 1;
		} else {
			mon = mon + 1;
		}
		
		setMonthTitle(year, mon);
		makeCalendar(year, mon, getDayOfMon(mon, year));
	}
	
	// 작년, 이전 월
	function preMonthOrYear() {
		
		if(mon === 1) {
			year = year - 1;
			mon = 12;
		} else {
			mon = mon - 1;
		}
		
		setMonthTitle(year, mon);
		makeCalendar(year, mon,getDayOfMon(mon, year));
	}
	
	
	function main() {
		
		setMonthTitle(year, mon);
		makeCalendar(year, mon, getDayOfMon(mon, year));
		todoTitle.innerHTML = year + "." + mon + "." + currentDay + "<br>" + "오늘의 할 일은 무엇인가요?";
		displayToDoOnDays();
	}
	
	function displayToDoOnDays() {
		
		todoList.innerHTML = '';
		
		let YMD = year + "-" + mon + "-" + DayOfChoice;
		
		// DB SELECT 조회
		$.ajax({
			url: "selectList",
			method: "GET",
			dataType: "json",
			data: {date: YMD},
			success: function(response) {
				
				if (response.length > 0) {
				    for (let i = 0; i < response.length; i++) {
				        let deleteBtn = document.createElement('button');
				        deleteBtn.setAttribute('class', 'deleteBtn');
				        deleteBtn.innerHTML = '<i class="far fa-minus-square"></i>';
				        let elementToDo = document.createElement('li');

				        elementToDo.innerText += response[i].todoDesc;

				        // 할 일 고유 번호 숨김 처리
				        let hiddenNo = document.createElement('p');
				        hiddenNo.classList.add('hiddenNo');
				        hiddenNo.style.display = 'none';
				        hiddenNo.textContent = response[i].todoNo;
				        elementToDo.appendChild(hiddenNo);

				        elementToDo.appendChild(deleteBtn);

				        elementToDo.scrollTo();
				        todoList.appendChild(elementToDo);
				    }
				}
				
			},
			error: function(e) {
				console.log(e);
			}
		});
		
	}
	
	pre.addEventListener('click',preMonthOrYear);
	next.addEventListener('click',nextMonthOrYear);
	
	function clearEvent() {
		
		clickEventArr.forEach((e) => {
			e.style.border = 'none';
		});
	}
	
	
	Day.addEventListener('click', (event) => {
	    if (event.target.tagName === 'UL') return;
	    if (event.target.className !== 'disabled') {
	        clearEvent();
	        DayOfChoice = (event.target.textContent) * 1;
	        MonOfChoice = mon;
	        yearOfChoice = year;
	        todoTitle.innerHTML = yearOfChoice + "." + MonOfChoice + "." + DayOfChoice + "<br>" + "오늘의 할 일은 무엇인가요?";
	        
	        displayToDoOnDays();
	        event.target.style.border = '3px solid blue';
	        clickEventArr.push(event.target);
	        input.focus();
	    }
	});

	
	// 일정 추가 insert
	function addToDoList(){
		console.log('2');
		let todoTask = input.value;
		console.log(todoTask);
	    if(input.value === ''){
	        alert('일정을 입력해주세요!');
	        return;
	    }

	    let YMD = year + '-' + mon + '-' + DayOfChoice;
	    console.log(YMD);
	    
	    $.ajax({
	    	url: "insertList",
	    	method: "GET",
	    	data: {
	    		task: todoTask,
	    		date: YMD
	    		},
	    	dataType: "json",
	    	success: function(res) {
	    		
	    		if(res.result === "success") {
		    	    input.value = "";
		    	    input.focus();
		    	    displayToDoOnDays();
	    		}
	    	},
	    	error: function(e) {
	    		console.log("error", e);
	    	}
	    });
	    
	}

	
	
	add.addEventListener('click',(event) => {
	    addToDoList();
	});

	input.addEventListener('keypress',(event) => {
	    if(event.key === 'Enter'){
	       addToDoList();
	    }
	});

	// 하루 일정 초기화
	reset.addEventListener('click',() => {
		let result = prompt("정말 초기화 할까요?(y/n)");
		let YMD = year + '-' + mon + '-' + DayOfChoice;
		
	    if(result === 'y'){
	    	$.ajax({
	    		url: "deleteDayList",
	    		method: "GET",
	    		data: {date: YMD},
	    		success: function(res) {
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
	
	// 전체 일정 초기화
	allReset.addEventListener('click',() => {
		let result = prompt("전체 리스트를 초기화 하시겠어요?(y/n)");
	    
	    if(result==='y'){
	        
	    	$.ajax({
	    		url: "deleteAllDay",
	    		method: "GET",
	    		success: function(res) {
	    			if(res > 0) {
	    				displayToDoOnDays();
	    			}
	    		},
	    		error: function(e) {
	    			console.log(e)
	    		}
	    	});
	    }
	});
	

	// 할 일 삭제
	todoList.addEventListener('click',(event) => {
		
	    if (event.target.classList.contains('far') && event.target.classList.contains('fa-minus-square')) {
	        // 클릭한 요소가 삭제 버튼인 경우

	        let parentBtn = event.target.parentNode;
	        let parentLi = parentBtn.parentNode;
	        let hiddenNo = parentLi.querySelector('.hiddenNo').textContent;
	        
	        $.ajax({
	        	url: "deleteList",
	        	method: "GET",
	        	data: {hiddenNo: hiddenNo},
	        	success: function(res) {
	        		console.log("res", res);
	        		displayToDoOnDays();
	        	},
	        	error: function(e) {
	        		console.log("error", e);
	        	}
	        });

	    }
	}); 

	
	main();
	
}); 

</script>    
</body>
</html>