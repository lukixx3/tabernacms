{strip}
<script type="text/javascript" src="{url href="alias=SITE_ALIASXML&action=getjs"}"></script>
<script type="text/javascript">
$('#profile').addClass('act');
$('#profile').removeAttr('href');
</script>
<h2>{lang code='editprofile.session.title' ucf=true}</h2>
<br/>
{if !empty($userInfo)}
<center>
    <h3>{lang code="markedfieldsrequired.others.text" ucf=true}</h3>
</center>
<form id="editprofile_form" action="" method="post">
	<table cellpadding="0" cellspacing="0" border="0" width="400">
	   {if isset($message)}
	    <tr>
            <td colspan="2" align="center"><span style="color:red;">{$message}</span></td>
        </tr>
	   {/if}
	    <tr>
	        <td align="right" nowrap="nowrap" width="30%">
	           {lang code="nickname.session.text"}&nbsp;<span style="color:red;">*</span>
	        </td>
	        <td align="left"><input id="u_login" class="user" name="u_login" type="text" value="{$userInfo->u_login|default:''}"/></td>  
	    </tr>
	    <tr>
	        <td align="right" nowrap="nowrap" width="35%">
	           {lang code="email.session.text"}&nbsp;<span style="color:red;">*</span>
	        </td>
	        <td align="left"><input id="u_email" class="user" name="u_email" type="text" value="{$userInfo->u_email|default:''}"/></td>
	    </tr>
	    
	    
	    <tr>
            <td align="right" nowrap="nowrap" width="35%">
               {lang code="fio.session.text"}
            </td>
            <td align="left"><input id="u_fio" class="user" name="u_fio" type="text" value="{$userInfo->u_fio|default:''}"/></td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" width="35%">
               {lang code="phone.session.text"}
            </td>
            <td align="left"><input id="u_phone" class="user" name="u_phone" type="text" value="{$userInfo->u_phone|default:''}"/></td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" width="35%">
               {lang code="address.session.text"}
            </td>
            <td align="left"><input id="u_address" class="user" name="u_address" type="text" value="{$userInfo->u_address|default:''}"/></td>
        </tr>
        {if !empty($userInfo->u_pass) and  !empty($userInfo->u_facebook_id)}
        <tr>
            <td align="right" nowrap="nowrap" width="35%"></td>
			<td align="left">
			   <br />&nbsp;&nbsp;&nbsp;
			   <input id="changepass" name="changepass" type="checkbox"/>
			   <label for="changepass">&nbsp;{lang code="changepass.session.text" ucf=true}</label>
			</td>
        </tr>
        <tr>
            <td colspan="2">
		        <table id="tab_pass" cellpadding="0" cellspacing="0" border="0">
		        <tr>
		            <td align="right" nowrap="nowrap" width="35%">{lang code="currentpassword.session.text"}&nbsp;<span style="color:red;">*</span></td>
		            <td align="left"><input id="u_pass" class="user" name="u_pass" type="password" value=""/></td>
		        </tr>
			    <tr>
			        <td align="right" nowrap="nowrap" width="35%">{lang code="newpassword.session.text"}&nbsp;<span style="color:red;">*</span></td>
			        <td align="left"><input id="u_pass1" class="user" name="u_pass1" type="password" value=""/></td>
			    </tr>
			    <tr>
			        <td align="right" nowrap="nowrap" width="35%">{lang code="confirmpassword.session.text"}&nbsp;<span style="color:red;">*</span></td>
			        <td align="left"><input id="u_pass2" class="user" name="u_pass2" type="password" value=""/></td>
			    </tr>
			    </table>
		    </td>
	    </tr>
	    {/if}		    
	    <tr>
	       <td></td>
	       <td align="left">
	           <input type="hidden" name="hash" value="{$hash|default:''}"/>
	           <input type="hidden" name="u_id" value="{$userInfo->u_id|default:''}"/>
	           <input type="hidden" name="sub_action" value="edit"/>
	           <input type="button" class="btnblue tx wt enter" onclick="javascript:rad_profile.editClick();" value="{lang code="-edit" ucf=true}"/>
	       </td>
	    </tr>
	</table>
</form>
{/if}
{/strip}