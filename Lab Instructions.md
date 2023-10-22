# Capturing and Filtering Packets with Wireshark
## Lab Description: In this challenge, you will explore a linux system in search of sensitive files and uncover their secrets.

The notorious hacking group Dark Kittens has struck again! Who are they? What do
they want? And how are they so good? Globomantics runs an artificial island in the
Gulf of Mexico, attempting to build an infrastructure for the “ideal society.” They have
fallen victim to repeated attacks and have issued an international bounty for anyone
willing to take these hackers down (is that even legal?). It’s time for you to choose a
side.

In this lab we will be acting as the dark kittens hacking group.
We have already gained access to one of the company's systems,
now it's time to examine the system, find informationon their plans
and find a way to stop them! 

First things first, let's configure the environment.

1. Click on the Applications button in the top-left and open the Terminal Emulator.

2.  In the console window, type 'chmod 755 Lab_setup.sh' and hit enter, then type './Lab_setup.sh' and hit enter.

3. Our first goal is to identify any files that may be related to the "ideal society" project. 
To do this let's run a command that will scan the entire file system for any files that begin with the words "ideal".

4. In the terminal emulator run the command "find / -name ideal* 2>/dev/null.

**Note:** The command "2>/dev/null" allows us to filter out all responses that give us errors, making it much easier to find the files of interest. 
You can try running this command without that addition to see how much error messages we can get looking for files.
{add first screenshot}

5. Now we can see from our results that we found one file that seems very promising, let's read it.

6. In the terminal emulator run the command cat /tmp/ideal_society_brief.txt.
{add second screenshot}

7. Based on the information found in the brief we see that there should be another file with hints on where we can get some database credentials.
As a next step let's search the tmp directory and see if we can find that file.

8. In the terminal emulator run the command ls /tmp.
{add third screenshot}

9. We get no hits on any new files. However, that doesn't always mean that there are no files present, let's run a new command to look for any hidden files.

10. In the terminal emulator run the command ls -la /tmp.
{add fourth screenshot}

11. Now we see that there is another file hidden in this directory, let's try reading this file.

12. In the terminal emulator run the command cat /tmp/.ideal_society_secret_brief.txt.
{add fifth screenshot}

13. Based on the output it looks like this file has been encoded, making it impossible to read in this form. 
This is not uncommon when you are looking at sensitive information that people want to protect. However, based
on the equal sign at the end it looks like its base64 encoded, as a next step let's try to decode it.

14. In the terminal emulator run the command cat /tmp/.ideal_society_secret_brief.txt | base64 —decode.
{add sixth screenshot}

15. It looks like that worked and we are able to read the message. It looks like the credentials are stored in a file in the /var/tmp directory
in a file called secrets.txt. Let's try to read it.

16. In the terminal emulator run the command cat /var/tmp/secrets.txt.
{add seventh screenshot}


17. It seems we don't have permissions to read this file. 
In order to bypass this we need to do what's called privledge escalation.
This is where we look to evaluate our privledges on the system so that we can run commands
that we normally wouldn't be able to run.

18. To accomplish this we are going to use a command called super user do (sudo), to attempt
to read the file as the root user.

19. In the terminal emulator run the command sudo cat /var/tmp/secrets.txt.
{add eigth screenshot}

**Analysis:** This final screenshot shows us exposed credentials to the company database.
As a hacker in this situation we would be able to use these credentials to connect
to the database, read and export everything that is stored there and ultimate delete
databases to hinder the organization's ability to complete their project. 

In the next lab we'll look at persistence techniques, which are technques hackers
can you use to ensure that they can continue to access a computer system once
they have intial hacked it without raising suspiscion. 


