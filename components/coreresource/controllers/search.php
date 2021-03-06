<?php
/**
 * Search result
 */
class controller_coreresource_search extends rad_controller
{
    /**
     * Which search system will be used
     * @var string
     */
    private $_searchsystem = 'sphinx';

    protected $_itemsPerPage = 10;

    function __construct()
    {
        if ($this->request('send')) {
            $this->redirect($this->makeURL(
                'alias=search&s='.urlencode($this->request('search'))
                .($this->substringSearchChecked() ? '&ss=1' : '')
            ));
        }
        if ($this->getParamsObject()) {
            $params = $this->getParamsObject();
            $this->_searchsystem = $params->_get('searchsystem', $this->_searchsystem);
            $this->_ya_username = $params->_get('ya_username');
            $this->_ya_key = $params->_get('ya_key');
            $this->setVar('params', $params);
        }
        $this->setVar('search_results', array());
        $searchPhrase = $this->request('s', '');
        $this->setVar('search_str', $searchPhrase);
        $this->setVar('gp', 's='.urlencode($searchPhrase).($this->substringSearchChecked() ? '&ss=1' : ''));
        $page = ($page = (int)$this->request('p')) ? $page : 0;
        if (!empty($this->_searchsystem)) {
            $this->setVar('searchsystem', $this->_searchsystem);
            $searchModel = rad_instances::get('model_coreresource_search');
            $searchModel->setState('search_str', $searchPhrase);
            $searchModel->setState('search_system', $this->_searchsystem);
            $searchModel->setState('limit', array($page * $this->_itemsPerPage, $this->_itemsPerPage));
            $searchModel->setState('lang_id', $this->getCurrentLangID());
            switch($this->_searchsystem){
                case 'sphinx':
                    $searchEntities = rad_config::getParam('sphinx.entities', 'catalog|news|pages|articles');
                    $searchModel->setState('search_entities', explode('|', $searchEntities));
                    $searchModel->setState(
                        'substring_mode',
                        (rad_config::getParam('sphinx.substring_search') == 'always') || $this->substringSearchChecked()
                    );
                    break;
                case 'google':
                    $searchModel->setState('search_host', $this->config('hostname'));
                    $searchModel->setState('page', $page);
                    break;
                case 'yandex':
                    if (empty($this->_ya_username) or empty($this->_ya_key)) {
                        $error = $this->lang('keynotfound.serach.error');
                    } else {
                        $searchModel->setState('search_host', $this->config('hostname'));
                        //$searchModel->setState('search_host', 'www.tabernacms.com');
                        $searchModel->setState('user', $this->_ya_username);
                        $searchModel->setState('key', $this->_ya_key);
                        $searchModel->setState('page', $page);
                    }
                    break;
            }
            if (!empty($error)) {
                $this->setVar('error_message', $error);
            } else {
                if ($this->request('action') == 'autocomplete') {
                    $this->setVar('action', $this->request('action'));
                    $searchModel->setState('search_str', $this->get('term', ''));
                    $this->setVar('autocomplete_json', $searchModel->getAutocompleteJSON());
                } else {
                    $this->setVar('search_results', $searchModel->getSearchResult());
                    if ($searchResultCount = $searchModel->getSearchResultCount()) {
                        $pages = div((int)$searchResultCount, $this->_itemsPerPage);
                        $pages += ($searchResultCount % $this->_itemsPerPage) ? 1 : 0;
                        $this->setVar('pages_count', $pages + 1);
                        $this->setVar('page', $page + 1);
                        $this->setVar('currPage', (int)$this->request('p', $page));
                    } else {
                        $this->setVar('pages_count', 0);
                        $this->setVar('page', 1);
                        $this->setVar('currPage', (int)$this->request('p', 0));
                    }
                }
            }
        }
    }

    private function substringSearchChecked(){
        return rad_config::getParam('sphinx.on')
            && (rad_config::getParam('sphinx.substring_search') == 'allow')
            && $this->request('ss');
    }
}