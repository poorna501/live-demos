var deQueueAlg;

var LL_START_X = 100;
var LL_START_Y = 200;
var LL_ELEM_WIDTH = 70;
var LL_ELEM_HEIGHT = 30;
var LL_NEXT_WIDTH = 40;
var LL_NEXT_HEIGHT = 30;

//FRONT field & label Height and width
var FRONT_LABLE_X = 50;
var FRONT_LABLE_Y = 120;
var FRONT_WIDTH = 50;
var FRONT_HEIGHT = 30;
var FRONT_POS_X = 100;
var FRONT_POS_Y = 120;

//REAR field & label set height and width
var REAR_LABEL_X = 50;
var REAR_LABEL_Y = 450;
var REAR_WIDTH = 50;
var REAR_HEIGHT = 30;
var REAR_POS_X = 100;
var REAR_POS_Y = 450;

//DATA field height and width x and Y position
var CQLL_ELE_WIDTH = 50;
var CQLL_ELE_HEIGHT = 30;
var CQLL_ELE_POS_X = 190;
var CQLL_ELE_POS_Y = 55;

//NEXT field height and width
var CQLL_NEXT_WIDTH = 45;
var CQLL_NEXT_HEIGHT = 30;
var CQLL_NEXT_POS_X = 235;
var CQLL_NEXT_POS_Y = 55;

//TEMP label set height and width
var TEMP_WIDTH = 220;
var TEMP_HEIGHT = 30;

var LL_ELEMS_PER_LINE = 5;
var LL_ELEM_SPACING = 150;
var LL_LINE_SPACING = 70;

//size of the linked list
var SIZE = 19;
var firstNodeAdd;
var firstNodeAdd = getRandomInt(1000, 5000);
var address = []



function init() {
	var animMang = initCanvas();
	deQueueAlg = new DeQll(animMang, canvas.width, canvas.height);
}

function DeQll(am, w, h) {
	this.init(am, w. h);
}

DeQll.prototype = new Algorithm();
DeQll.prototype.constructor = DeQll;
DeQll.superclass = Algorithm.prototype;

DeQll.prototype.init = function(am, w, h) {
	DeQll.superclass.init.call(this, am ,w, h);
	this.nextIndex = 0;
	this.commands = [];
	this.Controls();
	this.setUp();
}

DeQll.prototype.Controls = function() {
	this.ButtonArr = [];
	//Inject element
	this.injectTextField = document.getElementById('injectText');
	this.injectTextField.onkeydown = this.returnSubmit(this.injectTextField, this.injectCallBack.bind(this),  3);
	this.injectButton = document.getElementById('injectBtn');
	this.injectButton.onclick = this.injectCallBack.bind(this);
	this.ButtonArr.push(this.injectTextField);
	this.ButtonArr.push(this.injectButton);
	
	// Push element
	this.pushTextField = document.getElementById('pushText');
	this.pushTextField.onkeydown = this.returnSubmit(this.pushTextField, this.pushCallBack.bind(this),  3);
	this.pushButton = document.getElementById('pushBtn');
	this.pushButton.onclick = this.pushCallBack.bind(this);
	this.ButtonArr.push(this.pushTextField);
	this.ButtonArr.push(this.pushButton);
	
	//Eject element
	this.ejectButton = document.getElementById('ejectBtn');
	this.ejectButton.onclick = this.ejectCallBack.bind(this);
	this.ButtonArr.push(this.ejectButton);
	
	//pop element
	this.popButton = document.getElementById('popBtn');
	this.popButton.onclick = this.popCallBack.bind(this);
	this.ButtonArr.push(this.popButton);
	
	//display elements
	this.dispalyButton = document.getElementById('displayBtn');
	this.dispalyButton.onclick = this.displayCallBack.bind(this);
	this.ButtonArr.push(this.displayBtn);
	
	//clear elements
	this.clearButton = document.getElementById('clearBtn');
	this.clearButton.onclick = this.clearCallBack.bind(this);
	this.ButtonArr.push(this.clearButton);
}



