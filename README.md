## Godot Ubuntu Container for Docker/Distrobox

This repository contains the recipe for a docker images that are intended to be a simple godot environments for use with distrobox or vscode's devcontainer paradigm.

### Why do I need this?

Generally speaking, you *probably* don't. However, *if you're using an **atomic operating** system such as [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/), [Bazzite](https://bazzite.gg/) or even
wanting to do some development on a **read only operating system** such as the Steam Deck OS*, you'll find that the ability to do godot development work without [pet containers](https://www.redhat.com/en/blog/defense-pet-container-part-1-prelude-only-constant-complexity) 
to be exhausting.

So what is an eager developer supposed to do in this situation? You can either embrace a terminal based workflow using [Distrobox](https://distrobox.it/) or use a VSCode integrated solution by adopting [Dev Containers](https://code.visualstudio.com/docs/devcontainers/create-dev-container).

## Enter Distrobox

Getting a distrobox container set up with all of Godot's dependencies is easy, thanks to this convenient image:

```
distrobox create  --image ghcr.io/eoin-oneill-yokai/godotbox:master --pull --name godotbox
```

If you're using a computer with an nVidia graphics card, you'll need to take the extra step of passing-through your NVidia driver. This is also easy enough to do, thanks to distrobox:

```
distrobox create  --image ghcr.io/eoin-oneill-yokai/godotbox:master --pull --name godotbox --nvidia
```

And that's it. Simply type `distrobox enter godotbox` and you'll have an environment tailored to build godot on your read-only operating system.

## Alternatively, Enter VSCode Dev Containers Extension.

Guidance TBD, but you should be able to get this to work...
