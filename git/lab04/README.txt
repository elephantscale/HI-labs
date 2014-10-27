Basic git operations

In this lab we will learn the basics of editing the files and committing the changes to git


Lab Goals:

1. Change the file, stage it, and commit it to git
2. Work with branches
3. Push and pull the changes


== STEP 1)  In the git-labs, create your own branch

	git branch <your-name>
	git checkout <your-name>

== STEP 2) Edit the file and commit the changes

	-- edit a file (any file) in the directory
	git status
		explain what the git status is telling your
	git add <file>
		add the file to staging
	git commit
		commit the staged file
	
	Explain every step in terms of git and in terms of the working directory / .git

== STEP 3) Push the change to the remote

	git push

== STEP 4) Pull the changes from the remote

	git pull

== STEP 5) Bonus

	Creatively alternate edits, commits, pushes and pulls in various branches
	Observe the interaction between your and other students's changes

== STEP 6) Merge (the instructor will tell one student to merge her changes into dev)

	merge dev
	git status

	Explain the results