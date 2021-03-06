{strip}
<div id="editOrderPanel">   
<script language="JavaScript" type="text/javascript">
var SITE_URL = '{const SITE_URL}';
var SITE_ALIAS = '{const SITE_ALIAS}';
var GET_PRODUCTS_ROOT_URL = '{url href="alias=CATCatalogJS&action=getProductsRootJSON"}';
var GET_PRODUCTS_URL = '{url href="alias=CATCatalogJS&action=getProductsJSON"}';
var OPEN_PRODUCTS_TREE = '{url href="alias=CATCatalogJS&action=openProductsTree"}';
var ADD_PRODUCTS = "{lang code='addproductswindow.catalog.text' ucf=true htmlchars=true}";
var FAILED_REQUEST = "{lang code='requestisfiled.catalog.text' ucf=true htmlchars=true}";
</script>
{url type="css" module="" file="miftree/miftree.css"}
{url type="js" module="" file="miftree/miftree.js" load="inplace"}
<style type="text/css">
{literal}#center_right_col {position:relative;}{/literal}
</style>
{url href="alias=SITE_ALIASXML&action=getjs" type="js"}
<script type="text/javascript">
    var ptree = new RADProductsTree({
        retContainer:'RADOrders.addProducts', 
        catId: '{$params->products_tree_id}'
        });
        
    RADOrders.order_id = '{$order_id}';
</script>
<div class="w100">
    <div class="kord_right_col">
        <h1 id="manageOrderTitle">{lang code='manageorder.catalog.title' ucf=true}</h1>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr><td>

            <table id="detailClientBlock" cellpadding="0" cellspacing="0" border="0" class="tb_cont_block" style="height:auto;width:auto;" align="left">
                <tr>
                    <td class="corner_lt"></td>
                    <td class="header_top"></td>
                    <td class="corner_rt"></td>
                </tr>
                <tr>
                    <td class="left_border"></td>
                    <td class="header_bootom" style="height:28px;">
                        <div class="hb">
                            <div class="hb_inner">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <div class="block_header_title">{lang code='clientdetail.catalog.title' ucf=true}</div>
                                    </td>
                                    <td>
                                        <div class="block_header_title" style="text-align: right;"></div>
                                    </td>
                                </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                    <td class="right_border"></td>
                </tr>
                <tr>
                    <td class="left_border" nowrap="nowrap" style="width:3px;"></td>
                    <td align="left" id="panel_orderDetail" align="center">
                        <table cellpadding="3" cellspacing="0" border="0" align="center" style="width:375px;" class="tb_list">
                            <tr>
                                <td>
                                    {lang code='dateorder.catalog.text' ucf=true}:
                                </td>
                                <td>
                                    {$order->order_dt}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {lang code='codeorder.catalog.title' ucf=true}
                                </td>
                                <td>
                                    {$order->order_num}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {lang code='orderaddress.catalog.text' ucf=true} 
                                </td>
                                <td>
                                    {$order->order_address}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {lang code='-email' ucf=true}
                                </td>
                                <td>
                                    {$order->order_email}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {lang code='fioorder.catalog.text' ucf=true}
                                </td>
                                <td>
                                    {$order->order_fio}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {lang code='phoneorder.catalog.text' ucf=true}
                                </td>
                                <td>
                                    {$order->order_phone}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {lang code='commentsorder.catalog.text' ucf=true}
                                </td>
                                <td>
                                    {$order->order_comments}
                                </td>
                            </tr>
                            {if $order->order_delivery}
                            <tr>
                                <td>
                                    {lang code='orderdelivery.catalog.text' ucf=true}
                                </td>
                                <td>
                                    {$order->delivery->rdl_name}
                                </td>
                            </tr>
                            {/if}
                        </table>
                    </td>
                    <td class="right_border" style="width:3px;" nowrap="nowrap"></td>
                </tr>
                <tr>
                    <td class="left_border"></td>
                    <td class="gray_line">

                    </td>
                    <td class="right_border"></td>
                </tr>
                <tr>
                    <td class="corner_lb"></td>
                    <td class="tb_bottom"></td>
                    <td class="corner_rb"></td>
                </tr>
            </table>

