# Agent instructions for homebrew-tap

<!-- fleet-core:begin (generated: edit the fleet source, not this block) -->
## Fleet core

Applies to new work after a repository adopts this baseline; do not retroactively invalidate in-flight work under its existing contract. It is generated from one source; repository-specific rules go outside the markers.

### Evidence
- Read live state before stating it: fetch the remote, read the default branch, run the command. A number or an "X is missing" taken from a doc or a stale checkout is a claim to verify. A figure in a doc carries its date and how it was read.
- Find the root cause before proposing a remedy. For an unreachable or hung host, check its network interface and the previous boot's log before blaming memory.
- Give one account of a fact. If two places disagree, fix or flag one.
- Say plainly what you did not verify.

### Changes
- One bounded task per change request. Stay in scope: no drive-by edits and no agent scratch files committed.
- Standard workflow: run the repository's relevant declared validation, commit to an unprotected branch, and open a change request. Use the repository's ordinary delivery route unless an explicit owner, adopter or repository requirement selects supervision.
- SureForge Agent supervised contracts are available when work benefits from a bounded contract. They are required when explicitly selected by the owner, adopter or repository; inside a run, its contract and delivery process govern commits and publication. Preserve in-flight contracts and stricter repository or operator requirements; this baseline does not waive them.
- Record one compact, truthful result: tested revision and checks, delivery status, elapsed time and usage where available. Mark unavailable measurements unknown rather than zero; do not create duplicate evidence or accounting gates.
- When you wait on something you started or are watching (a run, a validation, a review, CI, the merge queue), say in the same message what you wait for, when you expect it to finish and why (a time measured in this session or from metrics, or say the estimate is unknown). Say when the estimate is exceeded and what you do next. Wait on a completion notification or one bounded wait command; do not spend turns re-checking.
- Generated-policy checks establish instruction consistency; they do not establish runtime enforcement or OS confinement.
- A change request merges after one substantive independent fresh-context review of the exact head has no unresolved P0 or P1 findings, blocking threads are resolved, and every current required check is green. Additional reviews need a specific risk or explicit requirement. A new commit needs a new review; supported native candidate-to-head binding or a clean automatic merge of the base branch may preserve the review under the applicable delivery rules.
- At most three open non-draft change requests per repository. Before starting work, check admission for every target repository: WIP, queue load, default-branch validation and forge API reads must pass. When a target is blocked, finish and land existing work there; unrelated fleet failures do not freeze passing targets. Escalate change-request age without using age alone to block admission. Shared-runner failures affecting a target remain blocking.
- Fix a finding that takes minutes in the current change; fold the rest into an existing tracking issue. A session closes at least as many issues as it opens on its own initiative; tickets the owner asks for in chat are separate.

### Delivery and checkpoints
- Check the current branch, head and PR before resuming. Keep one checkpoint in the existing task record or chat. Update it before pausing. On a follow-up, take the next authorized action in the same task and checkout. If an operation stalls or its outcome is uncertain, inspect the process or forge state. Advance if it succeeded, wait if it is still running, and recover or retry a confirmed failure or missing operation within scope. Hand off only a verified blocker that needs someone else's action.
- Before pushing, check that the commits carry any sign-offs the repository requires and that the tested revision matches the proposed change. When the task includes an authorized merge, own it through review, checks and the repository's required PR merge or merge queue. Follow branch protections. Verify the merged state and merge commit on the forge before reporting completion. If a gate blocks delivery, report the exact gate, evidence and who can clear it.
- In a supervised run, leave commit, push and change-request creation to its authorized delivery phase. Preserve the contract's merge stop and record any operator-only action in Next.
- Use these six fields, in order, for closing summaries and checkpoints. Keep one block per task or PR.
  - **Status** — Done when the requested outcome is verified, In progress when work remains and can continue, or Blocked when a verified gate prevents progress.
  - **Work** — The objective and last verified milestone. When blocked, name the gate and evidence.
  - **Delivery** — Repository, branch and exact head, PR link and state, and merge commit if merged. Include the local checkout path in a private checkpoint.
  - **Checks** — Actual results on the tested revision.
  - **Review** — Independent verdict and the head reviewed.
  - **Next** — The next action and who owns it. Use None when complete.
