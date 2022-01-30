GitHub Instructions for Collaborators

1. Accept GitHub invite.

2. Go to repo webpage: 
https://github.com/chris-lora/1Note

3. In terminal, create/navigate to folder where 1Note will be/is by using:
cd <folder path>

4. Once you're in the appropriate project folder, paste into terminal: 
git clone https://github.com/chris-lora/1Note.git

5. The project should now be on your computer in the designated folder.

6. Create your own branch for you to work on. In terminal enter:
git checkout -b <branch name>

7. You can now work on the project on your machine. 

8. When you are done making changes and are ready to upload to GitHub, enter into terminal:
git add .

9. Enter your commit message, try to be descriptive:
git commit -m "<message>"

10. Push your branch to the cloud:
git push --set-upstream origin <branch name>

11. On GitHub, create pull request in order to merge to Main.

12. Leader (or other collaborators) can review branch merge to main and approves request. Main is now merged with branch.

13. Once merged, update your working branch to Main. Go back to terminal: 
git checkout main

14. After your branch is switched to Main, you have to pull any new changes to your computer local files of the project:
git pull

13. To continue working on your machine, go back to step 5.