</tr></td>
<tr><td width="100%">

            <table id="pageslist_block" cellpadding="0" cellspacing="0" border="0" class="tb_cont_block" style="height:auto;width:100%;margin-top:15px;">
                <tr>
                    <td class="corner_lt"></td>
                    <td class="header_top"></td>
                    <td class="corner_rt"></td>
                </tr>
                <tr>
                    <td class="left_border"></td>
                    <td class="header_bootom">
                        <div class="hb">
                            <div class="hb_inner">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <div class="block_header_title">{lang code='orderdetail.catalog.title' ucf=true}</div>
                                    </td>
                                    <td>
                                        <div class="block_header_title" style="text-align: right;"><span class="red_color" id="ShowOrderMessage"></span></div>
                                    </td>
                                </tr>
                                </table>
                                <div class="tb_line_ico">
                                    <table class="item_ico">
                                        <tr>
                                            <td>            
                                                <a href="javascript:ptree.showProductTree();">
                                                    <img src="{url type="image" module="core" preset="original" file="backend/add.png"}" alt="{lang code="-add" ucf=true htmlchars=true}" title="{lang code="-add" ucf=true htmlchars=true}" border="0" />
                                                    <span class="text" style="width:50px;">{lang code="-add" ucf=true htmlchars=true}</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="item_ico">
                                        <tr>
                                            <td>            
                                                <a href="javascript:RADOrders.refresh();">
                                                    <img src="{url type="image" module="core" preset="original" file="backend/arrow_rotate_clockwise.png"}" alt="{lang code='-refresh' ucf=true htmlchars=true}" title="{lang code='-refresh' ucf=true htmlchars=true}" width="30" height="30" border="0">
                                                    <span class="text" style="width:50px;">{lang code='-refresh' ucf=true}</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="item_ico" align="left" style="float:left;margin-top:10px;">
                                       <tr>
                                           <td height="100%" valign="bottom" nowrap="nowrap" width="100%">
                                                <form method="post" id="searchOrdersForm" action="{url href="action=search"}" onsubmit="return false;">
                                                    <div>
                                                        <div style="float:left;">
                                                        {lang code='ordersstate.catalog.title' ucf=true}<br />
                                                        <select id="order_status" name="order_status">
                                                        {if count($types)}
                                                          {foreach from=$types item=type}
                                                          <option value="{$type->tre_id}"{if $type->tre_id eq $order->order_status} selected="selected"{/if}>{$type->tre_name}</option>
                                                          {/foreach}
                                                        {/if}
                                                        </select>
                                                        </div>
                                                        <div style="float:left;margin-top:10px;"><input type="image" src="{url type="image" module="core" preset="original" file="backend/disk.png"}" alt="{lang code='-save' htmlchars=true}" title="{lang code='-save' htmlchars=true}"  onclick="RADOrders.saveStatus({$order->order_id});" /></div>
                                                    </div>
                                                </form>
                                           </td>
                                       </tr>
                                    </table>
                                    <div class="clear_rt"></div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="right_border"></td>
                </tr>
                <tr>
                    <td class="left_border" nowrap="nowrap" style="width:3px;"></td>
                    <td align="left" id="panel_orderDetailshow">
                        {include file="$_CURRENT_LOAD_PATH/admin.manageorders/panels/showorder.tpl"}
                    </td>
                    <td class="right_border" style="width:3px;" nowrap="nowrap"></td>
                </tr>
                <tr>
                    <td class="left_border"></td>
                    <td class="gray_line">

                    </td>
                    <td class="right_border"></td>
                </tr>
                <tr>
                    <td class="corner_lb"></td>
                    <td class="tb_bottom"></td>
                    <td class="corner_rb"></td>
                </tr>
            </table>

</tr></td></table>

    </div>
</div>
</div>  
{/strip}