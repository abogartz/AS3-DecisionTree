AS3-DecisionTree
================

A simple implementation of a decision tree in Actionscript 3

Basic usage:

var branch:Branch;
branch = new Branch("1", "Do you eat meat?", [new Fork("1.1", "yes"), new Fork("1.2", "no")], doChoice);
_tree.addBranch(branch);
branch = new Branch("1.1", "Do you like red meat??", [new Fork("1.1.1", "yes"), new Fork("1.1.2", "no")], doChoice);
_tree.addBranch(branch);
branch = new Branch("1.2", "Do you like faux-meat?", [new Fork("1.2.1", "yes"), new Fork("1.2.2", "no")], doChoice);
_tree.addBranch(branch);
branch = new Branch("1.1.1", "How about a steak?", [new Fork("1", "restart")], doChoice);
_tree.addBranch(branch);
branch = new Branch("1.1.2", "How about some chicken?", [new Fork("1", "restart")], doChoice);
_tree.addBranch(branch);
branch = new Branch("1.2.1", "How about a veggie burger?", [new Fork("1", "restart")], doChoice);
_tree.addBranch(branch);
branch = new Branch("1.2.2", "How about a salad?", [new Fork("1", "restart")], doChoice);
_tree.addBranch(branch);
_tree.init();

Then in your doChoice function:

var fork:Fork = _tree.currentBranch.forks[myChoice];
var nextBranch:Branch = _tree.getBranch(fork.target.id);
_tree.changeBranch(nextBranch);