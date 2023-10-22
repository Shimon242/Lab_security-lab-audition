#! /bin/bash

# create intial text file
touch /tmp/ideal_society_brief.txt

# add text to text file
echo "As per our meeting on July 5th 2023, the executive team has decided to move forward with the ideal society infrastructure project. In order to allow for easy collaboration we will be storing the  the credentials for the projects main SQL database in a shared file. We will meet on July 18th 2023 to discuss what those credentials should be and save the meeting briefs for future reference under the /tmp directory.” > /tmp/ideal_society_brief.txt

# add second file
touch /tmp/.ideal_society_secret_brief.txt

# add encoded text to second file
echo -n “As agreed upon during our meeting, we will create shared credentials for the dev team to access the main and backup databases. These credentials will be created and shared in a file called “Secrets.txt” under the /var/tmp directory. This file will only be readable by root users to ensure that there is no leakage to people that should not have access to these credentials.” | base64 > /tmp/.ideal_society_secret_brief.txt

# add third file
touch /var/tmp/secrets.txt

# add text to third file
Echo -n “ Database login credentials: Username: Admin Password: l],j2Twv%6kr18e%?}sQ” > /var/tmp/secrets.txt

# change permissions of third file
chmod 600 /var/tmp/secrets.txt

# change ownership of third file
sudo chown root /var/tmp/secrets.txt
