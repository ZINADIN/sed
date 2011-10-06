<?php

/**
 * This is the detail-action it will display the details of a module.
 *
 * @package		backend
 * @subpackage	extensions
 *
 * @author		Dieter Vanden Eynde <dieter@netlash.com>
 * @since		3.0
 */
class BackendExtensionsModuleDetail extends BackendBaseActionIndex
{
	/**
	 * Module we request the details of.
	 *
	 * @var	string
	 */
	private $currentModule;


	/**
	 * Datagrids.
	 *
	 * @var	BackendDataGrid
	 */
	private $dataGridEvents;


	/**
	 * Information fetched from the info.xml.
	 *
	 * @var	array
	 */
	private $information = array();


	/**
	 * List of warnings.
	 *
	 * @var	array
	 */
	private $warnings = array();


	/**
	 * Execute the action.
	 *
	 * @return	void
	 */
	public function execute()
	{
		// get parameters
		$this->currentModule = $this->getParameter('module', 'string');

		// does the item exist
		if($this->currentModule !== null && BackendExtensionsModel::existsModule($this->currentModule))
		{
			// call parent, this will probably add some general CSS/JS or other required files
			parent::execute();

			// load data
			$this->loadData();

			// load datagrid
			$this->loadDataGridEvents();

			// parse
			$this->parse();

			// display the page
			$this->display();
		}

		// no item found, redirect to index, because somebody is fucking with our url
		else $this->redirect(BackendModel::createURLForAction('modules') . '&error=non-existing');
	}


	/**
	 * Load the data.
	 * This will also set some warnings if needed.
	 *
	 * @return	void
	 */
	private function loadData()
	{
		// inform that the module is not installed yet
		if(!BackendExtensionsModel::isInstalled($this->currentModule))
		{
			$this->warnings[] = array('message' => BL::getMessage('InformationModuleIsNotInstalled'));
		}

		// path to information file
		$pathInfoXml = BACKEND_MODULES_PATH . '/' . $this->currentModule . '/info.xml';

		// information needs to exists
		if(SpoonFile::exists($pathInfoXml))
		{
			// load info.xml
			$infoXml = @simplexml_load_file($pathInfoXml, null, LIBXML_NOCDATA);

			// valid XML
			if($infoXml !== false)
			{
				// convert xml to useful array
				$this->information = BackendExtensionsModel::processInformationXml($infoXml);

				// empty data (nothing useful)
				if(empty($this->information)) $this->warnings[] = array('message' => BL::getMessage('InformationFileIsEmpty'));
			}

			// warning that the information file is corrupt
			else $this->warnings[] = array('message' => BL::getMessage('InformationFileCouldNotBeLoaded'));
		}

		// warning that the information file is missing
		else $this->warnings[] = array('message' => BL::getMessage('InformationFileIsMissing'));
	}


	/**
	 * Load the data grid which contains the events.
	 *
	 * @return	void
	 */
	private function loadDataGridEvents()
	{
		// no hooks so dont bother
		if(!isset($this->information['events'])) return;

		// create data grid
		$this->dataGridEvents = new BackendDataGridArray($this->information['events']);

		// no paging
		$this->dataGridEvents->setPaging(false);
	}


	/**
	 * Parse.
	 *
	 * @return	void
	 */
	private function parse()
	{
		// set module name
		$this->tpl->assign('name', $this->currentModule);
		$this->tpl->assign('warnings', $this->warnings);
		$this->tpl->assign('information', $this->information);
		$this->tpl->assign('isInstallable', !BackendExtensionsModel::isInstalled($this->currentModule));

		// data grids
		$this->tpl->assign('dgEvents', (isset($this->dataGridEvents) && $this->dataGridEvents->getNumResults() > 0) ? $this->dataGridEvents->getContent() : false);
	}
}

?>