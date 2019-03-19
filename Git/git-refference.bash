
#***Git Refference***

#Course Location
/Users/samuel/Dev/Courses/GitHub-Ultimate/Projects/demo

# Notes
# The Mate program is being used in this refference
# Within the Mate program go to prefferences and install the mate command to the OS
# P4Merge is being used as the Diff and Merge tool in the refference

############################################
# Configurtion
############################################

# Show the git version
git version #If not installed you will be prompted to install Git or Xcode which includes Git

# Set up Config
git config --global user.name "Samuel Meddows"
git config --global user.email "samuel.j.meddows@gmail.com"

# Set Default Editor
git config --global core.editor "mate -w"

# Open config file with the assigned default editor
git config --global -e

# Set P4Merge as the Dif Toll
git config --global diff.tool p4merge
git config --global difftool.p4merge.path "Applications/p4merge.app/Contents/MacOS/p4merge"
git config --global difftool.prompt false

# Set P4Merge as the Merge Tool
git config --global merge.tool p4merge
git config --global mergetool.p4merge.path "Applications/p4merge.app/Contents/MacOS/p4merge"
git config --global mergetool.prompt false

############################################
# Inistialisation
############################################

# Initiate a directory
git init demo

############################################
# Git States
############################################
# 1. Working Drectory
# 2. Staging Area
# 3. Repository (.git folder)
# 4. Remote 

############################################
# Git Status
############################################
git status

############################################
# First Commit
############################################
# Add text and save
mate README.md 
git status

# Moves file into staging area
git add README.md 

# Commit the file with a message
git commit -m "First file in demo repo"

############################################
# Add git to pre existing folder
############################################
# Go into the folder
cd demo 

#The . indicates the current folder
git init . 
git status

############################################
# Commits and messages
############################################
# make a second file
mate LICENSE.md 
git status

# The . is wild card which will add all untracked or modified files
git add . 

# As a message was not add, the default text editor will be opened. This allows for multiline messages
git commit 

############################################
# Commit details with log and show
############################################
# Show a log of all the commits
git log 

# Show the last commit and a diff containing all the changes
git show

############################################
# Express commits
############################################
# Update README file
mate README.md

# Git status will now showa modified file
git status

# See which files git is tracking
git ls-files

# Commit via express command. This will add to the staging area then directly commit the file
git commit -am "Updating README"

# Two commits will now be shown in the log with the most recent a the top
git log

############################################
# Backing Out Of Changes
############################################
# Update README file and add to the staging area
mate README.md
git add .
git status

# Use Reset to back file out of the staging area
git reset HEAD README.md

# The chnages will still be in the file but it is now unstaged
mate README.md
git status

# Revert back to last good know state commited in the git repository
git checkout -- README.md

############################################
# History and making new command alias
############################################
# Show all commits
git log

# Show help information on the log command
git help log

# Create a simplified one line commit enty with a astrix based graph showing the branch tree hierarcy. 
# Aslo show which branch is from which hierarchy and other lables and show all commits.
git log --oneline --graph --decorate --all 

# Use git alias to create a history command
git config --global alias.hist "log --oneline --graph --decorate --all"

# Check the entry was made
git config --global --list

# Use the alias command on a single file 
git hist -- LICENSE.md 

############################################
# Rename and Delete
############################################
# make a new file
mate example.txt
git status
git add example.txt
git commit -m "adding exampe file"

# Change the name of a file via git. This change will be staged
git mv example.txt demo.txt

# Commit the name chnage
git commit -m "renaming example"

# Delete a file via git which allows git to track the deletion. This will put the deletion into staging
git rm demo.txt

# Commit the file deletion
git commit -m "deleting the demo file"

############################################
# Managing files outside of git
############################################
# Create a new file via
touch myfile.txt 

# Chnage the name of a file using mv
mv LICENSE.md LICENSE.txt 
ls -l

# Git sees the LICENSE.txt is a new file and the LICENSE.md as an untracked file. Tell git about the chnage with update
git add -u

# To get git to perform both updates and additionas use -A. This will catch all possible updates
git add -A

# Remove the myfile.txt
rm myfile.txt

# update the file deletion and stage it
git add -u
git status