DeQll.prototype.setUp = function() {
	this.point1 = this.nextIndex++;
	this.point2 = this.nextIndex++;
	this.point3 = this.nextIndex++;
	this.point4 = this.nextIndex++;
	this.point5 = this.nextIndex++;
	this.point6 = this.nextIndex++;
	
	this.deQllData = new Array(SIZE);
	this.deQllNext = new Array(SIZE);
	this.dataAddress = new Array(SIZE);
	this.address = new Array(SIZE);
	
	for (var i = 0; i < SIZE; i++) {
		this.deQllData[i] = this.nextIndex++;
		this.deQllNext[i] = this.nextIndex++;
		this.dataAddress[i] = this.nextIndex++;
	}
	
	this.rear = 0;
	this.frontLable = this.nextIndex++;
	this.frontId = this.nextIndex++;
	this.rearLabel = this.nextIndex++;
	this.rearId = this.nextIndex++;
	this.frontRectID = this.nextIndex++;
	this.rearRectID = this.nextIndex++;
	
	
	this.cmd("CreateLabel", this.frontLable, "front : ", FRONT_LABLE_X, FRONT_LABLE_Y);
	this.cmd("CreateRectangle", this.frontRectID, "", FRONT_WIDTH, FRONT_HEIGHT, FRONT_POS_X, FRONT_POS_Y);
	this.cmd("CreateLabel", this.frontId, "NULL", FRONT_POS_X, FRONT_POS_Y);
	
	this.cmd("CreateLabel", this.rearLabel, "rear : ", REAR_LABEL_X, REAR_LABEL_Y);
	this.cmd("CreateRectangle", this.rearRectID, "", REAR_WIDTH, REAR_HEIGHT, REAR_POS_X, REAR_POS_Y);
	this.cmd("CreateLabel", this.rearId, "NULL", REAR_POS_X, REAR_POS_Y);
	
	
	this.animationManager.StartNewAnimation(this.commands);
	this.animationManager.skipForward();
	this.animationManager.clearHistory();
}

