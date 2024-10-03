# RDUtils
Roblox Dev Utils is library with various functions for roblox developers!

# How to use RDUtils?
RDUtils is split into five basic categories: MathUtils, AdvancedMathUtils, StringUtils, TableIT (also exists as seperate library) and MiscUtils.

>[!NOTE]
>RDUtils is developed by: `Lipaanek`

>[!CAUTION]
>Do NOT change any code in official version of RDUtils, instead commit a change for RDUtils!

## 1. MathUtils
MathUtils is library that takes most used functions and turns them into one **signle** function
>[!IMPORTANT]
>Many functions are missing or are under construction (for example logic gates).

### A. Clamp
```luau
MathUtils.Clamp(<Number>; <MinNumber>; <MaxNumber>)
```
Clamp is a mathematical function that checks if the number is in range within MinNumber and MaxNumber, if the number is smaller, then the number will be the smallest possible number in range and vice versa.

```
Number -> 11
MinNumber -> 1
MaxNumber -> 10

Output -> Number: 10
```

```
Number -> 0
MinNumber -> 1
MaxNumber -> 10

Output -> Number: 1
```
<details>
  <summary>More info</summary>
  
  ### How does it work?
  It uses very simple formula:
  ```luau
  math.max(MinNumber, math.min(MaxNumber, Number))
  ```
  `math.max` picks the biggest number in numbers that were given (for example if numbers were 1 and 5, it would return 5).
  `math.min` picks the smallest number in numbers that were given (for example if numbers were 1 and 5, it would return 1).
  What we are doing is picking the biggest number, but when we added `math.min` we are also checking if the set value is bigger or not, if yes it will return the smaller number. After that we have just `math.max` which picks the biggest number, if we consider `Number` is 11 then it will check if MinNumber is greater than Number. `math.min` returned us 10 and MinNumber is 1, then the whole code return the bigger number, in this case it's 10.
</details>

### B. Distance
```luau
MathUtils.Distance(<Pos1>; <Pos2>)
```
```luau
Pos1, Pos2 -> typeof("Vector3")
```
Distance function does what you should expect, it takes 2 Vector3 values `(Pos1 and Pos2)` and calculates distance between those 2 places.
```
Pos1 -> Vector3.new(0, 10, 0)
Pos2 -> Vector3.new(0, 0, 0)

Output -> Distance: 10 studs
```
>[!NOTE]
>Distance is measured in `studs`.

<details>
  <summary>More info</summary>

  ### How does it work?
  It's suprisingly simple:
  ```luau
  (Pos1 - Pos2).Magnitude
  ```
  `.Magnitude` is build-in function that coverts Vector (distance) into number.
  We are subtracting 2 Vectors and after subtraction we are using build-in function called `.Magnitude`, we get number.
  
  > Helpful for doing things better or more easily.

</details>

### C. Normalize Vector
```luau
MathUtils.VectorNormalize(Vector3)
```
This function Normalizes Vector to `Vector Unit`.
A `Unit Vector` is a Vector who’s values are based on 1. This is basically only used for directional vectors as far as I know[^1].

[^1]: [Source: Excess Energy](https://devforum.roblox.com/t/vector3unit-can-someone-explain-this/735674/3?u=lipaanek)

### D. Round
```luau
MathUtils.Round(<Number>; <Type>)
```
```
Type -> "Ceil"; "Floor"; "Round"
```
`Ceil` Rounds the number up regardles it's lower (ceil(1.1) -> 2).
`Floor` Rounds the number down regardles it's higher (floor(1.7) -> 1).
`Round` Rounds the number like normal (round(1.5) -> 2; round(1.4) -> 1)

### E. Sing
```luau
MathUtils.Sing(<Number>)
```
This functions return only 3 numbers: `1`; `-1`; `0`. When given numbers is greater than 0, then it will return 1, if the given number is smaller than `0`, then it will return `-1` and if number is exactly 0, then it will return `0`.

### F. ToDeg
```luau
MathUtils.ToDeg(<NumOfRad>)
```
This function converts `Radians` to `Degrees`.
<details>
  <summary>More info</summary>
  
  ### How does it work?
  It uses this simple formula, where `X` is radian value:
  # $X\cdot\frac{\pi}{180}$
</details>

### G. ToRad
```luau
MathUtils.ToRad(<NumOfRad>)
```
This function converts `Degrees` to `Radians`.
<details>
  <summary>More info</summary>
  
  ### How does it work?
  It uses this simple formula, where `X` is degree value:
  # $X\cdot\frac{180}{\pi}$
</details>

### H. Avarage
```lua
MathUtils.Avrg(...)
```
This function passes all number values given, it counts how many are there and how much their sum is, then it will divide sum by number of values given.

<details>
  <summary>More info</summary>

  ### How does it work?
  It uses this mathematical formula:
  # $A=\frac{1}{n}\displaystyle\sum_{i=1}^{n}a_i$
</details>



### I. Vector Cross Product
```lua
MathUtils.VectorCrossProduct(<Vector1>; <Vector2>)
```
>[!NOTE]
>Works only for Vector3!
This function multiplies Vector3 by different Vector3. It sounds easy, you can just do this, right?
```lua
Vector3.new() * Vector3.new()
```
Wrong, it's much more complicated and thats why I included this as a function.



<details>
  <summary>More info</summary>

  ### How does it work?
  Vector is basically Matrix, so we can achieve the same effect with two Matrices:
 ```math
\begin{bmatrix}
  v_{1}\\
  v_{2}\\
  v_{3}
\end{bmatrix}
\times
\begin{bmatrix}
  w_{1}\\
  w_{2}\\
  w_{3}
\end{bmatrix} =
\begin{bmatrix}
  v_{2}w_{3} - v_{3}w_{2}\\
  v_{3}w_{1} - v_{1}w_{3}\\
  v_{1}w_{2} - v_{2}w_{1}
\end{bmatrix}
```
</details>

### J. Perlin Noise
```lua
MathUtils.PNoise(<xValue>; <yValue>; <zValue>)
```
This function converts x; y; z; values to `perlin noise`. There is no need to explain anything further because roblox has "build-in" function like this.

### K. Vector Angle
```lua
MathUtils.VectorAngle(<Vector1>; <Vector2>)
```
This function calculates Vector angle.

<details>
  <summary>More info</summary>

  ### How does it work?
  Angle is calculated using `sin` or `cos`.
  
  ## $\sin\theta = \frac{v_{1} \times v_{2}}{|v_{1}| |v_{2}|}$ 
  
  ## $\cos\theta = \frac{|v_{1} \times v_{2}|}{|v_{1}| |v_{2}|}$
</details>

### L. Vector Angle Between
```lua
MathUtils.VectorAngleBetween(<Vector1>; <Vector2>)
```
This function calculates angle between two `Vector3`s. It might seems like it's the same exact thing as `Vector Angle`, and the answer is yes (kinda), function returns value in cos values.

<details>
  <summary>More info</summary>

  ### How does it work?
  Angle between two Vectors is calculated using `cos`.
  
  ## $\cos\theta = \frac{v_{1}:Dot(v_{2})}{\sqrt(x_{1} + y_{1}) \times \sqrt(x_{2} + y_{2}) }$
</details>
