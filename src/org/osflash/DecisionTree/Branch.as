/**
 * User: Makai Media Inc.
 * Date: 9/21/12
 * Time: 1:27 PM
 */
package org.osflash.DecisionTree {

	public class Branch {
		public var _forks:Vector.<Fork> = new Vector.<Fork>();
		public var _id:String;
		public var _content:String;
		public var _evaluate:Function;


		public function Branch(id:String, content:String, forks:Array, evaluate:Function) {
			_id = id;
			_content=content;
			for (var i:int = 0; i < forks.length; i++) {
			    _forks.push(forks[i]);
			}
			_evaluate=evaluate;
		}

		public function addFork(fork:Fork):void {
			_forks.push(fork);
		}

		public function evaluate():void{
			  if(_evaluate){
				  _evaluate();
			  }
		}

		public function get content():String {
			return _content;
		}

		public function get id():String {
			return _id;
		}

		public function get forks():Vector.<Fork> {
			return _forks;
		}
	}
}
