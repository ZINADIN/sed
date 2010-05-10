<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<meta http-equiv="X-UA-Compatible" content="chrome=1">

	<title>Installer - Fork CMS</title>
	<link rel="shortcut icon" href="/backend/favicon.ico" />
	<link rel="stylesheet" type="text/css" media="screen" href="/backend/core/layout/css/screen.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="/install/layout/css/installer.css" />
	<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="/backend/core/layout/css/conditionals/ie7.css" /><![endif]-->
</head>
<body id="installer">
	<table border="0" cellspacing="0" cellpadding="0" id="installHolder">
		<tr>
			<td>
				<div id="installerBox" >
					<div id="installerBoxTop">
						<h2>Pre-install checks</h2>
					</div>

					{$error}

					<form action="/install/index.php?step=1" method="post" id="step1" class="forkForms">
						<div>
							<input type="hidden" value="1" id="step" name="step" />
							<div class="horizontal">
								<p>We checked if your server configuration meets the minimum requirements to run Fork CMS. You can find the results below.</p>

								<h3>PHP Version <span class="{$phpVersion}">{$phpVersionStatus}</span></h3>
								<p>We require at least PHP 5.2.</p>
							</div>

							<div>
								<h3>Extensions</h3>
								<h4>cURL: <span class="{$extensionCURL}">{$extensionCURLStatus}</span></h4>
								<p>cURL is a library that allows you to connect and communicate to many different type of servers. More information can be found on: <a href="http://php.net/curl">http://php.net/curl</a>.</p>

								<h4>SimpleXML: <span class="{$extensionSimpleXML}">{$extensionSimpleXMLStatus}</span></h4>
								<p>The SimpleXML extension provides a very simple and easily usable toolset to convert XML to an object that can be processed with normal property selectors and array iterators. More information can be found on: <a href="http://php.net/simplexml">http://php.net/simplexml</a>.</p>

								<h4>SPL: <span class="{$extensionSPL}">{$extensionSPLStatus}</span></h4>
								<p>SPL is a collection of interfaces and classes that are meant to solve standard problems. More information can be found on: <a href="http://php.net/SPL">http://php.net/SPL</a>.</p>

								<h4>PDO: <span class="{$extensionPDO}">{$extensionPDOStatus}</span></h4>
								<p>PDO provides a data-access abstraction layer, which means that, regardless of which database you're using, you use the same functions to issue queries and fetch data. More information can be found on: <a href="http://php.net/pdo">http://php.net/pdo</a>.</p>

								<h4>mb_string: <span class="{$extensionMBString}">{$extensionMBStringStatus}</span></h4>
								<p>mbstring provides multibyte specific string functions that help you deal with multibyte encodings in PHP. In addition to that, mbstring handles character encoding conversion between the possible encoding pairs. mbstring is designed to handle Unicode-based encodings. More information can be found on: <a href="http://php.net/mb_string">http://php.net/mb_string</a>.</p>

								<h4>iconv: <span class="{$extensionIconv}">{$extensionIconvStatus}</span></h4>
								<p>This module contains an interface to iconv character set conversion facility. With this module, you can turn a string represented by a local character set into the one represented by another character set, which may be the Unicode character set. More information can be found on: <a href="http://php.net/iconv">http://php.net/iconv</a>.</p>

								<h4>GD2: <span class="{$extensionGD2}">{$extensionGD2Status}</span></h4>
								<p>PHP is not limited to creating just HTML output. It can also be used to create and manipulate image files in a variety of different image formats. More information can be found on: <a href="http://php.net/gd">http://php.net/gd</a>.</p>
							</div>

							<div>
								<h3>Filesystem</h3>
								<h4>{$WWW_PATH}/backend/cache/* <span class="{$fileSystemBackendCache}">{$fileSystemBackendCacheStatus}</span></h4>
								<p>In this location all files created by the backend will be stored.</p>
								<h4>{$WWW_PATH}/frontend/cache/* <span class="{$fileSystemFrontendCache}">{$fileSystemFrontendCacheStatus}</span></h4>
								<p>In this location all files created by the frontend will be stored.</p>
								<h4>{$WWW_PATH}/frontend/files/* <span class="{$fileSystemFrontendFiles}">{$fileSystemFrontendFilesStatus}</span></h4>
								<p>In this location all files uploaded by the user/modules will be stored.</p>
								<h4>{$SPOON_PATH} <span class="{$fileSystemLibrary}">{$fileSystemLibraryStatus}</span></h4>
								<p>This location must be writable for the installer, afterwards this folder only needs to be readable.</p>
								<h4>{$WWW_PATH}/installer <span class="{$fileSystemInstaller}">{$fileSystemInstallerStatus}</span></h4>
								<p>This location must be writable for the installer.</p>
							</div>

							<div>
								<p class="spacing">
									<input id="installer" class="inputButton button mainButton" type="submit" name="installer" value="Next" />
								</p>
							</div>
						</div>
					</form>
					<ul id="installerNav">
						<li><a href="http://userguide.fork-cms.be">Gebruikersgids</a></li>
						<li><a href="http://docs.fork-cms.be">Developer</a></li>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>