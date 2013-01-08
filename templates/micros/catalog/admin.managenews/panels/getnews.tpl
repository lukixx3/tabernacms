{strip}
{if count($items)}
<table cellpadding="0" cellspacing="0" border="0" class="tb_list" id="tb_list" width="100%">
    <tr class="header">
        <td>A</td>
        <td>ID</td>
        <td>{lang code='newstitle.catalog.title' ucf=true}</td>
        <td>{lang code='newsimage.catalog.title' ucf=true}</td>
        <td>{lang code='newsdate.catalog.title' ucf=true}</td>
        <td>{lang code='-action' ucf=true}</td>
    </tr>
    {foreach from=$items item=item}
    <tr style="height:42px;">
        <td>
            <a id="active_news_link_{$item->nw_id}_1" href="javascript:RADNews.setActive(0,{$item->nw_id});" {if !$item->nw_active} style="display:none;"{/if}><img id="img_active_news_{$item->nw_id}" src="{const SITE_URL}img/actions/activeround.gif" border="0" alt="{lang code='-turnoff' ucf=true}" title="{lang code='-turnoff' ucf=true}" /></a>
            <a id="active_news_link_{$item->nw_id}_0" href="javascript:RADNews.setActive(1,{$item->nw_id});" {if $item->nw_active} style="display:none;"{/if}><img id="img_active_news_{$item->nw_id}" src="{const SITE_URL}img/actions/notactiveround.gif" border="0" alt="{lang code='-turnon' ucf=true}" title="{lang code='-turnon' ucf=true}" /></a>
        </td>
        <td>{$item->nw_id}</td>
        <td>{$item->nw_title}</td>
        <td>{if strlen($item->nw_img)}<img src="{const SITE_URL}image.php?w=60&h=30&m=news&f={$item->nw_img}" alt="{$item->nw_title|replace:'"':'&quot;'}" title="{$item->nw_title|replace:'"':'&quot;'}" border="0" />{/if}</td>
        <td>{$item->nw_datenews|date:"datecal"}</td>
        <td>
            <a href="javascript:RADNews.editRow({$item->nw_id});">
                <img src="{const SITE_URL}img/backend/billiard_marker.png" alt="{lang code="-edit" ucf=true|replace:'"':'&quot;'}" title="{lang code="-edit" ucf=true|replace:'"':'&quot;'}" border="0" />
            </a>
            <a href="javascript:RADNews.deleteRow({$item->nw_id});">
                <img src="{const SITE_URL}img/backend/icons/cross.png" alt="{lang code="-delete" ucf=true|replace:'"':'&quot;'}" title="{lang code="-delete" ucf=true|replace:'"':'&quot;'}" border="0" />
            </a>
        </td>
    </tr>
    {/foreach}
    <tr>
    {***  PAGING  ****}
    <td colspan="5" align="left" style="text-align:left;" id="td_paging">
    {if $pages_count!=$page}{lang code="page.system.link" ucf=true}:&nbsp;
        {section name="paginator" start=1 loop=$pages_count step=1}
            {if $smarty.section.paginator.index eq $page}
                &nbsp;{$smarty.section.paginator.index}&nbsp;
            {else}
                <a href="javascript:RADNewsTree.paging({$smarty.section.paginator.index});"> {$smarty.section.paginator.index} </a>
            {/if}
        {/section}
    {/if}
    </td>
    <td>{lang code="-total" ucf=true}:{$total_rows}</td>
    {***  END PAGING  ****}
    </tr>
</table>
{else}
<div align="center">{lang code="norecords.catalog.text" ucf=true}</div>
{/if}
{/strip}