// Basic case: empty class with no side effects
new class {}

// Class with arguments that have side effects should keep the arguments
new class {}(foo(), bar())

// Class with no side effects but arguments with no side effects
new class {}(1, 2)

// Named class expression (should also be removed)
new class Foo {}

// Class with side effect in super class should be kept
new class extends getSuperClass() {}

// Class with computed property key should be kept
new class { [getKey()]() {} }

// Class with field initializer should be kept
new class { field = sideEffect() }

// Multiple statements
console.log("before");
new class {};
console.log("after");
