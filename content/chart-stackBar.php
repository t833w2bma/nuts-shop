<?php

require_once("../connect.php");
require_once("./bootstrap.php");
// require_once("/var/www/hopto/nuts-shop/pChart/pData.php");

// use pChart\{pDraw,pCharts,pColor};
use pChart\pColor;
use pChart\pDraw;
use pChart\pCharts;

//商品名の配列
$sql = "SELECT name FROM `product`";
$stmt=$pdo->prepare($sql);
$stmt->execute();
foreach( $stmt as $row){
  $name[] = $row['name'];
}
// print_r($name);
// echo PHP_EOL;

$sql = "SELECT distinct( DATE_FORMAT(created,'%Y%m') )as YM
FROM `purchase` as p
LEFT JOIN purchase_detail as d ON p.id = d. purchase_id
LEFT JOIN product as s ON d.product_id = s.id
 WHERE created BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY d.product_id  , DATE_FORMAT(created,'%Y%m')
ORDER BY  YM";

$stmt=$pdo->prepare($sql);
$stmt->execute();
foreach( $stmt as $row){
  $ym[] = $row['YM'];
}
// var_dump($name); exit;

$sql = "SELECT s.id, s.name, count(*) as count , DATE_FORMAT(created,'%Y%m') as YM
FROM `purchase` as p
LEFT JOIN purchase_detail as d ON p.id = d. purchase_id
LEFT JOIN product as s ON d.product_id = s.id
WHERE created BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY d.product_id  , DATE_FORMAT(created,'%Y%m')
ORDER BY  YM";

$stmt=$pdo->prepare($sql);
$stmt->execute();

 $count =[]; 

foreach( $stmt as $row){
  if($row['name']==$name[0]){
    $addpoint[$name[0]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[1]){
    $addpoint[$name[1]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[2]){
    $addpoint[$name[2]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[3]){
    $addpoint[$name[3]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[4]){
    $addpoint[$name[4]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[5]){
    $addpoint[$name[5]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[6]){
    $addpoint[$name[6]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[7]){
    $addpoint[$name[7]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[8]){
    $addpoint[$name[8]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[9]){
    $addpoint[$name[9]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[10]){
    $addpoint[$name[10]][$row['YM']] = $row['count'];
  }else if($row['name']==$name[11 ]){
    $addpoint[$name[11]][$row['YM']] = $row['count'];

  }

  $count[] = $row['count'];
}

foreach ($addpoint as $key => $value) {
  // echo PHP_EOL, $key ; //ピスタチオ

  foreach ($ym as $k){ 
   $mydata[$key][] = isset($value[$k]) ? $value[$k] : 0 ;
  }
}
// $ym = ["January","February","March","April","May","June","July","August",'sep','nov'];
// print_r($mydata);
//  exit; [41,-2,-21,-40,44,-48,-6,22,23,33]
$x = 900 ; $y = 330;

$myPicture = new pDraw($x,$y);
$myPicture->myData->addPoints($mydata[$name[0]],$name[0]);
$myPicture->myData->setSerieDescription($name[0],"Pistachio");
$myPicture->myData->setSerieOnAxis($name[0],0);

$myPicture->myData->addPoints([2,1,3,2,1,2,0,2,0,1],"Serie2");
$myPicture->myData->setSerieDescription("Serie2","Serie 2");
$myPicture->myData->setSerieOnAxis("Serie2",0);

$myPicture->myData->addPoints([2,0,1,2,2,1,0,0,2,4],"Serie3");
$myPicture->myData->setSerieDescription("Serie3","Serie 3");
$myPicture->myData->setSerieOnAxis("Serie3",0);

$myPicture->myData->addPoints($ym,"Absissa"); //x軸項目名
$myPicture->myData->setAbscissa("Absissa");

$myPicture->myData->setAxisProperties(0, ["Name" => "1st axis", "Position" => AXIS_POSITION_LEFT, "Unit" => ""]);
$Settings = ['Color'=>new pColor(170,183,87), 'Dash'=>DIRECTION_VERTICAL, 'DashColor'=>new pColor(190,203,107)];
$myPicture->drawFilledRectangle(0,0,$x,$y,$Settings);
$Settings = ["StartColor"=> new pColor(219,231,139),"EndColor"=> new pColor(1,138,68)];
$myPicture->drawGradientArea(0,0,$x,$y,DIRECTION_VERTICAL,$Settings);

$myPicture->drawRectangle(0,0,$x-1,$y-1,["Color"=>new pColor(0)]);

$myPicture->setShadow(TRUE,["X"=>1,"Y"=>1,"Color"=>new pColor(50,50,50,20)]);

$myPicture->setFontProperties(["FontName"=>"fonts/Cairo-Regular.ttf","FontSize"=>14]);
$TextSettings = ['Align'=>TEXT_ALIGN_MIDDLEMIDDLE, 'Color'=>new pColor(255)];
$myPicture->drawText(350,25,"My first pChart project",$TextSettings);

$myPicture->setShadow(FALSE);
$myPicture->setGraphArea(50,50,$x-50,$y-30);
$myPicture->setFontProperties(["Color"=> new pColor(0),"FontName"=>"fonts/Cairo-Regular.ttf","FontSize"=>7]);

$Settings = ['Pos'=>SCALE_POS_LEFTRIGHT, 'Mode'=>SCALE_MODE_ADDALL, 'LabelingMethod'=>LABELING_ALL, 'GridColor'=>new pColor(255,255,255,50), 'TickColor'=>new pColor(0,0,0,50), 'LabelRotation'=>0, 'CycleBackground'=>DIRECTION_VERTICAL, 'DrawXLines'=>DIRECTION_VERTICAL, 'DrawSubTicks'=>DIRECTION_VERTICAL, 'SubTickColor'=>new pColor(255,0,0,50), 'DrawYLines'=>ALL];
$myPicture->drawScale($Settings);

$myPicture->setShadow(TRUE,["X"=>1,"Y"=>1,"Color"=>new pColor(50,50,50,10)]);

$Config = ['DisplayValues'=>DIRECTION_VERTICAL, 'Gradient'=>DIRECTION_VERTICAL];
(new pCharts($myPicture))->drawStackedBarChart($Config);

$Config = ['FontColor'=>new pColor(0,0,0,30), 'FontName'=>"fonts/Cairo-Regular.ttf", 'FontSize'=>7, 'Margin'=>6, 'BoxSize'=>5, 'Style'=>LEGEND_NOBORDER, 'Mode'=>LEGEND_HORIZONTAL, 'Family'=>LEGEND_FAMILY_BOX];
$myPicture->drawLegend(555,16,$Config);

$myPicture->stroke();

?>