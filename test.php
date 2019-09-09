<?php

$read = file('input.txt');

$depen = [];

foreach ($read as $line) {
    $arr = explode("=>",$line);
	if(trim($line) != '')
	$depen[trim($arr[0])] = trim($arr[1]);
}

 echo "<pre>";
print_r($depen);

function buildTree(array $elements, $parent = '') {
    $branch = array();
	$item = array();
	
    foreach ($elements as $key => $element) {
		
		if($key == $element) return "  That jobs can’t depend on themselves ";
		
        if ($element == $parent) {
			$item["value"] = $key;
			
            $children = buildTree($elements, $key);
            if ($children) {
                $item['child'] = $children;				
            }		
				
            $branch[] = $item;
			unset($item);
        } 
		
		
    }

    return $branch;
}

$TreeArray = buildTree($depen);
//print_r($TreeArray);

function printOut($TreeArray)
{   	
    foreach($TreeArray as $item)
    {       
        if(is_array($item)) 
        {
             printOut($item);
        }
        else
        {
            echo $item . ' ';
        }
       
    }
   
}
if(is_array($TreeArray))
	printOut($TreeArray);
 
?>