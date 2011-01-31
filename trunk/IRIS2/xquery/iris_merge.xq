xquery version "1.0";

declare namespace iris="http://www.aeat.com/iris";

(: files :)
declare variable $format := 'input/ippc_elvbat_questionnaire.xml';
(:declare variable $info as xs:string external;:)
declare variable $info := 'input/sk_questionnaire_ippc_elvbat.xml';


declare function iris:get_top_level($i as node()){
  for $n in doc($format)//Questionnaire/installation-combustion-row[@status=$i/@status]/question
  return 
    iris:get_node_set($n, $i)
    
};

declare function iris:get_node_set($n, $i){
	if ( contains( string($n/@id), "row" ) ) then
		if (exists($i//node()[name()=$n/@old_id])) then
			for $set in $i//node()[name()=$n/@old_id]
			return
				iris:rc($n, $set)
				
		else if (exists($i//node()[name()=concat('Quest20081elvbat-',$n/@old_id)])) then
			for $set in $i//node()[name()=concat('Quest20081elvbat-',$n/@old_id)]
			return
				iris:rc($n, $set)
				
		else if (exists($i//node()[name()=concat('Quest20081elvbat-',$n/@id)])) then
			for $set in $i//node()[name()=concat('Quest20081elvbat-',$n/@id)]
			return
				iris:rc($n, $set)
		
		else ()
	else
			iris:rc($n, $i)

};

(: function iris:get_info_name :)


declare function iris:rc($n as node(), $i as node()){
	  if (exists($n[child::node()])) then
		
		if ( exists($n/@exclude) ) then

		<question id="{string($n/@id)}" text="{string($n/@text)}" exclude="true"> 	
		  {for $m in $n/*
		  return
			iris:get_node_set($m, $i)}
		</question>
  
		else 
		
		<question id="{string($n/@id)}" text="{string($n/@text)}"> 	
		  {for $m in $n/*
		  return
			iris:get_node_set($m, $i)}
		</question>
	  
	  else 
		
		
		  iris:get_text($n, $i)
    
};

declare function iris:get_text($n as node(), $in as node() ){	
	if (exists($in//node()[name()=$n/@old_id])) then
  
		for $i in $in//node()[name()=$n/@old_id]
		return 
			iris:format_text($n,$i)
  
	
	else if (exists($in//node()[name()=concat('Quest20081elvbat-',$n/@old_id)])) then
    
		for $i in $in//node()[name()=concat('Quest20081elvbat-',$n/@old_id)]
		return 
			iris:format_text($n,$i)
	
	else if (exists($in//node()[name()=concat('Quest20081elvbat-',$n/@id)])) then
    
		for $i in $in//node()[name()=concat('Quest20081elvbat-',$n/@id)]
		return 
			iris:format_text($n,$i)
	
	else if (exists($in//node()[name()=$n/@id])) then
  
		for $i in $in//node()[name()=$n/@id]
		return 
			iris:format_text($n,$i)
	  
	else ()
    
};

declare function iris:format_text($n as node(),$i as node()){
	if (exists($n/@exclude)) then
	<question id="{string($n/@id)}" text="{string($n/@text)}" exclude="true">{$i/text()}</question>
	else
	<question id="{string($n/@id)}" text="{string($n/@text)}" >{$i/text()}</question>
};


<Questionnaire xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.eionet.europa.eu/schemas/ippc-wi/dir20081elvbat_schema.xsd" xml:lang="en">
{
for $n in doc($info)//installation-combustion-row
return
  <installation-combustion-row status='{string($n/@status)}'>{iris:get_top_level($n)}</installation-combustion-row>
}
</Questionnaire>

