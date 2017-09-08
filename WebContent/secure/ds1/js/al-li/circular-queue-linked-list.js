var currentAlg;

//FRONT field & label Height and width
var FRONT_LABLE_X = 50;
var FRONT_LABLE_Y = 120;
var FRONT_WIDTH = 50;
var FRONT_HEIGHT =30;
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






//size of the linked list
var size = 25;
var addAddress = [];


function CircularQLL(am, w, h) {
	this.init(am, w, h);
}

CircularQLL.prototype = new Algorithm();
CircularQLL.prototype.constructor = CircularQLL;
CircularQLL.superclass = Algorithm.prototype;

CircularQLL.prototype.init = function(am, w, h) {
	CircularQLL.superclass.init.call(this, am, w, h);
	this.nextIndex = 0;
	this.commands = [];
	this.Controls();
	this.setUp();
}

CircularQLL.prototype.Controls = function() {
	this.ButtonArr = [];
	
	this.enqueueTextField = document.getElementById('enqueueText');
	this.enqueueTextField.onkeydown = this.returnSubmit(this.enqueueTextField, this.enqueueCallBack.bind(this),  4);
	
	this.enqueueButton = document.getElementById('enqueueBtn');
	this.enqueueButton.onclick = this.enqueueCallBack.bind(this);
	this.ButtonArr.push(this.enqueueTextField);
	this.ButtonArr.push(this.enqueueButton);
	
	this.dequeueButton = document.getElementById('dequeueBtn');
	this.dequeueButton.onclick = this.dequeueCallBack.bind(this);
	this.ButtonArr.push(this.dequeueButton);
	
	this.dispalyButton = document.getElementById('displayBtn');
	this.dispalyButton.onclick = this.displayCallBack.bind(this);
	this.ButtonArr.push(this.displayBtn);
}

CircularQLL.prototype.setUp = function() {
	
	this.displayText = this.nextIndex++;
	this.displayVal = this.nextIndex++;
	this.frontLable = this.nextIndex++;
	this.frontId = this.nextIndex++;
	this.rearLabel = this.nextIndex++;
	this.rearId = this.nextIndex++;
	this.tempLabel = this.nextIndex++;
	this.cqllData = this.nextIndex++;
	this.cqllNext = this.nextIndex++;
	this.addressLabel = this.nextIndex++;
	this.dummyLabel = this.nextIndex++;
	
	var randomAddress = getRandomInt(1000, 5000);
	addAddress.push(randomAddress)
	console.log(addAddress[0]);
	
	this.cmd("CreateLabel", this.frontLable, "front : ", FRONT_LABLE_X, FRONT_LABLE_Y);
	
	this.cmd("CreateLabel", this.dummyLabel, "12", FRONT_POS_X, FRONT_POS_Y);
	this.cmd("CreateRectangle", this.frontId, "NULL", FRONT_WIDTH, FRONT_HEIGHT, FRONT_POS_X, FRONT_POS_Y);
	
	console.log(this.REAR_LABEL_Y);
	this.cmd("CreateLabel", this.rearLabel, "rear : ", REAR_LABEL_X, REAR_LABEL_Y);
	this.cmd("CreateRectangle", this.rearId, "NULL", REAR_WIDTH, REAR_HEIGHT, REAR_POS_X, REAR_POS_Y);
	
	
	this.animationManager.StartNewAnimation(this.commands);
	this.animationManager.skipForward();
	this.animationManager.clearHistory();
}

CircularQLL.prototype.disableBtn = function() {
	for (var i = 0; i < this.Controls.length; i++) {
		this.Controls[i].disabled = true;
	}
}

CircularQLL.prototype.enableBtn = function() {
	for (var i = 0; i < this.Controls.length; i++) {
		this.Controls[i].enabled = false;
	}
}

function init() {
	var animManag = initCanvas();
	currentAlg = new CircularQLL(animManag, canvas.width, canvas.height);
}

CircularQLL.prototype.enqueueCallBack = function(event) {
	var enqueueTextVal = this.enqueueTextField.value;
	this.implementAction(this.enqueue.bind(this), enqueueTextVal);
	console.log("EnQuee");
	
	
}

CircularQLL.prototype.dequeueCallBack = function() {
	this.implementAction(this.dequeue.bind(this), "");
	console.log("DeQuee");
}

CircularQLL.prototype.displayCallBack = function() {
	this.implementAction(this.display.bind(this), "");
	console.log("Display");
}

CircularQLL.prototype.enqueue = function(elemToPush) {
	this.commands = new Array();
	this.cmd("CreateLabel", this.displayText, "Enqueue Value : ", 50, 30);
	this.cmd("CreateLabel", this.displayVal, elemToPush, 100, 30);
	this.cmd("Step");
	
	this.cmd("CreateLabel", this.tempLabel, "temp", TEMP_WIDTH, TEMP_HEIGHT);
	this.cmd("CreateRectangle", this.cqllData, "", CQLL_ELE_WIDTH, CQLL_ELE_HEIGHT, CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("SetBackgroundColor", this.cqllData, "#cce6ff");
	this.cmd("CreateRectangle", this.cqllNext, "", CQLL_NEXT_WIDTH, CQLL_NEXT_HEIGHT, CQLL_NEXT_POS_X, CQLL_NEXT_POS_Y);
	this.cmd("SetBackgroundColor", this.cqllNext, "#ccffcc");
	this.cmd("CreateLabel", this.addressLabel, addAddress[0], TEMP_WIDTH - 10 , TEMP_HEIGHT + CQLL_NEXT_POS_Y);

	this.cmd("Step");
	this.cmd("Move", this.displayVal, CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("Step");
	this.cmd("SetText", this.cqllNext, "NULL");
	
	this.cmd("Connect", this.frontId, this.cqllData);
	
	
	
//	this.move('move', this.)
	
	
	
	return this.commands;
}

CircularQLL.prototype.dequeue = function(elemToPop) {
	this.commands = new Array();
	
	return this.commands;
}

CircularQLL.prototype.display = function() {
this.commands = new Array();
	
	return this.commands;
}


function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min)) + min;
}

