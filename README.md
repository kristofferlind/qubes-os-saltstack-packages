# Qubes OS SaltStack packages
I wanted my Qubes OS configuration codified and have been learning a bit of SaltStack to do so. This is a set of packages I've used to configure dom0 and templates, example of how to use them can be found here: (https://github.com/kristofferlind/qubes-os-saltstack-boilerplate).

In short though (in your qubes config repo): 
```
git submodule add git@github.com:kristofferlind/qubes-os-saltstack-packages.git packages/kristofferlind
```

Might feel a bit awkward to have my username included everywhere, but it leaves room for adding unpublished packages in packages/ or pulling in similar structures from other users.

Followed by something similar to this for applying these packages (check boilerplate for details):
```
user:
  dom0:
    - packages.kristofferlind.qubes-video-companion.dom0
    - templates.development.create

  template-development:
    - packages.kristofferlind.nix
    - packages.kristofferlind.qubes-video-companion
```

# Reliability
The testing for these packages is basically whether installing them worked for my qubes, there's no isolated testing of them so it might be that they worked because of some other package I had installed. Something might also have changed since I last used it, I don't modify templates that often. Would be nice if this example included a test setup to relieve some of those issues.

# Contributions
If you want to add packages my suggestion is to create a similar repository and create a pull request adding it to the boilerplate. If you do find something wrong with a package or have a suggestion for how to structure it differently, I'll be happy to review a pull request, my availability for doing so varies a bit though.

Looked like I wasn't the only one looking for a nix package, I would love for it to be a hardened setup however. We could give it an initial configuration that actually gave somewhat of a compartmentalization per directory too.

# License
MIT, anything installed by these packages has their own licenses. Packages may also have separate licenses.

The nix package is a bit problematic as I had to modify their installer to make it work offline, thereby including a copy of their installer and the package it downloads. These files are not covered by the MIT license and are instead covered by their respective licenses (somewhat unclear as it's not included in either of them, but probably [this](https://github.com/NixOS/nix/blob/master/COPYING)). I'm hoping my intentions align with your interests, just let me know if you want me to change anything.

# Acknowledgements
My best resources for learning managing qubes with SaltStack were configurations published by other users.
- Thank you [drkhsh](https://drkhsh.at/) for publishing [salt-n-pepper](https://git.drkhsh.at/salt-n-pepper/), Librewolf is from the browser template
- Thank you [unman](https://github.com/unman) for publishing [shaker](https://github.com/unman/shaker)
