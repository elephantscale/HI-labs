Merge conflict resolution

In this lab we will learn thow to resolve merge conflicts


Lab Goals:

1. Create a conflict
2. Resolve the conflict
3. Commit changes


== STEP 1)  Create a conflict

	The easiest way to create a conflict is by cloning your project to another directory,
	then editing the same file in the same place in both directories, commiting in one directory and 
	pulling the changes in the other

	Bonus: create a conflict in a different way (hint: merge branches that have conflicting edits)

== STEP 2) Resolve the conflict

	Manually open the file and edit it until satisfied
	Tell git that you are done with the changes
	git add <file>
	

== STEP 3) Push the changes

	git commit -a
	Note the message that will appear
	Explain that message
	git push

== STEP 4) Configure your preferred merge resolution tool in git

	Use merge resolution tool to resolve the conflict