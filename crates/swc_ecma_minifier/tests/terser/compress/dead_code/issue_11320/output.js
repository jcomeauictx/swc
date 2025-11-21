// Basic case: empty class with no side effects
// Class with arguments that have side effects should keep the arguments
foo(), bar();
// Class with side effect in super class should be kept
new class extends getSuperClass() {
};
// Class with computed property key should be kept
new class {
    [getKey()]() {}
};
// Class with field initializer should be kept
new class {
    field = sideEffect();
};
// Multiple statements
console.log("before");
console.log("after");