# Commit the remomed file
git commit -m "remove mufile.txt"

############################################
# Excluding Unwanted files
############################################
# Create a log file
mate Application.log

# We don't want to track any files that are generated or are not apart of the source of the application
git status

# Create an ignore file
mate .gitignore

# Syntax is one pattern or expression per line.
*.log

# The .gitignore file needs to be add to the git repository
git add .gitignore
git commit -m "Adding ignore file"

###############################################
# Show the difference between to commit points
###############################################
# Get the commit history using the hist alias
git hist

# Use diff to compare to commit ID's
git diff 40b31e5 HEAD

# Use diff to compare to commit ID's
git difftool 40b31e5 HEAD 

 # Modify the readme file
 mate README.md

 # Use git diff to see the chnages that have been made to the file
 git diff
 git difftool

###############################################
# Bracnhing and Merging
###############################################
# A branch is just a timeline of commits. Branches are the names and labels we give the timelines in git

#Types of Merges
# 1: Fast-Forward - When no additioanl work has been ditected on the parent branch. Git will apply all commits from the child branch directly onto the parent branch. It will appear we never branched off to begin with.
# 2: Automatic - This occours when git ditects non conflicting chanegs in the parent branch. Git can automatically resolve any conflicts. The old brach timeline is preserved and a new merhe commit is created to show the merging of the two branches. 
# 3: Manual Merge - This happens when git is unable to resolve and automaitc conflicts. Git enter a special conflicting merge state. This meanms all conflicts must be resolved before moving foward with a commit. Oncce the conflicts are resolved those chnages are saved as a Manual Merge Commit.   

###############################################
# Special Markers
###############################################
# Markers are like pointers
# ie: HEAD - Points to the last commit of the current branch

###############################################
# Bracnhes
###############################################
# We can use feature or topic branches to sperate changes that we want to make off of master
# Show the current bnranches
git branch

# Create a new branch and swtich to it. Any modifications pending will be carried forward into the new branch.
git checkout -b updates

# Modify README.md and add the chnages to the new branch
mate README.md
git add .
git commit -m "Adding updates from branch"
git status
git hist

# Compare master and the updates branch
git diff updates master

# Switch back to the master
git checkout master 
git hist

# Marge updates with master. Because this is a simple merge it can do a fast-forward
git merge updates
git hist

# Once a branch has been intergreated into the main timline there is no need for them anymore. -d will delete the specified branch
git branch -d updates
git branch
git hist

###############################################
# Conflict Resolution
###############################################
# Create a new branch
git checkout -b very-bad
git branch -a

# Modify the README.md and overwrite a current line. Update the same line in the file. Upate with the express commit am (no staging)
git commit -am "very bad update"
git hist

# Change to master and modify the same line that was modifed in the branch
git checkout master 
mate README.md
git commit -am "Causing issues again"

# Merge the very-bad branch into the master branch. This will cause a conflict and auto merge will not be able to resolve it. 
# Auto merge does not know which version of the README.md we want.
git branch -a
git merge very-bad 

# We are now in a merging state. IF we cat the file the carrots will show which lines are in conflict <<<<<<< HEAD, >>>>>>> very-bad
cat README.md 

# As this is a simple conflict we can use the merge tool. 
git mergetool

# P4Merge launches with a 3 way merge in progress
# At the bottom of P4Merge click on icon for the solution to migrate, then click the save button at the top of the GUI.
# Now commit the chnages
git commit -m "Resolving conflict"
git status

# There will be a .orig file that is untracked. This is the original version of the README.md file. 
# To prevent these files being tracked in the future add them to the .gitignore gile
mate .gitignore
*.orig
git status
git commit -am "Updating .gitignore to exclude merge files"

# Delete the .orig files are they are not required
rm README.md.orig

###############################################
# Tagging
###############################################
# Tages are labels that you can put at any abitrary commit point. ie: Milestones
# 2 types of tags: 
# Leight weight - You can just give a name and git creates it for you. There is no association with it.
git tag mytag
git tag --list

# Delete a tag
git tag -d mytag

# Annotated tags - They have extra information associated with the tag
git tag -a  v1.0 -m "Release 1.0"
git tag --list
git hist

