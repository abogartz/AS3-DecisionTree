/**
 * User: Makai Media Inc.
 * Date: 9/21/12
 * Time: 1:27 PM
 */
package org.osflash.DecisionTree {

	public class Tree {
		private var _branches:Vector.<Branch> = new Vector.<Branch>();

		public var currentBranch:Branch;
		public var stack:Vector.<Branch>=new Vector.<Branch>();
		public function Tree() {
		}

		public function addBranch(branch:Branch):void{
			_branches.push(branch)
		}
		public function updateBranches(){
			currentBranch.evaluate();
		}
		public function getBranch(id:String):Branch{
			for (var i:int = 0; i < _branches.length; i++) {
				 if(_branches[i].id==id){
					 return _branches[i];
				 }
			}
			return null;
		}

		public function changeBranch(branch:Branch):void{
			stack.push(currentBranch);
			currentBranch=branch;
		}

		/**
		 * Initialize the Decision Tree.
		 *		 *
		 * @param startBranch the index of the first branch to use
		 * @return void
		 */
		public function init(startBranch:int=0):void {
			currentBranch=_branches[startBranch];
			for (var i:int = 0; i < _branches.length; i++) {
				for (var j:int = 0; j < _branches[i].forks.length; j++) {
					_branches[i].forks[j].target= getBranch(_branches[i].forks[j].targetID)
				}
			}
		}
	}
}
