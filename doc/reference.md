# MOCAD LIBRARY REFERENCE

# Directory Structure

The directory structure is as follows:

```./mo/``` - contains the intrinsic Mocad files (```mo.scad```, and its dependencies).
This is the minimal Mocad requirement

```./doc/``` - contains this Reference and the User Guide

```./tutorial/``` - contains the tutorial

```./examples/``` - contains example files of varying completeness, correctness and interest.

```./mocad/``` - contains the Mocad part library

```./[organization name ]/``` contains the parts from the specified organization

Parts directories should contain files named exactly as the parts they define, so that from

```use <../[org name]/[part name].scad>```

Once could expect to directly instanciate a part called [part name].

For example, using

```use <../mocad/moShaft.scad>```

Allows the creation of a shaft as follows:

``` moShaft(); ```

This lets people worry about only one name, not one for the part and one for the file.

It is suggested that the [org name] that names the directory be rather complete (like
"adafruit" rather than an abbreviation "ad" or "a"), and that all parts be named with
an appropriate short prefix.  Mocad parts, for example, are preceded with "mo".  This is to reduce the likelihood of name clashes.

When you build parts or your own projects, if you do it in a directory off the top of the project (i.e. in ```./myProject```) all references to parts will match those in the rest of the system, popping up a directory, to the project root, then dropping down into a new one for the part.  For example ```../mocad/moShaft.scad``` works everywhere in this scheme.

An optional service to parts library users is to present the provided components
in an index.  This can be modeled off the index in the ```mocad``` directory (called ```moIndex.scad```) or any other.  Mostly, it should load all the parts from a single organization and present them along with a name label.

The top level index (```./index.scad```) contains a meta index of all the part libraries.  This is a large model.

# Parts

Parts are presented in files named identically, as specified above.

So, as above, bringing ```moShaft.scad``` in...

```use <../mocad/moShaft.scad>```

Allows us to invoke it as follows

```moShaft( );```

Parts may also permit the following

- the use of a first parameter to specify a position to orient as the origin of the part
- the use of the ```info``` parameter to request part positions be shown
- the use of the ```$name``` parameter to request a name label be created to identify the part.

So, in our ```moShaft``` example, we might create a ```moShaft``` as follows:

```moShaft( 1, info = true, $name = true );```

Which would create a ```moShaft```, pre-orient it so that Position ```1``` is at the origin. Position labels will be visible and the part will be named.

In addition, parts may also be accompanied by a function to enable the retrieval of Positions.  It should be in the form ```[part name]Position( p )``` where p is an
appropriate Position Reference.  

Position References may be single integers, or arrays of integers.

```moShaftPosition( p )``` would return a position in response to the integers 0, 1, or 2.

When a part file is invoked by itself (i.e. not as a ```use< >``` in another file) OpenSCAD will run any module invocations it has.  It will not do so if "used" by another file.  This means that if you invoke the part you define in a file, it will magically appear if someone opens the file.  When you invoke it, request ```info = true``` and ```$name = true``` to be maximally helpful.

This feature is very helpful.  It lets people browse parts, getting a close look at how they are intended to be used, what positions they define and how they are constructed without having to modify any code.

In summary, part files will have the following structure,

moPart.scad
```
// include the core Mocad functionality
include <../mo/mo.scad>

...

// define the part module itself
module moPart( position = 0, info = false, $name = false ) {

  ...

}

// define the Position function
function moPartPosition( p = 0 ) = ...

// add a call to the defined module to create an instance.
// this will only be run when the file is opened directly in OpenSCAD
moPart( 0, info = true, $name = true );
```

# Mocad Functions and Modules

## Constants

OpenSCAD is dimensionless.  By convention, we'll say all dimensions are in millimeters.

To obtain inches, multiply distances by the constant ```in```.  For completeness there
is also a `mm` constant.

```
in = 25.4
mm = 1;
```

Turn ```moText``` off if text seems to be killing performance on your machine.
```
moText = true;
```

## Colors

Colors are defined as RGB arrays.

```
Steel = [0.65, 0.67, 0.72];
Stainless = [0.45, 0.43, 0.5];
Aluminum = [0.77, 0.77, 0.8];
BlackDelrin = [0.2, 0.2, 0.2];
Brass = [0.88, 0.78, 0.5];
Transparent = [1, 1, 1, 0.2];
BlackABS = [0.2, 0.2, 0.2];
Nylon = [1, 1, 1];
Yellow = [ 1, 1, 0 ];
Copper = [ 0.75, 0.5, 0.2 ];
Black = [0, 0, 0];
White = [1, 1, 1];
Red = [ 1, 0 ,0 ];
Blue = [ 0, 0 ,1 ];
Green = [ 0, 1 ,0 ];
```

