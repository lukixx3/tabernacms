var SITE_URL = '{const SITE_URL}';
var SITE_ALIAS = '{const SITE_ALIAS}';
var ERROR_CHOOSE_ITEM = "{lang code="chooseitem.menus.error" ucf=true|replace:'"':'&quot;'}";
var QUESTION_DELETE_NODE = "{lang code="askdeletenode.menus.query" ucf=true|replace:'"':'&quot;'}";
var DEL_TYPE_QUERY = "{lang code="deletetype.catalog.query" ucf=true|replace:'"':'&quot;'}";
var MANAGE_TYPES_ROOT_NODE = "{lang code="rootnodetypes.catalog.text"|replace:'"':'&quot;'}";
var TREE_THEME = SITE_URL+'jscss/components/mootree/mootree.gif';
var LOADER_ICO = SITE_URL+'jscss/components/mootree/mootree_loader.gif';
var LOADING_TEXT = "{lang code="-loading"|replace:'"':'&quot;'}";
var LOAD_URL = '{url href="action=getnodes"}';
var MANAGE_MEASUREMENT_URL = '{url href="action=managemeasurement"}';
var ROOT_PID = '{$ROOT_PID}';
var ROOT_NODE_TEXT = "{lang code="rootnode.catalog.text"|replace:'"':'&quot;'}";
var EDIT_FORM_URL = '{url href="action=editnode"}';
var DELETE_SFORM_URL = "{url href="action=deletenode"}";
var SAVE_FORM_URL = '{url href="action=savenode"}';
var LIST_TYPEVAL_URL = '{url href="action=showlist"}';
var ADD_TYPEFIELD_URL = '{url href="action=addfieldform"}';
var ADD_TYPEFIELD1_URL = '{url href="action=addfield"}';
var ADD_NODE_URL = '{url href="action=addnewnode"}';
var DEL_TYPEFIELD_URL = '{url href="action=delfield"}';
var SAVE_TYPEFIELD_URL = '{url href="action=savefield"}';
var UPDATE_MEASURES_LIST_URL = '{url href="alias=CATmanagetypesXML&action=gets.IE.measurement"}';
var GET_NEW_PID =  '{url href="action=newlngpid"}';

