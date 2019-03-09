# Workflow
The workflow is defined as:
1) Create issue
2) Label issue with milestone for release (`MVP`, `1.0.0`, `1.1.0`, etc.)
    * If a collaborator of the repository, review issue and verify that the issue's labels and milestones are correct
3) Self-assign an issue
4) Once work begins, move issue to `In Progress`
5) Once work has completed, create Pull Request
    1) Get 1+ reviews to approve work
    2) Once approved, merge work
6) Verify work was merged

# Branching Strategy
We will use feature branching strategy where the branch name will be:
* `Issue_num`_short_description_of_work

If the need arises for a more comprehensive workflow, Git Flow would probably be a decent choice.
