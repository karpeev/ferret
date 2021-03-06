Ferret is a [MOOSE](http://mooseframework.org) application.
To build and use Ferret you will need to build MOOSE.
It might be a good idea to learn a few things about MOOSE, too.

Generally, you will clone Ferret this way:
```
git clone git@bitbucket.org/mesoscience/ferret.git 
```
If you have write permissions, cloning this way will enable you to push to the repo.
Generally this means that you are a member of the `mesoscience` BitBucket team.
If you only have read permissions, you might want to clone this way:
```
git clone bitbucket.org/mesoscience/ferret.git
```

Once MOOSE is built, Ferret can usually be built simply as
```
cd <ferret>
make METHOD=opt MOOSE_DIR=<moose>
```
Here `<ferret>` is the location of the Ferret clone, and `<moose>` is the MOOSE clone.
Naturally, use an appropriate `METHOD` -- one of those that was used to build MOOSE
(e.g., `dbg` or `opt`).

If libMesh is built in a non-standard location (i.e., NOT built inside the MOOSE tree 
using the `<moose>/scripts/update_and_rebuild_libmesh.sh`) then `LIBMESH_DIR` also has 
to be set:
```
make METHOD=opt MOOSE_DIR=<moose> LIBMESH_DIR=<libmesh>
```



### Who do I talk to? ###

* Email Dmitry Karpeyev (karpeev@uchicago.edu) for help with Ferret
* MOOSE is at http://www.mooseframework.org