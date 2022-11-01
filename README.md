# Step-by-Step Instructions

1. Open your web browser (e.g. Microsoft Edge) and navigate to https://pwb-test.publichealthscotland.org/auth-sign-in
2. Enter your LDAP user credentials (the same username and password you use to log into the old RStudio Server Pro environment) at the login screen, and click the "Sign In" button.
![image](https://user-images.githubusercontent.com/45657289/199207525-4c36f541-c4fd-47e8-b86a-bd5488e89410.png)
3. Click the "+ New Session" button.
![image](https://user-images.githubusercontent.com/45657289/199207826-9fb88d1c-88e6-4418-9cec-1ec8a0f02875.png)
4. In the "New Session" pop-up box, scroll down to "OPTIONS" and ensure that CPUs is set to 1 and Memory set to 4096.  Just type these figures in the text boxes if you need to change them.  Then click the "Start Session" button.
![image](https://user-images.githubusercontent.com/45657289/199208631-7d5e7684-da50-47c2-8df1-aea6faa5381d.png)
5. If your Workbench session does not open automatically after a few seconds, click on the session listed on the home page.
![image](https://user-images.githubusercontent.com/45657289/199208971-bf977d57-b042-4e43-9e15-b9b107dc89bc.png)
6. Respond to the prompt by typing, for example, "yes" or "agree" (highlighted in yellow below)  Please note that the usage message is still being finalised, along with an Acceptable Usage Policy.
7. Click the "Terminal" tab (circled in red below).  If this is not visible to you, go to the Tools menu, and select Terminal --> New Terminal (circled in blue below)
![image](https://user-images.githubusercontent.com/45657289/199212981-8bae5c75-ec03-4a12-a2a7-7965ca5a0e1d.png)
8. Clone the High CPU Load repo on GitHub into your home directory on the RStudio Workbench test environment by issuing the following command at the terminal prompt:

`git clone https://github.com/Public-Health-Scotland/RSIP_UAT_High_CPU_Load.git`

You should get some output as highlighted in yellow below.
![image](https://user-images.githubusercontent.com/45657289/199214455-80f32f54-3fd1-495b-a8ea-a5bb607df0af.png)

9. Navigate into the RSIP_UAT_High_CPU_Load directory (circled in red above), and click on the project file (circled in red below)
![image](https://user-images.githubusercontent.com/45657289/199214890-cc92a109-aea2-42e6-9dc2-0da74aae87a3.png)

10. Confirm that you want to open the project by clicking the "Yes" button in the prompt that appears (circled in blue above).
11. Your Workbench session will restart.  It may take a few seconds for this to happen.
12. Once it restarts, again type e.g. "yes" or "agree" at the prompt.
13. Navigate into the "code" directory (circled in red below).
![image](https://user-images.githubusercontent.com/45657289/199215530-994269bb-1e51-471b-8e50-c608d1d30065.png)

14. Open the "99_Run_Test_0.R" script (circled in red below) and click the "Source" button (circled in blue below) to run the script.
![image](https://user-images.githubusercontent.com/45657289/199216261-7daf0716-7c53-4c5a-a2d0-c35525e26c7b.png)

It will take around 2 to 3 hours to run the script, and your Workbench session will close automatically once it's complete.  You can now close your web browser, and thank you for participating in this test.
