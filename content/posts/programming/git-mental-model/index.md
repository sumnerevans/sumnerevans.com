---
title: A Mental Model for Git
date: 2024-06-05T06:25:00-06:00
categories:
  - Programming
tags:
  - Git
  - Source Control
description: |
  I attended SCaLE for the first time this year and participated in the
  co-located NixCon.
image: images/scale.jpg
draft: true
---

Many people learn Git by learning a series of commands (or button presses) which
accomplish the things they most commonly want to do. For many (and for me in the
past), the Git workflow can be summed up as:

> `git add` the files that you want to `git commit`, then `git push` and if it
> yells at you that you're out-of-date, do a `git pull`. And whenever something
> happens in the repository that you don't understand, give up and `git clone`
> the repository again.

This is not a bad workflow, but it does not allow you to utilize the power of
Git to its fullest extent.

In this article, my goal is to help you develop a mental model for Git which
will allow you to understand what is happening when you perform various Git
commands. I will explain some of the more advanced Git topics in terms of this
mental model so that you are not so intimidated by Git.

The goal of the mental models I present are to be useful for everyday usage of
Git. If you need to know the underlying nuts and bolts of how things are
represented internally in Git, this is not the article for you. Think of this as
the [Bohr Model](https://en.wikipedia.org/wiki/Bohr_model) equivalent for Git.
There are more complete models, but for most purposes, it's sufficient.

> [!NOTE]
>
> Much of this article is adapted from my
> [_Git Good_ presentation for Mines ACM]({{<ref"../../../portfolio/index.html#presentation-acm-git-good">}})
> and much of the content is originally from the
> [Git Book](https://git-scm.com/book/en/v2}{git-scm.com/book/en/v2).

I'll start this article by describing a mental model for commits and a mental
model for branches. Then, I'll discuss merging and rebasing. Lastly, I'll
describe a mental model for remote branches.

{{%toc%}}

## Commits

Let's begin by establishing a mental model for commits. There are actually two
mental models which are useful in different situations:

1. **Commits as Diffs**: Every commit is the set of differences (diffs) or
   changes since the last commit. This model is what is presented when you
   perform a `git show` on a commit.
2. **Commits as Snapshots**: Every commit is a snapshot of the repository state
   at the commit. This is useful because it allows you to understand what is
   happening when you move between commits via `git checkout` or some other
   command.

I switch between both mental models of Git fairly regularly depending on what
operations I'm trying to perform on the repository. The second model is more
accurate to Git's internal representation of commits, but I the first model is
my default as it is more practical for most day-to-day operations.

Regardless of your model for commits, one of the key aspects of a commit is its
references to its parent or parent commits. This allows you to trace a history
of changes in your repository (either through a sequence of diffs in the first
model, or a snapshot history in the second model).

{{<figure
  src="./images/branching5.png"
  title="All of the white nodes are commits"
  caption="Notice how they reference their parent (represented in the diagram by arrows)."
  attr="Git Book Chapter 3.1 Figure 17"
  attrlink="https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell#divergent_history"
>}}

For those of you who have taken an data structures and algorithms course, this
diagram might remind you of some of the things you studied in such a course.
This intuition is correct: **commits form a directed acyclic graph (DAG)**. If
you consider each commit as a node, with the parent pointers as directed edges,
you can see that it only makes sense for the edges to point "backwards" in
history, rather than forwards: there are no loops!

Every single commit is stored in the `.git` directory of your repository[^2]
which can be thought of like a "heap" for commits. We use the parent pointers to
traverse through the heap and reconstruct the history of the repository. We will
return to this fact when we talk about [branches](#branches).

[^2]: The actual internal structure of the `.git` directory is very complicated,
and you can't just go find your commit in `.git`, but all of the information
necessary to construct the commit is in there.

Let's take a look at a few commands and see how these mental models help us
understand their output.

### Choosing what to commit using `git add` and `git reset`

You can create a commit by running `git commit`. This will create a commit with
the parent being the currently checked-out commit and will include the changes
that you have "staged".

- You can stage changes by running `git add` and passing a list of files.

  > [!TIP] Pro Tip
  >
  > If you want to add specific parts of files, use `git add -p`.

- You can stage all changes by running `git add -A`.

If you want to remove from the stage, you can run `git reset` (optionally
passing a list of files to unstage).

When staging and unstaging items to include in a commit, the best mental model
to use is the "commits as diffs" model. The `git add` and `git reset` commands
line up conceptually with adding and removing diffs from the stage.

If you ever want to know what is staged to be included in your next commit, you
can run `git status` to show the list of files staged for commit:

```text
> git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   git.tex

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   git.pdf
        modified:   git.tex
```

Note that the `git.tex` file has only some lines staged for commit.

If you want more details about the exact changes that are staged, you can run
`git diff --cached`, and if you want to see the details of the changes that are
_not_ staged, you can run `git diff`.

The `git diff` command optionally accepts a list of files to diff.

Here is an example of a `git diff` output. The `-`s indicate removed lines, and
the `+`s indicate added lines.

```diff
diff --git a/git.tex b/git.tex
index 2c01a7b..91148d1 100644
--- a/git.tex
+++ b/git.tex
@@ -33,9 +33,7 @@

 \section{Why use Git?}

-\begin{frame}{Why use Git? I}
-
-    Example Scenario:
+\begin{frame}{Example Scenario 1}

     \begin{enumerate}[<+->]
         \item You start a project called ``my-proj'' and write a ton of code.
```

### Showing existing commits with `git show`

You can view an existing commit using `git show <commit hash>`. Once again, the
"commits as diffs" mental model is what is exposed:

```diff
commit cb1b9610e4d34aa66b52e7fb722654679b4529e2
Author: Sumner Evans <me@sumnerevans.com>
Date:   Tue Jan 31 10:42:58 2023 -0700

    matrix-synapse: 1.76.0rc2 -> 1.76.0

    Signed-off-by: Sumner Evans <me@sumnerevans.com>

diff --git a/modules/services/matrix/synapse/default.nix b/modules/services/matrix/synapse/default.nix
index b142cf0..675ab77 100644
--- a/modules/services/matrix/synapse/default.nix
+++ b/modules/services/matrix/synapse/default.nix
@@ -7,20 +7,20 @@ let
   # Custom package that tracks with the latest release of Synapse.
   package = pkgs.matrix-synapse.overridePythonAttrs (old: rec {
     pname = "matrix-synapse";
-    version = "1.76.0rc2";
+    version = "1.76.0";
     format = "pyproject";

     src = pkgs.fetchFromGitHub {
       owner = "matrix-org";
       repo = "synapse";

...
```

### Update the repository state to a specific commit using `git checkout`

If you want to update the repository to the state at a specific commit, you can
use `git checkout <commit hash>`. This is where the "commits as snapshots" model
is useful. When you `git checkout` a commit hash, you are restoring your local
copy of the repository to that snapshot.

I'll talk more about checking things out in the [branches](#branches) section.

## Branches

The next important concept to develop a mental model for is _branches_. In order
to develop our mental model, let's go back to my analogy of the `.git` directory
as a "heap" for commits. If you ever have written a program in a language where
you have to perform manual memory management on heap-allocated objects, you know
that you need maintain _pointers_ to such objects. In Git, branches are pointers
to commits in the "commit heap". (There are other objects which are also
pointers such as tags, but we'll not consider them for now.)

**Branches are pointers to a specific commit in that heap.** You can then follow
that commit's parent pointers to reconstruct the change history.

{{<figure
  src="./images/branching-moving-1.png"
  title="The orange nodes are branches and they are pointers to the same commit"
  attr="Git Book Chapter 3.1 Figure 13"
  attrlink="https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell#_create_new_branch"
>}}

The special `HEAD` pointer points to the branch or commit that is currently
checked out (that is, it points to the commit or branch which represents the
working directory's current state).

Now that we understand that branches are pointers, let's look at how some of the
most common operations on branches manipulate the pointers.

### Creating new Branches

If you want to create a new branch that points to the current commit, you can
use `git branch <branch name>`. **This will not change your `HEAD` pointer to
point to the new branch.**

If you want to create a branch and also change the `HEAD` pointer to the newly
created branch, you can use:

```bash
$ git checkout -b <branch name>
```

### Moving `HEAD` around

You can move the `HEAD` pointer to a different commit using
`git checkout <commit hash or branch name>`.

{{<figure
  src="./images/branching2.png"
  title="After running `git checkout testing`, the `HEAD` now points to `testing`"
  attr="Git Book Chapter 3.1 Figure 14"
  attrlink="https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell#_create_new_branch"
>}}

> [!WARNING] `git checkout` Gotchas
>
> - If you checkout a commit hash, you will be in a `detached HEAD` state
>   because your `HEAD` pointer is not pointing to a branch.
> - If you have uncommitted changes, switching branches _might_ fail. You can
>   use `git stash` to save the changes in your working directory, then `git
>   checkout` the other branch, and then `git stash pop` to restore the changes.
>
>   Alternatively, you can just create a WIP commit and then switch to the other
>   branch.

> [!TIP] `git checkout` Pro Tip
>
> You can use `-` to refer to the previously checked out object. For example,
> assuming you start on the `master` branch, then:
>
> ```bash
> $ git checkout -b new_branch      # moves HEAD to new_branch
> $ git checkout -                  # moves HEAD to master
> $ git checkout -                  # moves HEAD to new_branch
> ```

### Moving Branches Around

If you want to move the branch that `HEAD` is pointing to to a different
location, you can use `git reset`. You can use two modes with `git reset`:

- **Hard Reset** (`git reset --hard <commit hash>`): this will move the branch
  that `HEAD` is pointing to to the specified commit, _discarding all changes in
  your working directory_ and resetting the directory's state to that of the
  specified commit.

  Generally, you should only do this if there are no uncommitted changes.
  However, it is sometimes useful to just get rid of all of the changes since
  the most recent commit in which case you can use `git reset --hard HEAD` to
  reset to the most recent commit.

- **Soft Reset** (`git reset --soft <commit hash>`): this will move the branch
  that `HEAD` is pointing to to the specified commit, _leaving the working
  directory alone_. Diffs between the specified commit hash and the current
  working directory state will be be staged.
