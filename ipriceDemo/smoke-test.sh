#!/bin/bash

# Run Setup
mkdir -p Reports; rm -f Reports/*.html Reports/*.png Reports/*.xml;

# Run Security Matrix Test Suite
time parallel --jobs 250% --delay 15 --progress pybot --nostatusrc -d Reports -o "{#}_case.xml" -l "{#}_case.log" -r "{#}_case.html" -i "{#}_case" -v platform:mac -v browser:chrome -v url:https://ytlschool03-iot-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:SmokeAdminSatu@portaldev.ytlcomms.my -v admin_password:frogtest -v student_id:SmokeStudentSatu@portaldev.ytlcomms.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:SmokeParentSatu@portaldev.ytlcomms.my -v parent_password:frogtest Smoke-Test/Smoke-Test-Case.robot ::: {0..15}

# Merge Reports
rebot --outputdir Reports --output all.xml --merge Reports/*.xml

# Delete Inividual Reports
#rm Reports/*_case.html Reports/*_case.xml Reports/*_case.log
http://www.aaronsw.com/2002/diff/
http://www.aaronsw.com/2002/diff/

--outputdir my_robot_results my_test_suite


# pybot --nostatusrc -d Reports -i "smoke-test" -v platform:linux -v browser:chrome -v url:https://ytlschool03-iot-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:SmokeAdminSatu@portaldev.ytlcomms.my -v admin_password:frogtest -v student_id:SmokeStudentSatu@portaldev.ytlcomms.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:SmokeParentSatu@portaldev.ytlcomms.my -v parent_password:frogtest Smoke-Test/Smoke-Test-Case.robot

# pybot --nostatusrc -d Reports -i "smoke-test" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://ytlschool03-iot-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:SmokeAdminSatu@portaldev.ytlcomms.my -v admin_password:frogtest -v student_id:SmokeStudentSatu@portaldev.ytlcomms.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:SmokeParentSatu@portaldev.ytlcomms.my -v parent_password:frogtest Smoke-Test/Smoke-Test-Case.robot

# pybot --nostatusrc -d Reports -i "9_case" -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot


# pybot --nostatusrc -d Reports -i "smoke-test" -v platform:linux -v env:iot -v browser:chrome -v url:https://ytlschool02-iot-web01.1bestarinet.net -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:FROGme_Student_ONE --escape space:_ -v parent_id:frogmeparent4@yes1.my -v parent_password:frogtest Smoke-Test/Smoke-Test-Case.robot

pybot --nostatusrc -d Reports -i "6_case" -v platform:windows -v env:stg -v school_name:iot -v browser:chrome -v url:https://ytlschool02-stg-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:Lim.Ying@portalpreprod.ytlcomms.my -v admin_password:frogtest -v student_id:Lim.Roy@portalpreprod.ytlcomms.my -v student_password:frogtest -v student_name:Roy_Lim --escape space:_ -v parent_id:L.Larry@portalpreprod.ytlcomms.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot


# pybot -V vars/malaysia_uat_unified.yaml TestCases/Smoke-Test/Smoke-Test-Case.robot

pybot --nostatusrc -d Reports -i "TC01" -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest TestCases/Feature/App-Assignments.robot



pybot --nostatusrc -d Reports -i "TC03" -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest -v TestCases/Feature/App-Assignments.robot

pybot --nostatusrc -d Reports -i "High" -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest  TestCases/Feature/App-Assignments.robot


-v Assignment Name:firstAssignment

 -v env:production -v school_name:SMK_Alam_Jaya 

Assignment Name: firstAssignment



pybot --nostatusrc -d Reports -i "High" 

-v platform:windows 
-v env:production 
-v school_name:SMK_Alam_Jaya --escape space:_ 
-v browser:chrome 
-v url:https://frogasiatraining3.1bestarinet.net 
-v build:MY 
-v saml:yes 
-v admin_id:floradmeight@yes.my 
-v admin_password:frogtest 
-v student_id:FlorStuSix@yes.my 
-v student_password:frogtest 
-v student_name:FlorStuSix 
-v parent_id:FlorParSix@yes.my 
-v parent_password:frogtest 
TestCases/Feature/App-Assignments.robot



pybot --nostatusrc -d Reports -i "test123" -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest  TestCases/Feature/Gherkin-Keywords.robot


pybot -V vars/Variables.xlsx -i "High" TestCases/Feature/App-Assignments.robot



-v platform:windows

pybot --nostatusrc -d Reports -i "smoke-test" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://ytlschool03-iot-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:SmokeAdminSatu@portaldev.ytlcomms.my -v admin_password:frogtest -v student_id:SmokeStudentSatu@portaldev.ytlcomms.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:SmokeParentSatu@portaldev.ytlcomms.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot

pybot --nostatusrc -d Reports -i "1_case" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://ytlschool03-iot-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:SmokeAdminSatu@portaldev.ytlcomms.my -v admin_password:frogtest -v student_id:SmokeStudentSatu@portaldev.ytlcomms.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:SmokeParentSatu@portaldev.ytlcomms.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot


# pybot --nostatusrc -d Reports -i "smoke-test" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest TestCases/merge-master/Smoke-Test-Case.robot

# pybot --nostatusrc -d Reports -i "6_case" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest TestCases/merge-master/Smoke-Test-Case.robot


pybot --nostatusrc -d Reports -i "1_case" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest merge-master/TestCases/Smoke-Test-Case.robot


pybot --nostatusrc -d Reports -i "2_case" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest TestCases/merge-master/Smoke-Test-Case.robot


pipenv run pybot -d Reports -i "smoke-test" -V "vars/pybotrun.yaml" -v platform:linux  TestCases/Smoke-Test/Smoke-Test-Case.robot


pybot --nostatusrc -d Reports -i "1_case" -i "5_case" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest merge-master/TestCases/Smoke-Test-Case.robot


http://jenkinsdev.frogasia.local:8080/job/Ramesh/job/Smoke-Test/ws/Reports/



pybot --nostatusrc -d Reports -i "13_case" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest merge-master/TestCases/Smoke-Test-Case.robot



//span[@class="resource-app-svg-icon ui-app-svg-icon ui-app-icon-learncentre"]


pybot --nostatusrc -d Reports -i "11_case" -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot
   

   
pybot --nostatusrc -d Reports -i "smoke-test" --timestampoutputs --log mylog.html --report NONE -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot  
   

   
pybot --nostatusrc -d Reports -i "14_case" --timestampoutputs --log mylog.html --report NONE -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogos-web-robot.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:'FROGIOT Student 1' -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot


  https://frogos-web-robot.origin.frogasia.local/
   
  https://frogos-web-robot.origin.frogasia.local

  FROGIOT Student 1
	
pybot --nostatusrc -d Reports -i "14_case" --timestampoutputs --log mylog.html --report NONE -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot 


we can do Timestamping output files using robot built in features.
Ex: pybot --timestampoutputs --log mylog.html --report NONE tests.robot


//span[@class="gritter-title"] <span class="growl-title"> Assignment </span> 


pybot --nostatusrc -d Reports -i "14_case" --timestampoutputs --log mylog.html --report NONE -v platform:windows -v env:production -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://frogasiatraining3.1bestarinet.net -v build:MY -v saml:yes -v admin_id:floradmeight@yes.my -v admin_password:frogtest -v student_id:FlorStuSix@yes.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:FlorParSix@yes.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot


pybot --nostatusrc -d Reports -i "1_case" --timestampoutputs --log mylog.html --report report -v platform:windows -v env:iot -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:FlorStuSix -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest merge-master/TestCases/Smoke-Test-Case.robot


pybot --nostatusrc -d Reports -i "14_case" --timestampoutputs --log mylog.html --report report -v platform:windows -v env:iot -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:Student -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest merge-master/TestCases/Smoke-Test-Case.robot




pybot --nostatusrc -d Reports -i "14_case" -v platform:windows -v env:iot -v school_name:SMK_Alam_Jaya --escape space:_ -v browser:chrome -v url:https://merge-master-frogos.origin.frogasia.local/ -v build:MY -v saml:yes -v admin_id:frogmeadmin1@yes1.my -v admin_password:frogtest -v student_id:frogmestudent1@yes1.my -v student_password:frogtest -v student_name:Student -v parent_id:frogmeparent1@yes1.my -v parent_password:frogtest merge-master/TestCases/Smoke-Test-Case.robot

//div[@class="ui-form-label os-ellipsis"]//a[normalize-space(text())='Smoke Test Polls']
//div[@class='widget-settings']//label[text()='Choose Media']



//div[@class='fs-container']//span[@id='Everything']
//div[@class='fs-container discover']//span[@id='Everything']

//div[@class='ui-os-desktop frog-touch-scroll ']//div[@class='handle hide-mobile close-editor']
//div[@class='ui-os-desktop frog-touch-scroll ']//button[text()='Save Changes']


//div[@aria-labelledby="ui-id-3"]//a[@class="ui-closer"]

//a[@class="ui-closer"]//span[@class="ff-cross-mono"]

//div[@class="ui-os-app-iframe-overlay"]
style="z-index: 1;">

http://blog.xebia.com/the-robot-framework-remote-library-interface-using-the-remote-database-library-to-connect-to-ibm-db2/


//div[@class='sidebar-menu frog-touch-scroll']//li[contains(@class, 'ui-site-label resources-sites verticalmenu')]

//a[@title="Sites"]//p[@class="show"]


# pybot --nostatusrc -d Reports -i "smoke-test" -v platform:windows -v env:iot -v school_name:iot -v browser:chrome -v url:https://ytlschool03-iot-web02.1bestarinet.net -v build:MY -v saml:yes -v admin_id:SmokeAdminSatu@portaldev.ytlcomms.my -v admin_password:frogtest -v student_id:SmokeStudentSatu@portaldev.ytlcomms.my -v student_password:frogtest -v student_name:SmokeStudentSatu -v parent_id:SmokeParentSatu@portaldev.ytlcomms.my -v parent_password:frogtest TestCases/Smoke-Test/Smoke-Test-Case.robot


