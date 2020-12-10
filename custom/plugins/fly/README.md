# fly plugin

This plugin loads autocomplete for the concourse `fly` command (>5.4.0).

It also adds `flyXX` aliases for operations and adds support for a `$fly_target` variable allowing for reusable targets.

Enable fly plugin in your zshrc file:
```
plugins=(... fly)
```

## Aliases

More information about `fly` commands:
https://concourse-ci.org/fly.html

| Alias   | Command                                   | Description |
|---------|-------------------------------------------|-------------|
| `flytg` | `export fly_target=$1` | Set `fly_target` var |
| `flyutg` | `unset fly_target=$1` | Unset `fly_target` var |
|||
| `flyab` | `fly -t $fly_target abort-build` | Abort a build |
| `flybs` | `fly -t $fly_target builds` | List builds data |
| `flycr` | `fly -t $fly_target check-resource` | Check a resource |
| `flycrt` | `fly -t $fly_target check-resource-type` | Check a resource-type |
| `flycl` | `fly -t $fly_target checklist` | Print a Checkfile of the given pipeline |
| `flyctc` | `fly -t $fly_target clear-task-cache` | Clears cache from a task container |
| `flycs` | `fly -t $fly_target containers` | Print the active containers |
| `flyc` | `fly -t $fly_target curl` | curl the api |
| `flydtg` | `fly -t $fly_target delete-target` | Delete target |
| `flydp` | `fly -t $fly_target destroy-pipeline` | Destroy a pipeline |
| `flydt` | `fly -t $fly_target destroy-team` | Destroy a team and delete all of its data |
| `flyetg` | `fly -t $fly_target edit-target` | Edit a target |
| `flye` | `fly -t $fly_target execute` | Execute a one-off build using local bits |
| `flyep` | `fly -t $fly_target expose-pipeline` | Make a pipeline publicly viewable |
| `flyfp` | `fly -t $fly_target format-pipeline` | Format a pipeline config |
| `flygp` | `fly -t $fly_target get-pipeline` | Get a pipeline's current configuration |
| `flygt` | `fly -t $fly_target get-team` | Show team configuration |
| `flyhp` | `fly -t $fly_target hide-pipeline` | Hide a pipeline from the public |
| `flyi` | `fly -t $fly_target hijack` | Execute a command in a container |
| `flyjs` | `fly -t $fly_target jobs` | List the jobs in the pipelines |
| `flylw` | `fly -t $fly_target land-worker` | Land a worker |
| `flyl` | `fly -t $fly_target login` | Authenticate with the target |
| `flyo` | `fly -t $fly_target logout` | Release authentication with the target |
| `flyop` | `fly -t $fly_target order-pipelines` | Orders pipelines |
| `flypj` | `fly -t $fly_target pause-job` | Pause a job |
| `flypp` | `fly -t $fly_target pause-pipeline` | Pause a pipeline |
| `flyps` | `fly -t $fly_target pipelines` | List the configured pipelines |
| `flypw` | `fly -t $fly_target prune-worker` | Prune a stalled, landing, landed, or retiring worker |
| `flyrp` | `fly -t $fly_target rename-pipeline` | Rename a pipeline |
| `flyrt` | `fly -t $fly_target rename-team` | Rename a team |
| `flyrvs` | `fly -t $fly_target resource-versions` | List the versions of a resource |
| `flyrs` | `fly -t $fly_target resources` | List the resources in the pipeline |
| `flysp` | `fly -t $fly_target set-pipeline` | Create or update a pipeline's configuration |
| `flyst` | `fly -t $fly_target set-team` | Create or modify a team to have the given credentials |
| `flys` | `fly -t $fly_target sync` | Download and replace the current fly from the target |
| `flyts` | `fly -t $fly_target targets` | List saved targets |
| `flyt` | `fly -t $fly_target teams` | List the configured teams |
| `flytj` | `fly -t $fly_target trigger-job` | Start a job in a pipeline |
| `flyuj` | `fly -t $fly_target unpause-job` | Unpause a job |
| `flyup` | `fly -t $fly_target unpause-pipeline` | Un-pause a pipeline |
| `flyvp` | `fly -t $fly_target validate-pipeline` | Validate a pipeline config |
| `flyvs` | `fly -t $fly_target volumes` | List the active volumes |
| `flyw` | `fly -t $fly_target watch` | Stream a build's output |
| `flyws` | `fly -t $fly_target workers` | List the registered workers |