DeQll.prototype.inject = function(elementToInject) {
	this.commands = new Array();
	console.log("Element to inject");
	
	this.llData = new Array(SIZE);
	this.llNext = new Array(SIZE);
	this.llData[this.rear] = this.nextIndex++;
	this.llNext[this.rear] = this.nextIndex++;
	
	this.tempLabel = this.nextIndex++;
	this.displayText = this.nextIndex++;
	this.displayVal = this.nextIndex++;
	this.dummyTmpAdd = this.nextIndex++;
	
	this.cmd("CreateLabel", this.displayText, "Enqueue Value : ", 50, 30);
	this.cmd("CreateLabel", this.displayVal, elementToInject, 100, 30);
	this.cmd("Step");
	this.cmd("CreateLabel", this.tempLabel, "temp", TEMP_WIDTH, TEMP_HEIGHT);
	this.cmd("CreateRectangle", this.deQllData[this.rear], "", CQLL_ELE_WIDTH, CQLL_ELE_HEIGHT, CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("CreateLabel", this.llData[this.rear], "", CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("SetBackgroundColor", this.deQllData[this.rear], "#cce6ff");
	this.cmd("CreateRectangle", this.deQllNext[this.rear], "", CQLL_NEXT_WIDTH, CQLL_NEXT_HEIGHT, CQLL_NEXT_POS_X, CQLL_NEXT_POS_Y);
	this.cmd("CreateLabel", this.llNext[this.rear], "", CQLL_NEXT_POS_X, CQLL_NEXT_POS_Y);
	this.cmd("SetBackgroundColor", this.deQllNext[this.rear], "#ccffcc");
	
	randomAdd = getRandomInt(1000, 5000);
	address[this.rear] = randomAdd;
	
	this.cmd("CreateLabel", this.dataAddress[this.rear], randomAdd, TEMP_WIDTH - 10 , TEMP_HEIGHT + CQLL_NEXT_POS_Y);
	this.cmd("Step");
	this.cmd("SetPosition", this.llData[this.rear], 100, 30);
	this.cmd("SetText", this.llData[this.rear], elementToInject);
	this.cmd("Move", this.llData[this.rear], CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("Step");
	this.cmd("SetText", this.deQllData[this.rear], elementToInject);
	this.cmd("SetText", this.deQllNext[this.rear], "NULL");
	this.cmd("Delete", this.llData[this.rear]);
	this.cmd("Step");
	
	if (this.rear == 0) {
		this.cmd("SetPosition", this.frontId, TEMP_WIDTH - 10, TEMP_HEIGHT + CQLL_NEXT_POS_Y);
		this.cmd("SetText", this.frontId, randomAdd);
		this.cmd("Move", this.frontId, FRONT_POS_X, FRONT_POS_Y);
		this.cmd("Step");
		this.cmd("Connect", this.frontRectID, this.deQllData[this.rear]);
		this.rearAddressChange();
		this.rear = this.rear + 1;
		var nextX = (this.rear - 1) % LL_ELEMS_PER_LINE * LL_ELEM_SPACING + LL_START_X;
		var nextY = Math.floor((this.rear - 1) / LL_ELEMS_PER_LINE) * LL_LINE_SPACING + LL_START_Y;
		this.cmd("Move", this.tempLabel, nextX + 12, nextY - 20);
		this.resetLinkedListPositions(true);
		this.cmd("Step");
	} else {
		this.cmd("SetText", this.deQllNext[this.rear - 1], "");
		var nextX = (this.rear - 1) % LL_ELEMS_PER_LINE * LL_ELEM_SPACING + LL_START_X;
		var nextY = Math.floor((this.rear - 1) / LL_ELEMS_PER_LINE) * LL_LINE_SPACING + LL_START_Y;
		this.cmd("CreateLabel", this.dummyTmpAdd, "", nextX, nextY);
		this.cmd("SetPosition", this.dummyTmpAdd, TEMP_WIDTH - 10 , TEMP_HEIGHT + CQLL_NEXT_POS_Y);
		this.cmd("SetText", this.dummyTmpAdd, randomAdd);
		this.cmd("Move", this.dummyTmpAdd, nextX , nextY);
		this.cmd("Step");
		this.cmd("Delete", this.dummyTmpAdd);
		
		this.cmd("SetText", this.deQllNext[this.rear - 1], randomAdd);
		this.cmd("Connect", this.deQllNext[this.rear - 1], this.deQllData[this.rear]);
		this.cmd("SetText", this.deQllNext[this.rear - 1], "");
		this.cmd("Step");
		this.rearAddressChange();
		this.rear = this.rear + 1;
		this.resetLinkedListPositions(true);
		this.cmd("Step");
		
		
	}
	
	$('#enqueueText').val("");
	this.cmd("Delete", this.displayText);
	this.cmd("Delete", this.displayVal);
	this.cmd("Delete", this.tempLabel);
	this.cmd("Step");
	
	return this.commands;
}

DeQll.prototype.eject = function() {
	
}


DeQll.prototype.rearAddressChange = function() {
	this.cmd("SetPosition", this.rearId, TEMP_WIDTH - 10, TEMP_HEIGHT + CQLL_NEXT_POS_Y);
	this.cmd("SetText", this.rearId, randomAdd);
	this.cmd("Move", this.rearId, REAR_POS_X, REAR_POS_Y);
	this.cmd("Step");
	if (this.rearId != 0) {
		this.cmd("Disconnect", this.rearRectID, this.deQllData[this.rear - 1]);
	}
	this.cmd("Connect", this.rearRectID, this.deQllData[this.rear]);
}


DeQll.prototype.resetLinkedListPositions = function(flag) {
		if (flag) {
			let nextX = (this.rear - 1) % LL_ELEMS_PER_LINE * LL_ELEM_SPACING + LL_START_X - LL_NEXT_WIDTH;
			let nextY = Math.floor((this.rear - 1) / LL_ELEMS_PER_LINE)* LL_LINE_SPACING + LL_START_Y;
			this.cmd("Move", this.deQllData[this.rear - 1], nextX, nextY);
			this.cmd("Move", this.deQllNext[this.rear - 1], nextX + LL_ELEM_WIDTH - 25, nextY);
			this.cmd("Move", this.dataAddress[this.rear - 1], nextX + 25, nextY + 25);
		} else {
			for (let i = this.rear - 1; i >= 1; i--) {
				
				let nextX = (i) % LL_ELEMS_PER_LINE * LL_ELEM_SPACING + LL_START_X - LL_NEXT_WIDTH;
				let nextY = Math.floor((i) / LL_ELEMS_PER_LINE)* LL_LINE_SPACING + LL_START_Y;
				this.cmd("Move", this.deQllData[i], nextX - LL_ELEM_SPACING, nextY);
				this.cmd("Move", this.deQllNext[i], nextX - LL_ELEM_WIDTH - 35, nextY);
				this.cmd("Move", this.dataAddress[i], nextX - LL_ELEM_SPACING , nextY + 25);
			}
		}
}






DeQll.prototype.injectCallBack = function(event) {
	var injectTextVal = this.injectTextField.value;
	this.implementAction(this.inject.bind(this), injectTextVal);
	console.log("Inject call back");
}

DeQll.prototype.ejectCallBack = function() {
	console.log("Eject call Back");
	this.implementAction(this.eject.bind(this), "");
}

DeQll.prototype.pushCallBack = function(event) {
	var pushTextVal = this.pushTextField.value;
	this.implementAction(this.pushEle.bind(this), pushTextVal);
	console.log("Push Call Back");
}

DeQll.prototype.popCallBack = function() {
	this.implementAction(this.pop.bind(this), "");
}

DeQll.prototype.displayCallBack = function() {
	this.implementAction(this.display.bind(this), "");
}

DeQll.prototype.clearCallBack = function() {
	this.implementAction(this.clear.bind(this), "");
}

DeQll.prototype.disableBtn = function() {
	for (var i = 0; i < this.Controls.length; i++) {
		this.Controls[i].disabled = true;
	}
}

DeQll.prototype.enableBtn = function() {
	for (var i = 0; i < this.Controls.length; i++) {
		this.Controls[i].enabled = false;
	}
}


function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min)) + min;
}


