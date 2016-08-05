##HexyDelta - a 6-sided Delta-style 3D Printer
### Original design by arTaoss

Re-implementation of HexyDelta vertices.

HexyDelta is a 6-sided delta, designed to use common shelf track as its towers. This SCAD version can use pretty much anything for the tower material (even pipe), just replace the cutout for something that fits.

* Upstream Source: https://cad.onshape.com/documents/d65e181638f34f6681c98153/w/5c7c2f6a7fb44a4889488834/e/3c87c1fad18a47eb95beae5f
* Pictures of the original: https://goo.gl/photos/xABkCxKbiFsE9YLZ9
* Pictures of mine :) : http://imgur.com/a/0z6ZQ

Rationale: I wanted to make the components more robust and make them easier to print with wider nozzles (like the Volcano from E3D).

Requires the [MCAD](https://github.com/SolidCode/MCAD) library. Either extract a copy into the MCAD directory or perform a git checkout and then do the following:
* `git submodule init`
* `git submodule update`
