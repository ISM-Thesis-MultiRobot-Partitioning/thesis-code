<!--toc:start-->
- [thesis-code](#thesis-code)
- [Running everything](#running-everything)
<!--toc:end-->

# thesis-code

All our code productions collected in one place for easy usage. The repositories are added as submodules wherever available. Thus, you must clone the repository as follows (or replace the SSH url with an HTTP url):

```bash
git clone --recurse-submodules git@github.com:ISM-Thesis-MultiRobot-Partitioning/thesis-code.git
```

# Running everything

**NOTE**: There are issues with the [simulation][mrs] as of commit `c498919d74b7a99f039322a95c902d549d526280` on the repository in question. Please double-check with `git log` in the corresponding folder, whether or not this is the latest commit. If it is, we have provided a [patch file](./simulation/simulation.patch) to amend them, as well as add a dockerfile. Please run the following command in bash to apply the patch before launching the simulation (the parenthesis will avoid switching directory in your shell with the `cd` command by running the commands in a subshell). Please also ensure that the patch has not been applied already (by checking the commit SHA with `git log`) as you will otherwise run into trouble.

```bash
(cd simulation/mrs-mapping-simulation/ && git checkout -b local && git am ../simulation.patch)
```

The idea was to have isolated microservices, hence our use of docker containers. A [`docker-file.yml`](./docker-file.yml) is provided to make management of the containers easier; they include setting up of environment variables, and container specific setup.

To further facilitate usage of the containers, we also used [mprocs][mprocs]. An [`mprocs.yaml`](./mprocs.yaml) is given to have a fully and automatically created setup. The config file sets up processes for each docker container, which can very easily be started, restarted and stopped. You can simple launch mprocs with the given configuration using `mprocs` command without arguments.

[mprocs]: https://github.com/pvolok/mprocs
[mrs]: https://github.com/Mechaick/mrs-mapping-simulation.git
