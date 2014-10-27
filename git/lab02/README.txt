Initializing git repository

In this lab we will learn how to initialize a git repository, as well as how to deal with objects


Lab Goals:

1. Initialize git repository
2. Get familiar with the three git areas: working, staging, commit
3. Get a feel for git objects

== STEP 1)  Initialize git reposiory.

    The following steps are done in Git Bash if in Windows, and on Terminal, if in Mac/Linux

	$ mkdir test
	$ cd test

	Note that at this time 'git status' gives you an error message

	Now initialize the git repository

	$ git init
	Initialized empty Git repository in /tmp/test/.git/

	Investigate the .git area
	Explain the directories and object found in it

== STEP 2) Experiment with getting objects from the git store

	$ find .git/objects

	.git/objects
	.git/objects/info
	.git/objects/pack

	Explain the above command

	$ find .git/objects -type f

	Explain the results of this command
