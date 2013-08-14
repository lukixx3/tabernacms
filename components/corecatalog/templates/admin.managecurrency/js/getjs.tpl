var REFRESH_URL = '{url href="action=getList"}';
var ADDWINDOW_URL = '{url href="action=addwindow"}';
var ADD_ONE_URL = '{url href="action=add"}';
var DELETE_ONE_URL = '{url href="action=deleteone"}';
var GET_PRODUCTS_CNT_URL = '{url href="action=getproductsbycur"}'; 
var EDIT_ONE_URL = '{url href="action=editone"}';
var APPLY_CLICK_URL = '{url href="action=applysave"}';

var FAILED_REQUEST = "{lang code="requestisfiled.catalog.text" htmlchars=true}";
var ADD_CURRENCY_TITLE = "{lang code="addcurrency.catalog.title" htmlchars=true}";
var DELETE_ONE_QUERY = "{lang code="currencydeleteone.catalog.query" htmlchars=true ucf=true}";
var ADDCURRENCY_WTITLE = "{lang code="addeditcurrency.catalog.title" htmlchars=true}";
var PRODUCTS_FOUND = "{lang code="productsfound.catalog.text" htmlchars=true ucf=true}";
var ERROR_CURRENCY_ZERO = "{lang code="rateiszero.catalog.error" htmlchars=true ucf=true}"; 

var HASH = '{$hash}';

{literal}
RADCurrency = {
    add: function()
    {
        var req = new Request({
            url: ADDWINDOW_URL,
            onSuccess: function(txt){
                if($('CurrencyAddWindow'))
                    $('CurrencyAddWindow').destroy();
                showAllSelects();
                var wheight = Window.getHeight();
                if(wheight>410){
                    wheight = 410;
                }
                wheight = wheight-50;
                var wnd = new dWindow({
                       id:'CurrencyAddWindow',
                       content: txt,
                       width: 390,
                       height: wheight,
                       minWidth: 180,
                       minHeight: 160,
                       left: 450,
                       top: 150,
                       title: ADD_CURRENCY_TITLE
                   }).open($(document.body));
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        }).send();
    },
    applyClick: function()
    {
        if(this.validateCurrency('CurrencyListForm')){
            var req = new Request({
                url:APPLY_CLICK_URL,
                data: $('CurrencyListForm').toQueryString(),
                onSuccess: function(txt){
                    eval(txt);
                },
                onFailure: function(){
                    alert(FAILED_REQUEST);
                }
            }).send();
        }
    },
    validateCurrency: function(id_form)
    {
        var error = false;
        var course_input = $(id_form).getElements('input[name^=cur_cost]');
        if(course_input.length > 0){
            for(var i=0;i < course_input.length;i++){
                course_input[i].value = course_input[i].value.replace(',', '.');
                if(course_input[i].value==0 || isNaN(+course_input[i].value)){
                    error = true;
                    course_input[i].setStyle('border','1px solid red');
                    course_input[i].focus();
                }else{
                    course_input[i].setStyle('border','1px solid #CCCCCC');    
                }
            }
        }
        if(error){
            alert(ERROR_CURRENCY_ZERO);
            return false;
        }else{
            return true;
        }
    },
    deleteClick: function(id,cur_name)
    {
        var has_products = 0;
        var req = new Request({
            url: GET_PRODUCTS_CNT_URL+'cur_id/'+id+'/',
            onSuccess: function(txt) {
                var conf = 1;
                var prod_cnt = parseInt(txt);
                if(prod_cnt > 0) {
                    conf = confirm(DELETE_ONE_QUERY+String.fromCharCode(10)+String.fromCharCode(13)+cur_name+String.fromCharCode(10)+String.fromCharCode(13)+PRODUCTS_FOUND+String.fromCharCode(10)+String.fromCharCode(13)+prod_cnt);
                } else {
                    conf = confirm(DELETE_ONE_QUERY);
                }
                if(conf) {
                    var req = new Request({
                        url: DELETE_ONE_URL+'cur_id/'+id+'/',
                        data:{hash:HASH},
                        onSuccess: function(txt) {
                            eval(txt);
                        },
                        onFailure: function() {
                            alert(FAILED_REQUEST);
                        }
                    }).send();
                }
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        }).send();
    },
    editClick: function(cur_id)
    {
        var req = new Request({
            url: EDIT_ONE_URL+'cur_id/'+cur_id+'/',
            onSuccess: function(txt){
                if($('CurrencyAddWindow'))
                    $('CurrencyAddWindow').destroy();
                showAllSelects();
                var wheight = Window.getHeight();
                if(wheight>430){
                    wheight = 430;
                }
                wheight = wheight-50;
                var wnd = new dWindow({
                       id:'CurrencyAddWindow',
                       content: txt,
                       width: 390,
                       height: wheight,
                       minWidth: 180,
                       minHeight: 160,
                       left: 450,
                       top: 150,
                       title: ADD_CURRENCY_TITLE
                   }).open($(document.body));
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        }).send();
    },
    cancelnewclick: function()
    {
        $('CurrencyAddWindow').destroy();
        showAllSelects();
    },
    submitnewclick: function()
    {
        if(this.validateCurrency('addCurrencyForm')){
            var req = new File.Upload({
                url: ADD_ONE_URL,
                form: 'addCurrencyForm',
                images: ['cur_image'],
                onComplete: function(response){
                    eval(response);
                } /* ,
                onFailure: function(){
                    alert(FAILED_REQUEST);
                }*/
            }).send();
       }
    },
    refresh: function()
    {
        var req = new Request({
            url: REFRESH_URL,
            onSuccess: function(txt){
                $('currency_list').set('html',txt);
                if(Browser.Engine.trident)
                    startList();
            },
            onFailure: function(){
                alert(FAILED_REQUEST);
            }
        }).send();
    },
    message: function(message)
    {
        document.getElementById('ManageCurrencyMessage').innerHTML = message;
        setTimeout("document.getElementById('ManageCurrencyMessage').innerHTML = '';",5000);
    }
}
window.onload = function(){RADCurrency.refresh();}
{/literal}