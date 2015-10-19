<?php
$filexml='2015.xml';
$filecsv='2015.csv';

if (file_exists($filexml))
{
	$xml = simplexml_load_file($filexml);
	$f = fopen($filecsv, 'w');
	createCsv($xml, $f);
	fclose($f);
}

function createCsv($xml,$f, $parent="")
{

	foreach ($xml->children() as $item)
	{
		$hasChild = (count($item->children()) > 0) ? true : false ;
		if( ! $hasChild)
		{
			$val = trim($item);
			$val = preg_replace("/\r\n|\r|\n/",'',$val);
			$val = preg_replace("/,/",'.',$val);
			$put_arr = array($parent."_".$item->getName(), $val );
			fputcsv($f, $put_arr ,',','"');
		}
		else{
			createCsv($item, $f, $parent."_".$item->getName());
		}
	}

}
?>
