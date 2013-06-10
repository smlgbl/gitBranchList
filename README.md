You use a jenkins instance to deploy to test instances. You have a deployment script, that has the branch to be deployed as a parameter. The git parameter plugin is too slow, and you don't create new branches by the minute.

Create a Jenkins job e.g. "generateBranchList". SCM using Git, enter your repo, "Branches to build: \*\*". Build periodically, I use "H/5 * * * *". If your Jenkins is publicly available, it would be nice to use a git post-receive hook, but usually Jenkins is private. Use the gitBranchList.sh as the shell to execute. It will create the list of branches at /tmp/git-branches.txt

Install the https://wiki.jenkins-ci.org/display/JENKINS/Extended+Choice+Parameter+plugin in Jenkins. Add a parameter to your Jenkins deployment job, which will read the file created by the job above. Enter '/tmp/git-branches.txt' as 'Property File'. Enter 'BRANCHES' as 'Property Key'. Use this parameter when calling your deploy script.
