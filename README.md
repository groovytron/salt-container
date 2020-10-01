# Salt Container

This container can be used to test SaltStack.

## Supported tags and respective `Dockerfile` links

- `3001`, `latest` ([3001/Dockerfile](https://github.com/groovytron/salt-container/blob/master/3001/Dockerfile))

The following software is installed in the container:

- `salt-api`
- `salt-cloud`
- `salt-master`
- `salt-minion`
- `salt-ssh`
- `salt-syndic`
- `python3-pygit2` to be able to mount git repositories (useful for formulas and pillars)
