{strip}
{if empty($items)}
    <center>{lang code="norecords.catalog.text" ucf=true}</center>
{else}
<table cellpadding="0" cellspacing="0" border="0" class="tb_list" id="tb_list" width="100%">
    <tr class="header">
        <td>A</td>
        <td>{lang code='deliveryname.catalog.title' ucf=true}</td>
        <td>{lang code='deliverycurrency.catalog.title' ucf=true}</td>
        <td>{lang code='deliverycost.catalog.title' ucf=true}</td>
        <td>{lang code='-action'}</td>
    </tr>
    {foreach from=$items item=item}
    <tr style="height:42px;">
        <td>
            <a id="active_del_link_{$item->rdl_id}_1" href="javascript:RADDelivery.setActive(0,{$item->rdl_id});" {if !$item->rdl_active} style="display:none;"{/if}>
                <img id="img_active_cat_{$item->rdl_id}" src="{url type="image" module="core" preset="original" file="actions/activeround.gif"}" border="0" alt="{lang code='-turnoff' ucf=true htmlchars=true}" title="{lang code='-turnoff' ucf=true htmlchars=true}" />
            </a>
            <a id="active_del_link_{$item->rdl_id}_0" href="javascript:RADDelivery.setActive(1,{$item->rdl_id});" {if $item->rdl_active} style="display:none;"{/if}>
                <img id="img_active_cat_{$item->rdl_id}" src="{url type="image" module="core" preset="original" file="actions/notactiveround.gif"}" border="0" alt="{lang code='-turnon' ucf=true htmlchars=true}" title="{lang code='-turnon' ucf=true htmlchars=true}" />
            </a>
        </td>
        <td>{$item->rdl_name}</td>
        <td>{currency get='shortname' id="`$item->rdl_currency`"}</td>
        <td>{$item->rdl_cost}</td>
        <td>
            <a href="{lang code="-edit" ucf='true' htmlchars=true}" onclick="return RADDelivery.editRow({$item->rdl_id});">
                <img src="{url type="image" module="core" preset="original" file="backend/billiard_marker.png"}" alt="{lang code="-edit" ucf=true htmlchars=true}" title="{lang code="-edit" ucf=true htmlchars=true}" border="0" />
            </a>
            <a href="{lang code="-delete" ucf='true' htmlchars=true}" onclick="return RADDelivery.deleteRow({$item->rdl_id});">
                <img src="{url type="image" module="core" preset="original" file="backend/icons/cross.png"}" alt="{lang code="-delete" ucf=true htmlchars=true}" title="{lang code="-delete" ucf=true htmlchars=true}" border="0" />
            </a>
        </td>
    </tr>
    {/foreach}
</table>
{/if}
{/strip}