# Containers-RedBlackTree

A self-balancing Red-Black Tree implementation providing guaranteed O(log n) performance for all operations. Features automatic rebalancing, range queries, and full Collection protocol compliance.

![Pharo Version](https://img.shields.io/badge/Pharo-10+-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## What is a Red-Black Tree?

A Red-Black Tree is a self-balancing binary search tree where each node has a color (red or black) and maintains specific balance properties. This guarantees O(log n) worst-case performance for all operations, with excellent practical performance due to simpler rebalancing than AVL trees.

To install `Container-RedBlackTree`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```smalltalk
Metacello new
  baseline: 'ContainersRedBlackTree';
  repository: 'github://pharo-containers/Container-RedBlackTree/src';
  load
```

## How to depend on it

```smalltalk
spec 
   baseline: 'ContainersRedBlackTree' 
   with: [ spec repository: 'github://pharo-containers/Container-RedBlackTree/src' ].
```

## Why use Containers-RedBlackTree?

Red-Black Trees provide excellent balance between insertion performance and search efficiency, making them ideal for applications requiring frequent insertions with consistent lookup performance.

### Key Benefits

- **Guaranteed Performance**: O(log n) worst-case for all operations
- **Efficient Insertions**: Simpler rebalancing than AVL trees
- **Ordered Iteration**: Automatic sorted traversal
- **Range Queries**: Efficient retrieval of value ranges
- **Memory Efficient**: Lower overhead than other balanced trees

## Red-Black Tree Properties

1. Every node is either red or black
2. The root is always black
3. All nil nodes are black
4. Red nodes cannot have red children
5. Every path from root to nil contains the same number of black nodes

## Basic Usage

```smalltalk
"Create and populate a Red-Black Tree"
tree := CTRedBlackTree new.
tree addAll: #(50 30 70 20 40 60 80).

"Search operations"
tree includes: 30. "=> true"
tree findMin. "=> 20"
tree findMax. "=> 80"

"Range queries"
tree elementsFrom: 35 to: 65. "=> #(40 50 60)"

"Tree automatically stays balanced"
tree validate. "=> true"
tree height. "=> 3 or 4 (guaranteed O(log n))"
```

## Real-World Use Case

```smalltalk
"Event scheduling system - needs fast insertions and range queries"
scheduler := CTRedBlackTree new.
scheduler addAll: #(900 1030 1200 1330 1500 1630).

"Fast operations for busy schedules"
nextMeeting := scheduler successorOf: 1100. "=> 1200"
morningMeetings := scheduler elementsLessThan: 1200.
"=> #(900 1030)"

"Add urgent meeting - tree rebalances automatically"
scheduler add: 1045.
scheduler validate. "=> still perfectly balanced"
```

## Performance Advantage

Red-Black Trees excel with mixed workloads of insertions and lookups:

```smalltalk
database := CTRedBlackTree new.

"Fast bulk loading"
1 to: 10000 do: [ :i | database add: i ].
database height. "=> ~14 (logarithmic)"

"Efficient range queries"
recentRecords := database elementsFrom: 9500 to: 10000.
"=> returns 501 elements efficiently"

"Fast predecessor/successor operations"
database predecessorOf: 5000. "=> 4999"
database successorOf: 5000. "=> 5001"
```

## Contributing

This is part of the Pharo Containers project. Feel free to contribute by implementing additional methods, improving tests, or enhancing documentation.