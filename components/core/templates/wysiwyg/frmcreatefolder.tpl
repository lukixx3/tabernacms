<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--
 * Page used to create new folders in the current folder.
-->
<html>
    <head>
        <title>Create Folder</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        {url module="core" file="wysiwyg/browser.css" type="css"}
        {url module="core" file="wysiwyg/js/common.js" type="js" load="sync"}
        {rad_jscss::getHeaderCode()}
        <script type="text/javascript">{literal}

function SetCurrentFolder( resourceType, folderPath )
{
    oConnector.ResourceType = resourceType ;
    oConnector.CurrentFolder = folderPath ;
}

function CreateFolder()
{
    var sFolderName ;

    while ( true )
    {
        sFolderName = prompt( 'Type the name of the new folder:', '' ) ;

        if ( sFolderName == null )
            return ;
        else if ( sFolderName.length == 0 )
            alert( 'Please type the folder name' ) ;
        else
            break ;
    }

    oConnector.SendCommand( 'CreateFolder', 'NewFolderName/' + encodeURIComponent(sFolderName) + '/', CreateFolderCallBack ) ;
}

function CreateFolderCallBack( fckXml )
{
    if ( oConnector.CheckError( fckXml ) == 0 )
        window.parent.frames['frmResourcesList'].Refresh() ;

    // Get the current folder path.
    var oNode = fckXml.SelectSingleNode( 'Connector/Error' ) ;
    var iErrorNumber = parseInt( oNode.attributes.getNamedItem('number').value ) ;

    switch ( iErrorNumber )
    {
        case 0 :
            window.parent.frames['frmResourcesList'].Refresh() ;
            break ;
        case 101 :
            alert( 'Folder already exists' ) ;
            break ;
        case 102 :
            alert( 'Invalid folder name' ) ;
            break ;
        case 103 :
            alert( 'You have no permissions to create the folder' ) ;
            break ;
        case 110 :
            alert( 'Unknown error creating folder' ) ;
            break ;
        default :
            alert( 'Error creating folder. Error number: ' + iErrorNumber ) ;
            break ;
    }
}

window.onload = function()
{
    window.top.IsLoadedCreateFolder = true ;
}
{/literal}</script>
    </head>
    <body>
        <table class="fullHeight" cellSpacing="0" cellPadding="0" width="100%" border="0">
            <tr>
                <td>
                    <button type="button" style="WIDTH: 100%" onclick="CreateFolder();">
                        <table cellSpacing="0" cellPadding="0" border="0">
                            <tr>
                                <td><img height="16" alt="" src="{url module="core" file="wysiwyg/folder.gif" preset="original" type="image"}" width="16"></td>
                                <td>&nbsp;</td>
                                <td nowrap>Create New Folder</td>
                            </tr>
                        </table>
                    </button>
                </td>
            </tr>
        </table>
    </body>
</html>