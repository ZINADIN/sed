<?php

/**
 * BackendBlogAddCategory
 *
 * This is the add-action, it will display a form to create a new post
 *
 * @package		backend
 * @subpackage	blog
 *
 * @author 		Davy Hellemans <davy@netlash.com>
 * @since		2.0
 */
class BackendBlogAdd extends BackendBaseActionAdd
{
	/**
	 * Execute the action
	 *
	 * @return	void
	 */
	public function execute()
	{
		// call parent, this will probably add some general CSS/JS or other required files
		parent::execute();

		// load the form
		$this->loadForm();

		// validate the form
//		$this->validateForm();

		// parse the page
		$this->parse();

		// display the page
		$this->display();
	}


	/**
	 * Load the form
	 *
	 * @return	void
	 */
	private function loadForm()
	{
		// create form
		$this->frm = new BackendForm('add');

		$this->meta = new BackendMeta($this->frm, null, 'Title', true);

		// create elements
		$this->frm->addTextField('title');
		$this->frm->addEditorField('text');
		$this->frm->addEditorField('introduction');
		$this->frm->addButton('save', ucfirst(BL::getLabel('Save')), 'submit', 'inputButton button mainButton');
	}


	/**
	 * Validate the form
	 *
	 * @return	void
	 */
	private function validateForm()
	{
		// is the form submitted?
		if($this->frm->isSubmitted())
		{
			// cleanup the submitted fields, ignore fields that were added by hackers
			$this->frm->cleanupFields();

			// validate fields
			$this->frm->getField('name')->isFilled(BL::getError('NameIsRequired'));

			// no errors?
			if($this->frm->isCorrect())
			{
				// build item
				$category = array();
				$category['name'] = $this->frm->getField('name')->getValue();
				$category['language'] = BL::getWorkingLanguage();
				$category['url'] = BackendBlogModel::getURLForCategory($category['name']);

				// insert the item
				$id = BackendBlogModel::insertCategory($category);

				// everything is saved, so redirect to the overview
				$this->redirect(BackendModel::createURLForAction('categories') .'&report=added&var='. urlencode($category['name']) .'&highlight=id-'. $id);
			}
		}
	}
}

?>