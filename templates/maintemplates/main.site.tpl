{strip}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <title>{const RAD_BC_TITLE}</title>
    <META NAME="ROBOTS" CONTENT="INDEX,FOLLOW">
    <META NAME="revisit-after" CONTENT="1 days">
    <META name="description" content="{const RAD_BC_METADESCRIPTION}">
    <META name="keywords" content="{const RAD_BC_METATAGS}">
    
    <script language="JavaScript" type="text/javascript">
        var SITE_URL = '{const SITE_URL}';
        var SITE_ALIAS = '{const SITE_ALIAS}';
        var URL_SYSXML = '{url href="alias=SYSXML"}';
        var URL_LANGID = '{$_CURR_LANG_}';
    </script>
    {url file="jscss/components/jquery/jquery.js" type="js"}
    {url file="jscss/des/default/product.js" type="js"}
    {url file="jscss/components/radbin.js" type="js"}
    {url file="jscss/des/default/style.css" type="css" param="link"}
</head>
<body>

{if !empty($header)}{$header}{/if}
        
{if isset($top)}{$top}{/if}
	
<div class="lpart"> 
    
    {if isset($left)}{$left}{/if}

</div>
<div class="rpart">
            
	{if isset($center)}{$center}{/if}
		
</div>
		
<div class="linesold"></div>
    {if isset($bottom)}{$bottom}{/if}
    {if !empty($footer)}{$footer}{/if}
		
			
</div>
</div>
</body>
</html>
{/strip}