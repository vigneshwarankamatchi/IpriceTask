
## Installation

### Overview
- 'Google Chrome Browser'
- 'Python 3.4'
- 'Robot Framework'
- 'ChromeDriver'


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


# Run Command: -->

# robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_1.robot
# robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_2.robot
# robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_1_bdd.robot


# one click install
Pip install -r requirements.txt