var FAILED_REQUEST = "{lang code="requestisfiled.catalog.text" ucf=true|replace:'"':'&quot;'}";
var ManageMeasurementsTitle = "{lang code="managemeasurements.catalog.title" ucf=true|replace:'"':'&quot;'}";
var AddFieldTitle = "{lang code="addfield.catalog.title" ucf=true ucf=true|replace:'"':'&quot;'}";
//ALERTS
var ENTER_FIELD_NAME = "{lang code="enterfieldname.catalog.message" ucf=true|replace:'"':'&quot;'}";
//TREE
var ERROR_CHOOSE_ITEM = "{lang code="chooseitem.menus.text" ucf=true|replace:'"':'&quot;'}";
var QUESTION_DELETE_NODE = "{lang code="deletenodetype.catalog.query" ucf=true|replace:'"':'&quot;'}";
var nl = String.fromCharCode(10)+String.fromCharCode(13);
var HASH = '{$hash}';
{literal}
RADCatTypesAction = {
    addNewNode: function()
    {
        if( RADMooTree.tree && RADMooTree.tree.selected && RADMooTree.tree.selected.id>0){
            var req = new Request({
                url:ADD_NODE_URL+'node_id/'+RADMooTree.tree.selected.id+'/',
                onSuccess: function(txt){
                    eval(txt);
                },
                onFailure: function(){
                    alert(FAILED_REQUEST);
                }
            }).send();
        }else{
            alert(ERROR_CHOOSE_ITEM);
        }
    },
    addNewTypeClick: function()
    {
        if(RADMooTree.tree.selected.id>0){
            this.addEditNewType(RADMooTree.tree.selected.id,0);
        }
    },
    TypeAddFieldWindowCancelClick: function()
    {
        if($('TypeAddFieldWindow')){
            $('TypeAddFieldWindow').destroy();
        }
    },
    TypeAddFieldWindowSubmitClick: function()
    {
        var messages= new Array();
        if($('vl_name').value.length==0)
            messages.push(ENTER_FIELD_NAME);
        var data = $('addFieldForm').toQueryString();
        var sURL = ADD_TYPEFIELD1_URL;
        if($('vl_save_type_vl_id')){
            sURL = SAVE_TYPEFIELD_URL;
        }
        if(messages.length==0){
            var req = new Request({
                url: sURL,
                data: data,
                method: 'post',
                onSuccess: function(txt){
	                eval(txt);
	            },
	            onFailure: function(){
	                alert(FAILED_REQUEST);
	            }
            }).send();
        }else{
            var message='';
            for(var i=0; i < messages.length; i++){
                message += messages[i];
            }
            alert(message);
        }
    },
    showSEditForm: function(node_id)
    {
        var req = new Request({
            url: EDIT_FORM_URL+'id/'+node_id+'/',
            onSuccess: function(txt){
                $('editCatTreeBlock').style.visibility='visible';
                $('editCatNode').set("html",txt);
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        });
        req.send();
    },//showSEditForm
    saveSEditForm: function(node_id){
        var req = new Request({
            url: SAVE_FORM_URL+'id/'+node_id+'/',
            data: $('editNodeForm').toQueryString(),
            onSuccess: function(txt){
                eval(txt);
            },
            onFailture: function(){
                alert(FAILED_REQUEST);
            }
        }).send();
    },
    cancelSEditForm: function()
    {
        $('editCatTreeBlock').style.visibility = 'hidden';
    },
    deleteSEditForm: function()
    {
        if( RADMooTree.tree && RADMooTree.tree.selected && RADMooTree.tree.selected.id>0 && confirm(QUESTION_DELETE_NODE)){
             var req = new Request({
                url: DELETE_SFORM_URL+'node_id/'+RADMooTree.tree.selected.id+'/',
                data:{hash:HASH},
                onSuccess: function(txt){
                    eval(txt);
                },
                onFailure: function(){
                    alert(FAILED_REQUEST);
                }
             }).send();
         }
    },
    showListTypes: function(node_id)
    {
        var req = new Request({
            url: LIST_TYPEVAL_URL+'id/'+node_id+'/',
            onSuccess: function(txt){
                $('listCatNode').set("html",txt);
                $('list_block').style.visibility = 'visible';
                if(Browser.Engine.trident)
                    startList();
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        });
        req.send();
    },//showListTypes
    addEditNewType: function(node_id,vl_id)
    {
        var req = new Request({
	        url: ADD_TYPEFIELD_URL+'id/'+node_id+'/vl_id/'+vl_id+'/',
	        onSuccess: function(txt){
	            if($('TypeAddFieldWindow')){
	                $('TypeAddFieldWindow').destroy();
	            }
	            if(!$('TypeAddFieldWindow')){
	               var wheight = Window.getHeight();
	               if(wheight>350){
	                   wheight = 350;
	               }
	               var wnd = new dWindow({
	                   id:'TypeAddFieldWindow',
	                   content: txt,
	                   width: 450,
	                   height: wheight,
	                   minWidth: 180,
	                   minHeight: 160,
	                   left: 450,
	                   top: 150,
	                   title: AddFieldTitle
	               }).open($(document.body));
	           }
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        });
        req.send();
        //alert('add new type field for '+node_id);
    },//function addNewType
    delType: function(node_id,tre_id,value)
    {
        if(confirm(DEL_TYPE_QUERY+nl+value)){
            var req = new Request({
                url: DEL_TYPEFIELD_URL+'id/'+node_id+'/tre_id/'+tre_id+'/',
                data: {hash:HASH},
                onSuccess: function(txt){
                    eval(txt);
                },
                onFailure: function(){
	                alert(FAILED_REQUEST);
	            }
            }).send();
        }
    },//delType
    //block the add field fiendow add show the new JS window with edit measurements
    editMeasurements: function(){
        var req = new Request({
            url: MANAGE_MEASUREMENT_URL,
            evalScripts: true,
            onSuccess: function(txt){
                if($('ManageMeasurementsWindow')){
                    $('ManageMeasurementsWindow').destroy();
                }
                if(!$('ManageMeasurementsWindow')){
                   var wheight = Window.getHeight();
                   if(wheight>650){
                       wheight = 650;
                   }
                   wheight = wheight-50;
                   var wnd = new dWindow({
                       id:'ManageMeasurementsWindow',
                       content: txt,
                       width: 550,
                       height: wheight,
                       minWidth: 180,
                       minHeight: 160,
                       left: 450,
                       top: 150,
                       title: ManageMeasurementsTitle
                   }).open($(document.body));
                   $('closeBtnManageMeasurementsWindow').addEvent('click',RADCatMeasurementAction.cancelClick);
                   if($('TypeAddFieldWindow')){
			           $('TypeAddFieldWindow').style.display="none";
			       }
			       RADCatTypesAction.updateMeasures(true);
               }
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        });
        req.send();
    },//editMeasurements
    updateMeasures: function(showItems)
    {
        var req = new Request({
            url: UPDATE_MEASURES_LIST_URL,
            evalScripts: true,
            onSuccess: function(txt){
                eval(txt);
                if(showItems){
                    RADCatMeasurementAction.showItems();
                }else{
                    RADCatTypesAction.updateMeasuresList();
                }
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        }).send();
    },
    //Update the select box in add field window
    updateMeasuresList: function()
    {
        clearSel($('vl_measurement_id'));
        for(var ms_id in RADCatMeasurementAction.mesvalues){
            addSelect($('vl_measurement_id'),RADCatMeasurementAction.mesvalues[ms_id],ms_id);
        }
    }
}

RADMooTree = {
    tree: null,
    oldID: 0,
    init: function()
    {
	    this.tree = new MooTreeControl({
	        div: 'rad_mtree',
	        mode: 'files',
	        theme: TREE_THEME,
	        loader: {icon:LOADER_ICO, text:LOADING_TEXT, color:'a0a0a0'},
	        grid: true,
	        onSelect: function(node, state) {
	           $('editCatTreeBlock').style.visibility='hidden';
               $('list_block').style.visibility='hidden';
	           if(node.id && state){
	               if(node.data.islast!=0)
	                   RADCatTypesAction.showListTypes(node.id);
	           }//if state and node.id
	               //alert(node.data.islast);
	        }
	    },{
	        text: ROOT_NODE_TEXT,
	        open: true
	    });
	    this.tree.disable(); // this stops visual updates while we're building the tree...
	    //tree.adopt('adoptme');
	    //tree.expand();
	    this.tree.root.load(LOAD_URL+'pid/'+ROOT_PID+'/');
        this.tree.root.id = ROOT_PID;
	    this.tree.enable(); // this turns visual updates on again.
    },//function init
    addNode: function()
    {
        if (this.tree.selected){
	        var curID = this.tree.selected.id;
	        alert(curID);
	    }else{
	       alert(ERROR_CHOOSE_ITEM);
	    }
    },
    addItemNode: function(id,name)
    {
        if (this.tree.selected){
            var new_node = this.tree.selected.insert( { text:name, data: { name:id,'islast':'1'} } );
            this.tree.select( new_node );
            this.tree.selected.id = id;
        }else{
            alert(ERROR_CHOOSE_ITEM);
        }
    },
    refresh: function()
    {
	    $('editCatTreeBlock').style.visibility='hidden';
		$('list_block').style.visibility = 'hidden';
        RADMooTree.tree.disable();
        RADMooTree.tree.root.load(LOAD_URL+'pid/'+ROOT_PID+'/');
        RADMooTree.tree.enable();
    },
	changeContntLang: function(lngid,lngcode)
    {
       var req = new Request({
           url: GET_NEW_PID+'i/'+lngid+'/',
           onSuccess: function(txt){
              $('list_block').style.visibility = 'hidden';
			  $('editCatTreeBlock').style.visibility='hidden';
			  $('listCatNode').set("html",'');
              if (RADMooTree.tree.selected)
                RADMooTree.tree.selected.id = undefined;
              eval(txt);
           },
           onFailure: function(){
              alert(FAILED_REQUEST);
           }
       }).send();
    },
    message: function(message)
    {
        document.getElementById('CatalogTypesMessage').innerHTML = message;
        setTimeout("document.getElementById('CatalogTypesMessage').innerHTML = '';",5000);
    }
}//RADMooTree
RADCHLangs.addContainer('RADMooTree.changeContntLang');

window.onload = function() {
    RADMooTree.init();
}
{/literal}