- Mark Checks and Review Pending, Not run or N/A where applicable.

### Safety
- Never print, log or commit tokens, passwords or keys. Use the credential helper the repository names.
- A credential tool (`op`, `cred`) that fails inside an agent's sandbox is blocked by the sandbox, not a turned-off password-manager integration: never report it as off. Rerun only that command outside the sandbox through the agent's own exception or approval route; never turn the sandbox off for everything.
- One writer per checkout: separate worktrees for separate writers. Do not force-push, rebase or delete a branch another session may own.
- Create worktrees only under the managed worktree parent. Never put clones, logs or backups at the top of the code root; the scheduled fleet cleanup reclaims stale worktrees and reports other leftovers. Never delete another session's work. Delete a branch when its change request merges.
- Never send private-repository content to a model provider that trains on it or has no no-training commitment.
- When you invoke a local model, use the fleet default local model setting from the operator configuration repository; never hard-code a runtime, port or model.
- Private repositories run CI on self-hosted runners only. A job that must not share a host (for example signing) runs on a dedicated self-hosted runner group, never on a GitHub-hosted runner without the owner's approval.
- When a protection blocks you (an approval you cannot give yourself, a protected branch, a missing permission), stop. Do not look for credentials, keys or another way around it. Post your review verdict, say what is needed and hand the merge or approval to the owner.
- Ask the owner only for a step no agent can do, a protected cloud action described below, or a spend or legal commitment. Decide and record everything else.

### Cloud environments
- Use development when the task names no environment. Start with read-only checks of the account, backend or cluster and the environment they point to. Stop if you cannot confirm the target.
- **Allowed in any environment:** read-only checks such as `terraform plan` and `show`, `kubectl get`, `describe` and `logs`, and cloud CLI list, describe and log reads. Check flags, scripts and remote jobs for side effects.
- **Writes in development only by default:** ordinary applies, deploys and scaling within the task. Production and pre-production stay read-only unless the owner directly authorizes the specific action and names the environment in the current chat. Treat shared or unclear environments as protected.
- **Owner instruction required everywhere:** destroy or delete resources (including `terraform destroy`, `sam delete` and `kubectl delete`), run `terraform state rm`, `force-unlock` or `import`, or do the equivalent through another tool. This also covers deletes or replacements inside a plan. Keep existing spending, credential and platform gates in force.
- For Terraform, save the plan, show a summary with secrets removed, then apply that exact file. If the plan or target changes, show the new plan first and renew any owner instruction that no longer covers it. Never let apply make a new plan.
- Log each infrastructure command with the operator's command logger where one is provided. Include failed attempts and reads, and keep secrets out of arguments.

### Layout
- AGENTS.md is the canonical agent file; where a CLAUDE.md exists it only imports it. Keep this file under 200 lines.
- Name this repository's validation command, merge rule and changelog rule outside the markers. Rules kept outside the repository are not visible here: if a task seems to need one, ask rather than guess.
- Rules any adopter needs live in SureForge Agent and in this core; rules that name a machine, account or model live in the operator's own configuration repository, from which each tool's settings are meant to be generated so every agent on every machine follows the same rules.
- Shared skills are installed per machine from the fleet skills hub. Name the ones this repository expects below.

### Forge: GitHub
- Prefer REST (`gh api repos/OWNER/REPO/...`) to GraphQL for single reads: the rate-limit pools are shared by every session on the account.
- Required checks and review rules are branch protection or rulesets; read them with `gh api`. Review-thread resolution needs GraphQL.
<!-- fleet-core:end -->

## Repository guidance

- Formulae live in `Formula/` and casks in `Casks/`. Install and audit packages in an isolated environment.
- Run `ruby -c` on changed formulae or casks. The `brew` workflow checks style, strict online audit, installation, and the release formula's test.
- For instruction changes, run the fleet generator check and `git diff --check`. Sign off commits and use the normal protected squash merge.
- Describe changes in the pull request. This repository has no changelog.
