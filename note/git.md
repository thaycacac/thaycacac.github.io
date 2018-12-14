---
title: Note Git
author: Thaycacac
---
### **1. File** `.gitignore`
* Git will be skip file declared in this file 
### 
### **2. Add**
* Use `add.` for add all
* Use `add file1 file2` for specific file.

### 
### **3. Branch**
* Create new branch
```markdown
git checkout -b new-branch-1
```
- Push current branch
```markdown
git push origin new-branch
```
- This syntax help you just use `git push` the next push
```markdown
git push -u origin new-branch
```
### 
### **4. Set access merge**
1. In to `branches` 
2. Click `Add rule`
3. `Apply rule to` merge
4. Select the right below
5. Crete and Save change

### **5. Create pull request**
1. Click **Create pull** in `branch`
1. If this branch working, you should put name start with `[WIP] ...`

### **6. Comment, create issue**
1. If yout want to comment in to commit, read code then click `+` head line, next to `Add review comment` to comment
2. Click `Review changes` then choose type and `Submit review`

### **7. Step basic use git for project**
* Switch `mater` then `Merge pull request`
```markdown
git pull --rebase
```
* Create new branch to code
* Then create  `pull request`
* Lastly, `Merge` and do again
* If you want to comback before commit, you need create new branch, then use
```markdown
git git reset --hard ORIG_HEAD
```
### **8. Cách viết cho commit**
* `Add`  Add to source code. Ex: function, test, lib,...
* `Drop`  Delete from source code. Ex: function, test, lib,...
* `Fix`  Edit source code. Ex: bug, typo...
* `Bump`  Change version. Ex: Update version library current...
* `Make`  Change tool or procedure build related infrastructure...
* `Refactor`  Eestructure the old source code...
* `Optimize`  Optimize performance old source code.
* `Reformat`  Reformat old code. Ex: delete space, line empty, ...
* `Rephrase`  Modify document references in source code. Ex: comment in source code (TODO / FIXME / …)
* `Document`  Modify document references external source code. Ex: modifier file README.md