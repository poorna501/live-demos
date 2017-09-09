var currentAlg;

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

var LL_ELEMS_PER_LINE = 5;
var LL_ELEM_SPACING = 150;
var LL_LINE_SPACING = 150;


//size of the linked list
var SIZE = 25;
/*var addAddress = [];
var cqllData = [];
var cqllNext = [];
var dataAddress = [];
*/

var randomAdd;

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
	this.cqllData = new Array(SIZE);
	this.cqllNext = new Array(SIZE);
	//this.addAddress = new Array(SIZE);
	this.dataAddress = new Array(SIZE);
	
	for (var i = 0; i < SIZE; i++) {
		this.cqllData[i] = this.nextIndex++;
		this.cqllNext[i] = this.nextIndex++;
		//this.addAddress[i] = this.nextIndex++;
		this.dataAddress[i] = this.nextIndex++;
	}
	
	this.rear = 0;
	this.frontLable = this.nextIndex++;
	this.frontId = this.nextIndex++;
	this.rearLabel = this.nextIndex++;
	this.rearId = this.nextIndex++;
	//this.addressLabel = this.nextIndex++;
	//this.dummyLabel = this.nextIndex++;
	this.frontRectID = this.nextIndex++;
	this.rearRectID = this.nextIndex++;
	
	
	this.cmd("CreateLabel", this.frontLable, "front : ", FRONT_LABLE_X, FRONT_LABLE_Y);
	//this.cmd("CreateLabel", this.dummyLabel, "", FRONT_POS_X, FRONT_POS_Y - 15);
	this.cmd("CreateRectangle", this.frontRectID, "", FRONT_WIDTH, FRONT_HEIGHT, FRONT_POS_X, FRONT_POS_Y);
	this.cmd("CreateLabel", this.frontId, "NULL", FRONT_POS_X, FRONT_POS_Y);
	
	//console.log(this.REAR_LABEL_Y);
	this.cmd("CreateLabel", this.rearLabel, "rear : ", REAR_LABEL_X, REAR_LABEL_Y);
	this.cmd("CreateRectangle", this.rearRectID, "", REAR_WIDTH, REAR_HEIGHT, REAR_POS_X, REAR_POS_Y);
	this.cmd("CreateLabel", this.rearId, "NULL", REAR_POS_X, REAR_POS_Y);
	
	
	this.animationManager.StartNewAnimation(this.commands);
	this.animationManager.skipForward();
	this.animationManager.clearHistory();
}

