# Step-by-Step Instructions

## Log into the RStudio Workbench test environment

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

`git clone https:\\`
