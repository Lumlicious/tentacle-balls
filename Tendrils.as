var ballNumber:uint = 20;
var amplitude:Number = 15 + 30*Math.random();
var frequency:Number = 0.2 + 0.4* Math.random(); 
var phase:Number = 100 * Math.random();
var radius:Number = 5 + 50*Math.random();

var colorData:Array = [0x771AFA, 0xFC0587, 0xA5FE05, 0xFFE705];
var color:uint = colorData[Math.round(3 * Math.random())];

var sinWaveData:Array;
sinWaveData = new Array(ballNumber);

addEventListener(Event.ENTER_FRAME, phaseChange);

function phaseChange(event:Event):void
{
	if (phase == 100)
	{
		phase = 0;
	}
	else
	{
		phase = phase + .03;
	}
	drawWave();
}

function drawWave()
{
	graphics.clear();
	for (var i:int = 0; i < ballNumber; i++)
	{
		sinWaveData[i] = amplitude * Math.sin((i * frequency) + phase);
	}

	for (i = 0; i < ballNumber; i++)
	{
		var index:Number = i * (20);

		graphics.beginFill(color, 1);
		graphics.drawCircle(i*radius,sinWaveData[i] + 170, radius - (i*radius)/ballNumber);
		graphics.endFill();
		
	}
}