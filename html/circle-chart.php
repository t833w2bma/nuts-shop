<?php   
/* CAT:Bar Chart */

/* pChart library inclusions */
require_once("./bootstrap.php");

use pChart\pColor;
use pChart\pDraw;
use pChart\pCharts;

/* Create the pChart object */
$x = 900 ; $y = 330;
$myPicture = new pDraw($x,$y);

/* Populate the pData object */
$myPicture->myData->addPoints([150,220,300,-250,-420,-200,300,200,100],"Server A");
$myPicture->myData->addPoints([140,0,340,-300,-320,399,200,100,50],"Server B");
$myPicture->myData->setAxisName(0,"Hits");
$myPicture->myData->addPoints(["Jan","Feb","Mar","Apr","May","June","July","Aug","Sep"],"Months");
$myPicture->myData->setSerieDescription("Months","Month");
$myPicture->myData->setAbscissa("Months");

/* Turn off Anti-aliasing */
$myPicture->Antialias = FALSE;

/* Add a border to the picture */
$myPicture->drawGradientArea(0,0,$x,$y,DIRECTION_VERTICAL,  ["StartColor"=>new pColor(240),"EndColor"=>new pColor(180)]);
$myPicture->drawGradientArea(0,0,$x,$y,DIRECTION_HORIZONTAL,["StartColor"=>new pColor(240,240,240,20), "EndColor"=>new pColor(180,180,180,20)]);

$myPicture->drawRectangle(0,0,$x-1,$y-1,["Color"=>new pColor(0)]);

/* Set the default font */
$myPicture->setFontProperties(["FontSize"=>7]);

/* Define the chart area */
$myPicture->setGraphArea(60,40,$x-50,$y-30);

/* Draw the scale */
$myPicture->drawScale(["GridColor"=>new pColor(200),"DrawSubTicks"=>TRUE,"CycleBackground"=>TRUE]);

/* Write the chart legend */
$myPicture->drawLegend(580,12,["Style"=>LEGEND_NOBORDER,"Mode"=>LEGEND_HORIZONTAL]);

/* Turn shadow on */ 
$myPicture->setShadow(TRUE,["X"=>1,"Y"=>1,"Color"=>new pColor(0,0,0,10)]);

/* Draw the chart */
(new pCharts($myPicture))->drawBarChart(["Surrounding"=>-30,"InnerSurrounding"=>30]);

/* Render the picture (choose the best way) */
$myPicture->autoOutput("temp/example.drawBarChart.simple.png");