## Positions

Positions are 3-element arrays:

```
[ [ x, y, z], [vx, vy, vz], a ]
```
They represent a rotation of ```a``` degrees about the ```vx, vy, vz``` axis, followed by a translation of ```[ x, y, z ]```.

Note that even when there is a zero rotation angle, the axis vector (```vx, vy, vz```) must have a length of 1.  

Combining rotations can get numerically complicated, so it's best to stick with performing one at a time when definining them.

## Position Constants

There are several defined constant Positions

```
moOriginPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], 0 ];
moIdentityPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], 0 ];
moFlipPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], 180 ];
```

## Simple Position Functions

The simplest Position Functions are designed to specify relationships between parts.

The first return rotations around an axis

```
function moYawPosition( a = 90 ) = [ [ 0, 0, 0 ], [ 0, 0, 1 ], a ];
function moRollPosition( a = 90 ) = [ [ 0, 0, 0 ], [ 0, 1, 0 ], a ];
function moPitchPosition( a = 90 ) = [ [ 0, 0, 0 ], [ 1, 0, 0 ], a ];
```

You can use these in movement operations to make quick adjustments to part orientations.

The next set of functions assist with linear motion

```
function moLinearPosition( y = 1 * in ) = [ [ 0, y, 0 ], [ 1, 0, 0 ], 0 ];
function moTranslationPosition( x, y, z ) = [ [ x, y, z ], [0, 0, 1], 0 ];
```

These can be used to nudge a part off its attach point, if necessary.

The next function inverts a Position (undoes what it would do)

```
function moInvertPosition( position = 0 ) = moCombinePositions(
            [[0,0,0],-position[1],position[2] ],
            [-position[0],[0,0,1],0] );
```

This is a critical operation when seeking to reorient a part to one of its own Positions.

The next function returns true or false depending on whether the provided value is a legal non identity position.  This function is used internally to reduce math workload.

```
function moIsIdentityPosition( p = 0 ) = ( ( p == 0 ) ?
                                             true :
                                            ( p[0][0]==0&&p[0][1]==0&&p[0][2]==0&&p[2]==0) );
```

## More Complex Position Functions

```moMoveTo( p )``` - move the child graphics to the position specified

For example:

```
moMoveTo( moNewPosition )
   moPart();
```

Creates a ```moPart``` and moves and re-orients it to ```moNewPosition```

```moAttach( base, basePosition, joint, partPosition )``` - attaches the child graphics part to the base location / basePosition with the specified joint (i.e. nothing, or moFlipPosition, or some other).  The value zero is read as a no-operation - ignore.

For example:

```
moAttach( moBasePosition, 0, moFlipPosition, 0 )
  moPart();
```
Creates a ```moPart``` and attaches it to the origin position at ```moBasePosition``` after flipping it over.

```
moAttach( moBaseOrigin,
          moBasePosition( 5 ),
          moMoveToPosition( moFlipPosition, moLinearPosition( 10 ) ),
          moPartPosition( [ 10, 5 ] ) )
  moPart();
```

Creates a ```moPart```, orients it to its own Position reference ```[ 10, 5 ]```, attaches it to the ```moBase``` Position reference ```5``` which is at ```moBaseOrigin```, flipping it, and moving it along the axis of the connection 10mm.

```moMoveToPosition( base, position )``` - takes the base position, applies the position
argument to it and returns the new value.

```moMoveToPositions( positionArray )``` - takes the array of positions supplied and
 returns the net effect of them all applied in sequence.

```moAttachPosition( base, basePosition, joint, partPosition )``` - takes the base positon, a reference to a Position on the base object, incorporates any joint connection and if necessary re-orients the part location to a specified position and returns the net position.

## General Helpers

```moPitch( m )``` - module that pitches (rotates in the x axis) the children m * 90 degrees

```moRoll( m )``` - module that rolls (rotates in the y axis) the children m * 90 degrees

```moYaw( m )``` - module that yaws (rotates in the z axis) the children m * 90 degrees

```moGridParts( origin, delta, rotation )``` - module that takes n children and
spreads them out in an orderly grid, offset as specified by the ```origin``` and spaced
according to the ```delta```.  A small rotation is added if rotation is not false.
