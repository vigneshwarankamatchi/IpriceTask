# FrogOS-Automation-RobotFramework

> This project is mainly for Malaysia build

## Installation

### Overview
- 'Google Chrome Browser'
- 'Python 2.7'
- 'Robot Framework'
- 'ChromeDriver'
- 'Xvfb'
- 'GNU Parallel'

#### Python

Python 2.7 is the recommended version to be used with the Robot Automation framework.

Download: https://www.python.org/downloads/

#### Robot Framework

Once the Python has been installed you can then use 'PIP' to install the Robot Framework itself.

To use the PIP you will need to open CMD or Terminal and enter the following command:

```bash
$ pip install robotframework
```

#### SeleniumLibrary

You will now need to install the Selenium2 library to execute the tests themselves.

To use the PIP you will need to open CMD or Terminal and enter the following command:

```bash
$ pip install robotframework-SeleniumLibrary
```

#### ChromeDriver

The ChromeDriver will allow the tests to be executed in the Chrome Browser iteself.

Download: https://sites.google.com/a/chromium.org/chromedriver/downloads

Setup instructions can be found here: https://sites.google.com/a/chromium.org/chromedriver/getting-started

#### GNU Parallel

GNU Parallel is used to execute the tests in parallel which means the test suite can complete in 15 minutes instead of 50 minutes.

> See https://www.gnu.org/software/parallel/parallel_tutorial.html

#### Xvfb

>  From https://github.com/drobota/robotframework-xvfb#readme

```
$ pip install robotframework-xvfb
```

## Usage

> See http://robotframework.org/#documentation for more information on using the Robot Framework

### For whole test

#### platform_name = windows or linux
#### browser_name = chrome or firefox
#### school_url = ie:https://ytlschool01-iot-web01.1bestarinet.net
#### saml = yes or no

```bash
$ pybot --variable platform:$platform_name --variable browser:$browser_name --variable url:$school_url --variable saml:$saml /path/to/testcase/folder
$ pybot -v platform:platform_name -v browser:$browser_name -v url:$school_url -v saml:$saml /path/to/testcase/folder
```

### For individual test

```bash
$ pybot --variable platform:$platform_name --variable browser:$browser_name --variable url:$school_url --variable saml:$saml /path/to/testcase/folder/$testcase_name
$ pybot -v platform:$platform_name -v browser:$browser_name -v url:$school_url -v saml:$saml /path/to/testcase/folder/$testcase_name
```

### For including test with tags

```bash
$ pybot --include $tags-name --variable platform:$platform_name --variable browser:$browser_name --variable url:$school_url --variable saml:$saml /path/to/testcase/folder
$ pybot -i $tags-name -v platform:$platform_name -v browser:$browser_name -v url:$school_url -v saml:$saml /path/to/testcase/folder
```

### For excluding test with tags

```bash
$ pybot --exclude $tags-name --variable platform:$platform_name --variable browser:$browser_name --variable url:$school_url --variable saml:$saml /path/to/testcase/folder
$ pybot -e $tags-name -v platform:$platform_name -v browser:$browser_name -v url:$school_url -v saml:$saml /path/to/testcase/folder
```

### Addition commands

#### Add timestamp to report name

```bash
$ pybot --timestampoutputs
```

#### Save report to an existing folder

```bash
$ pybot --outputdir /path/to/that/folder
```

#### Save report to a new folder with timestamp

```bash
$ pybot --outputdir /path/to/folder/%date:~-4,4%%date:~-10,2%%date:~-7,2% --timestampoutputs
```