# See the annotation of a tag
get show v1.0

###############################################
# Stashing
###############################################
#Modify the README.md and save it to the stash
mate README.md
git status
git stash

# Show the stashes 
git stash list

# Update LICENSE file to simulate emergency work that needed to take place
mate LICENSE.txt
git commit -am "Updating license file"
git status

# Apply the stash back to the working branch and commit the chnages
git stash pop
git stash list
git commit -am "Updating the readme again"

###############################################
# Time Travel
###############################################
# Make and update to the README.md file
mate README.md
git add .
git status

# Add some additional chnages to README.md to denote chnages in the working directory
mate README.md
git status

# You may need to roll back to a previous commit if a mistake was made
git hist

# use reset and enter the commit ID to roll back too. 
# Default reset --mixed : In addition to where the HEAD is pointing it will also unstage any files from the commit.
# Soft reset --soft : This is the least destructive as all it does is chnage where HEAD is pointing.
# Hard reset --hard : This is the most destructive. Any chnages that were pending or was in the staging area has been deleted
git reset 329e0d0 --soft
git hist
git status

# Choose another commit location
get reset 7005d78 --mixed

# --mixed (Default) actually unstages a number of chnages
# Severla files hhave been unstaged and placed into the working directory
git hist
git status

# use git reset --hard
git reset 40b31e5 --hard
git status

# git hist shows the head at the second commit and git log --online only shows the first two commits. 
git hist
git log --oneline

# git refflog shows all the different actions that have been taken while in this repository
# Go to the last commit before any resets were done
git reflog
git reset 676f699 --hard
git hist

###############################################
# Linking to Git Hub Repository
###############################################
# See the word doc on how to create a new repository
# Link local repository to the remote repository
# Remotye takes two paramaters. Name and URL. The name can be anything but it is convention to have the first primary repository to be named origin
git remote add origin https://github.com/samuelMeddows/demo.git

# Show the list of remote repositories.
# NOTE: Sometimes the FETCH and PUSH URLS are different. In this case the same URL is listed twice.
git remote -v

###############################################
# Pushing changes to Git Huby - HTTPS
###############################################
# Push will syncronise chnages between the local repository and the remote repository. 
# -u will set up a tracking branch relationship between the local master and the remote master. 
# Any future pushes will not require the -u 
# origian is the name of the repository which is followed by the name of the branch
# -- tags will send all the tags in the local repository to the remote repository
# You will need to enter your username and password
git push -u origin master --tags

###############################################
# SSH Authentication - Generate a key
###############################################
# This saves time as a username and password does not need to be entered 
# Set up an SSH key on the local system
# Check to see if there is an SSH directory
ls .ssh

# Create an SSH directory
mkdir .ssh
cd .ssh

# Generate an SSH key pair
# -t is the type of SSH key, -C is the common name
# Press enter to accepot the default location
# Eneter a passphrase or press eneter to have no passphrase
# Offical recomendation is to use a passpjrase
# Passphrase is gitdemo
ssh-keygen -t rsa -C "samuel.j.meddows@gmail.com"

# Navigate to the .ssh folder
cd /Users/samuel/.ssh

# Open the .pub file with a text editor
# Copy the public key and add it to GitUb under Profile,Settings,SSH Keys
mate id_rsa.pub

# Log into git hub from the terminal. Type Yes if it is the first time connecting then enter the key phrase gitdemo
ssh -T git@github.com

###############################################
# Clone a Repo from GitHub
###############################################
# Go to the GitHub repository and click download. Switch to SSH then click on copy like. (For other peoples repos use HTTPS)
# Change to the projects directory
cd /Users/samuel/dev/Courses/GitHub-Ultimate/Projects

# Clone the Repo via the SSH link
git clone  git@github.com:samuelMeddows/my-website.git

# origin will point back to GitHub
git remote -v

# You can use a different folder name for the project other than the gitHub repository name
# Remove the my-website folder. -rf well remove all sub files and folders
rm -rf my-website

# Use the same command to clone the git repository again but this time type a name a the end of the command
git clone  git@github.com:samuelMeddows/my-website.git website

###############################################
# Seeding the GitHub Repository
###############################################

reference.txt
Displaying reference.txt.