CircularQLL.prototype.resetLinkedListPositions = function() {
	for (var i = this.rear - 1; i >= 0; i--) {
		var nextX = (this.rear - 1 - i) % LL_ELEMS_PER_LINE
				* LL_ELEM_SPACING + LL_START_X - LL_NEXT_WIDTH;
		var nextY = Math.floor((this.rear - 1 - i) / LL_ELEMS_PER_LINE)
				* LL_LINE_SPACING + LL_START_Y;
		this.cmd("Move", this.cqllData[i], nextX, nextY);
		//this.cmd("Move", this.llData[i], nextX, nextY);
		this.cmd("Move", this.cqllNext[i], nextX + LL_ELEM_WIDTH - 25, nextY);
		//this.cmd("Move", this.llNext[i], nextX + LL_ELEM_WIDTH - 25, nextY);
		this.cmd("Move", this.dataAddress[i], nextX + 25, nextY + 25);
	}
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
	
	//randomAdd.splice(1, 0, getRandomInt(1000, 5000));
	this.llData = new Array(SIZE);
	this.llNext = new Array(SIZE);
	this.llData[this.rear] = this.nextIndex++;
	this.llNext[this.rear] = this.nextIndex++;
	
	this.tempLabel = this.nextIndex++;
	this.displayText = this.nextIndex++;
	this.displayVal = this.nextIndex++;
	this.dummyTmpAdd = this.nextIndex++;
	
	console.log(this.rear);
	
	
	this.cmd("CreateLabel", this.displayText, "Enqueue Value : ", 50, 30);
	this.cmd("CreateLabel", this.displayVal, elemToPush, 100, 30);
	this.cmd("Step");
	
	this.cmd("CreateLabel", this.tempLabel, "temp", TEMP_WIDTH, TEMP_HEIGHT);
	
	this.cmd("CreateRectangle", this.cqllData[this.rear], "", CQLL_ELE_WIDTH, CQLL_ELE_HEIGHT, CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("CreateLabel", this.llData[this.rear], "", CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("SetBackgroundColor", this.cqllData[this.rear], "#cce6ff");
	
	this.cmd("CreateRectangle", this.cqllNext[this.rear], "", CQLL_NEXT_WIDTH, CQLL_NEXT_HEIGHT, CQLL_NEXT_POS_X, CQLL_NEXT_POS_Y);
	//this.cmd("CreateLabel", this.llNext[this.rear], "", CQLL_NEXT_POS_X, CQLL_NEXT_POS_Y);
	this.cmd("SetBackgroundColor", this.cqllNext[this.rear], "#ccffcc");
	
	randomAdd = getRandomInt(1000, 5000);
	this.cmd("CreateLabel", this.dataAddress[this.rear], randomAdd, TEMP_WIDTH - 10 , TEMP_HEIGHT + CQLL_NEXT_POS_Y);
	this.cmd("Step");
	
	this.cmd("SetPosition", this.llData[this.rear], 100, 30);
	this.cmd("SetText", this.llData[this.rear], elemToPush);
	this.cmd("Move", this.llData[this.rear], CQLL_ELE_POS_X, CQLL_ELE_POS_Y);
	this.cmd("Step");
	this.cmd("SetText", this.cqllData[this.rear], elemToPush);
	this.cmd("SetText", this.cqllNext[this.rear], "NULL");
	
	
	this.cmd("Delete", this.llData[this.rear]);
	this.cmd("Step");
	
	
	if (this.rear == 0) {
		this.cmd("SetPosition", this.frontId, TEMP_WIDTH - 10, TEMP_HEIGHT + CQLL_NEXT_POS_Y);
		this.cmd("SetText", this.frontId, randomAdd);
		this.cmd("Move", this.frontId, FRONT_POS_X, FRONT_POS_Y);
		this.cmd("Step");
		this.cmd("Connect", this.frontRectID, this.cqllData[this.rear]);
		//this.cmd("Connect", this.dummyLabel, this.cqllData);
		this.rearAddressChange();
		
		
		/*this.cmd("Connect", this.frontRectID, this.cqllData[this.rear]);
		this.cmd("SetPosition", this.rearId, TEMP_WIDTH - 10, TEMP_HEIGHT + CQLL_NEXT_POS_Y);
		this.cmd("SetText", this.rearId, randomAdd);
		this.cmd("Step");
		this.cmd("Move", this.rearId, REAR_POS_X, REAR_POS_Y);
		this.cmd("Step");
		this.cmd("Connect", this.rearRectID, this.cqllData[this.rear]);*/
		
		this.rear = this.rear + 1;
		var nextX = (this.rear - 1) % LL_ELEMS_PER_LINE * LL_ELEM_SPACING + LL_START_X;
		var nextY = Math.floor((this.rear - 1) / LL_ELEMS_PER_LINE) * LL_LINE_SPACING + LL_START_Y;
		this.cmd("Move", this.tempLabel, nextX + 25 , nextY - 25);
		this.resetLinkedListPositions();
	} else {
		
		
		this.cmd("SetText", this.cqllNext[this.rear - 1], "");
		
		var nextX = (this.rear - 1) % LL_ELEMS_PER_LINE * LL_ELEM_SPACING + LL_START_X;
		var nextY = Math.floor((this.rear - 1) / LL_ELEMS_PER_LINE) * LL_LINE_SPACING + LL_START_Y;
		
		this.cmd("CreateLabel", this.dummyTmpAdd, "", nextX, nextY);
		
		this.cmd("SetPosition", this.dummyTmpAdd, TEMP_WIDTH - 10 , TEMP_HEIGHT + CQLL_NEXT_POS_Y);
		this.cmd("SetText", this.dummyTmpAdd, randomAdd);
		this.cmd("Move", this.dummyTmpAdd, nextX , nextY);
		this.cmd("Step");
		this.cmd("Delete", this.dummyTmpAdd);
		this.cmd("SetText", this.cqllNext[this.rear - 1], randomAdd);
		this.cmd("Connect", this.cqllNext[this.rear - 1], this.cqllData[this.rear]);
		this.cmd("Step");
		
		this.rearAddressChange();
		
		/*this.cmd("SetPosition", this.rearId, TEMP_WIDTH - 10, TEMP_HEIGHT + CQLL_NEXT_POS_Y);
		this.cmd("SetText", this.rearId, randomAdd);
		this.cmd("Step");
		this.cmd("Move", this.rearId, REAR_POS_X, REAR_POS_Y);
		this.cmd("Step");
		this.cmd("Connect", this.rearRectID, this.cqllData[this.rear]);*/
		
		//this.cmd("Connect", this.rearRectID, this.cqllData);
		
	}
	
	
	this.cmd("Step");
	$('#enqueueText').val("");
	this.cmd("Delete", this.displayText);
	this.cmd("Delete", this.displayVal);
	this.cmd("Delete", this.tempLabel);
	
	
	
	return this.commands;
}

CircularQLL.prototype.rearAddressChange = function() {
	this.cmd("SetPosition", this.rearId, TEMP_WIDTH - 10, TEMP_HEIGHT + CQLL_NEXT_POS_Y);
	this.cmd("SetText", this.rearId, randomAdd);
	this.cmd("Step");
	this.cmd("Move", this.rearId, REAR_POS_X, REAR_POS_Y);
	this.cmd("Step");
	if (this.rearId != 0) {
		this.cmd("Disconnect", this.rearRectID, this.cqllData[this.rear - 1]);
	}
	this.cmd("Connect", this.rearRectID, this.cqllData[this.rear]);
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