function travel(fromSelector, toSelector, callBackFunction) {
	$(fromSelector).css("background-color", "yellow");
	var l = $(fromSelector).offset();
	$(toSelector).offset({
		top : l.top,
		left : l.left
	});
	TweenMax.to(toSelector, 1, { top : 0, left : 0, onComplete:function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function flip(selector, val, callBackFunction) {
	TweenMax.to($(selector), 0.5, {rotationX : -90, onComplete:function() {
		$(selector).text(val);
		TweenMax.to($(selector), 0.5, {rotationX : 0, onComplete:function() {
			if (typeof callBackFunction === "function") {
				callBackFunction();
			}
		}});
	}});
}

function arrow(fromId, toId, callBackFunction) {
	$(".arrow").remove();
	$('body').append("<i class='fa fa-arrow-right arrow faa-passing animated' style='position: relative; z-index: 10000000;'></i>");
	var l = $(fromId).offset();
	$('.arrow').offset({
		'top': l.top,
		'left': l.left - ($('.arrow').width() * 1.5)
	});
	var l1 = $(fromId).offset();
	var l2 = $(toId).offset();
	var topLength = parseInt($(".arrow").css("top")) + (l2.top - l1.top);
	var leftLength = parseInt($(".arrow").css("left")) + (l2.left - l1.left);
	var time = 0;
	if (fromId !== toId) {
		time = 1;
	}
	TweenMax.to(".arrow", time, { top : topLength, left : leftLength, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}




