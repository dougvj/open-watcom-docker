## Docker image for the OpenWatcom V2.0 compiler

# Usage

```
docker run -v $(pwd):$(pwd) --workdir $(pwd) dougvj/open-watcom-v2  <cmd>
```

Where <cmd> is the command to run in the container, for example, `wcl386`

The container will run as whatever user owns the workdir.

You can add this command as an alias in your .profile for convenience like this:

```
alias watcom=docker run -v $(pwd):$(pwd) --workdir $(pwd) dougvj/open-watcom-v2
```

If you have a project that is built with wmake, for example, you can run this
with the alias:

`watcom wmake`





