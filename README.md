# LSystem-Generator
![alt text][LSystem_Art]

[LSystem_Art]: https://github.com/Nir-Al/LSystem-Generator/blob/main/Art.png?raw=true "LSystem Art"
## What is the Lindenmayer system?

The Lindenmayer system, also known as L-system, is a fascinating concept that allows you to generate intricate and beautiful patterns found in nature. This system was originally developed to study the growth and structure of plants, but it has since become a powerful tool for artists, designers, and enthusiasts to create mesmerizing visualizations that resemble living organisms.

The system itself is compiled of a set of simple rules that help you generate complex and organic patterns by repeating and transforming basic shapes. It's like following a recipe to create breathtaking artworks, where each step builds upon the previous one, resulting in intricate designs that resemble the beauty of nature.

## How do I use the software?

The Lindenmayer system consists of two main components: an axiom (initial shape) and production rules (guiding principles). The axiom sets the starting point, and the production rules instruct how to transform and replace each symbol in the sequence. Applying these rules repeatedly leads to the evolution of the artwork, revealing mesmerizing and lifelike patterns.

## Symbols and their description

* The letter "F" represents a step forward or a line segment.
* The symbol "+" instructs the system to turn left, while "-" makes it turn right.
* The symbols "[" and "]" are used to mark and recall positions. When encountering "[," the system saves the current position and direction. Later, when "]" is encountered, it returns to the previously marked position and continues from there. This allows for branching and creating intricate patterns in the artwork.
* The symbols "&", "^", "/" and "\" rotate the figure spatially, if the 3D switch is enabled.
* You can use other letters, like "X" and "Y", as placeholders - allowing for even more intricate patterns.
