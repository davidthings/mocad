# MOCAD LIBRARY REFERENCE

# Directory Structure

The directory structure is as follows:

```./mo/``` - contains the intrinsic Mocad files (```mo.scad```, and its dependencies)
this is the minimal Mocad requirement

```./mocad/``` - contains the Mocad part library

```./doc/``` - contains the Reference and the User Guide

```./tutorial/``` - contains the tutorial

```./examples/``` - contains example files of varying completeness, correctness and interest.

```./[organization name ]/``` contains the parts from the specified organization

Parts directories should contain files named exactly as the parts they define so that from

```use <../[org name]/[part name].scad>```

Once could expect to directly instanciate a part called [part name].

For example, using

```use <../mocad/moShaft.scad>```

Allows me to create a shaft as follows:

``` moShaft(); ```

This allows people to only have to worry about one name, not one for the part and
one for the file.

It is suggested that the [org name] that names the directory be rather complete (like
"adafruit" rather than an abbreviation "ad" or "a"), and that all parts be named with
an appropriate prefix.  Mocad parts, for example, are preceded with "mo".

An optional service to parts library users is to present the provided components
in index.  This can be modeled off the index in the ```mocad``` directory or any other.

The top level index contains a meta index of all the parts.

# Parts

Parts are presented in files named identically, as specified above.

So, as above, bringing moShaft.scad in...

```use <../mocad/moShaft.scad>```

Allows us to invoke it as follows

```moShaft( );```

Parts may also permit the following

- the use of a first parameter to specify a position to orient as the origin of the part
- the use of the ```info``` parameter to request part positions be shown
- the use of the ```$name``` parameter to request a name label be created to identify the part.

So, in our moShaft example, we might invoke a moShaft as follows:

```moShaft( 1, info = true, $name = true );```

In addition, parts *may* also be accompanied by a function to enable the retrieval of positions.  It would be in the form ```[part name]Position( p )``` where p is an
appropriate position reference.  

Position references may be single integers, or arrays of integers.

```moShaftPosition( p )``` would return a position in response to the integers 0, 1, or 2.

When a part file is invoked by itself (i.e. not as a ```use< >``` in another file) OpenSCAD will run any module invocations.  It will not do so if "used" by another file.  This means that if you invoke the part you define in a file, it will magically appear if someone opens the file.  When you invoke it, request ```info = true``` and ```$name = true``` to be maximally helpful.

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
They represent a rotation of a degrees about the vx, vy, vz axis, which must normalized (i.e. have
length 1)

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

The next assist with linear motion

```
function moLinearPosition( y = 1 * in ) = [ [ 0, y, 0 ], [ 1, 0, 0 ], 0 ];
function moTranslationPosition( x, y, z ) = [ [ x, y, z ], [0, 0, 1], 0 ];
```

This function inverts a Position (undoes what it would do)

```
function moInvertPosition( position = 0 ) = moCombinePositions(
            [[0,0,0],-position[1],position[2] ],
            [-position[0],[0,0,1],0] );
```

And this one returns true or false depending on whether the provided value is a legal non
identity position

```
function moIsIdentityPosition( p = 0 ) = ( ( p == 0 ) ?
                                             true :
                                            ( p[0][0]==0&&p[0][1]==0&&p[0][2]==0&&p[2]==0) );
```


## More Complex Position Functions

```moMoveTo( p )``` - move the child graphics to the position specified

```moMoveToPosition( base, position )``` - takes the base position, applies the position
argument to it and returns the new value.

```moMoveToPositions( positionArray )``` - takes the array of positions supplied and
 returns the net effect of them all applied in sequence.

## General Helpers

```moPitch( m )``` - module that pitches (rotates in the x axis) the children m * 90 degrees

```moRoll( m )``` - module that rolls (rotates in the y axis) the children m * 90 degrees

```moYaw( m )``` - module that yaws (rotates in the z axis) the children m * 90 degrees

```moGridParts( origin, delta, rotation )``` - module that takes n children and
spreads them out in an orderly grid, offset as specified by the ```origin``` and spaced
according to the ```delta```.  A small rotation is added if rotation is not false.
